<?php

function fromtemplate($s_tpl, $data) {

//echo 'Шаблон: '.$s_tpl;
$tpl = new HTML_Template_IT("./templates");
$tpl->loadTemplatefile($s_tpl, true, true);

$tpl->setCurrentBlock("cell") ;
foreach($data as $key=>$cell) {
// Assign data to the inner block
	$tpl->setVariable($key, $cell) ;
};

$tpl->parseCurrentBlock("cell") ;	
	// print the output
$tpl->show();

};



function fromtemplatesql($s_tpl, $s_sql='',$s_where='',$s_order='',$startrow='0',$field=0) {

//echo 'Шаблон: '.$s_tpl;
global $bordercolor, $bgcolor, $bordercolor1, $bgcolor1, $bordercolor2, $bgcolor2, $deltarow; 

$tpl = new HTML_Template_IT("./templates");
$tpl->loadTemplatefile($s_tpl, true, true);

if ($s_sql!='') {
	$query=implode("\n",file($s_sql));
	if ($s_where!='') {
		$query = str_replace("%WHERE%", ' and '.$s_where, $query);
	};
	if ($s_order!='') {
		$query = str_replace("%ORDER%", ' order by '.$s_order, $query);
	} else 		
		$query = str_replace("%ORDER%", '', $query);

	if ($startrow!='') {
		$query = str_replace("%STARTROW%", $startrow, $query);
	} else 
		$query = str_replace("%STARTROW%", '0', $query);	


	$result = mysql_query($query) or die("Query failed : " . mysql_error());		 
	$bool_first=0;
	while ($line = mysql_fetch_array($result, MYSQL_ASSOC))  {
		$bool_first++;
		if ($bool_first==1) {
			
		if ($field>0) {
		    foreach($line as $key=>$cell) {
		        // Assign data to the inner block
		        $tpl->setCurrentBlock("cell") ;
		        $tpl->setVariable("DATA", $key) ;
		        $tpl->parseCurrentBlock("cell") ;
		    }
		};
		    // Assign data and the inner block to the
		    // outer block
		    $tpl->setCurrentBlock("row") ;
		    $tpl->setVariable("class", "row") ;
		    $tpl->parseCurrentBlock("row") ;
		
		}
	    foreach($line as $key=>$cell) {
	        // Assign data to the inner block
	        $tpl->setCurrentBlock("cell") ;
			if ($key=="id") {
				$tpl->setVariable("DATA", '<input type="radio" name="id" value="'.$cell.'">'.($bool_first+$startrow)) ;		
			} else {
	        	$tpl->setVariable("DATA", " ".$cell) ;
			}
	        $tpl->parseCurrentBlock("cell") ;
	    }
	    // Assign data and the inner block to the
	    // outer block
	    $tpl->setCurrentBlock("row") ;
		if (($bool_first%2)==1) {	
		    $tpl->setVariable("class", "row1") ;
		} else {
		    $tpl->setVariable("class", "row2") ;
		};
	    $tpl->parseCurrentBlock("row") ;
	};
};

	$tpl->setCurrentBlock("row2") ;
    $tpl->setVariable("class", "row") ;
$s=readsql('SELECT FOUND_ROWS() as allrecords'); 

$prev = $startrow - $deltarow;
$next=$startrow+$deltarow;
if ($prev<0) $prev=0;
if ($bool_first+$startrow>=$s['allrecords']) $next=$startrow;



    $tpl->setVariable("prev", $prev) ;
    $tpl->setVariable("next", $next) ;		
    $tpl->setVariable("order", $s_order) ;			
    $tpl->setVariable("allrecords", $s['allrecords']) ;				
	$tpl->parseCurrentBlock("row2") ;

	
	// print the output
$tpl->show();

};

////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////
function typecb($par,$value=0)  {

$query="select id, $par from $par order by id";
$result = mysql_query($query) or die("Query failed : " . mysql_error());		 

$str = '<select name="'.$par.'">';
$str .= '<option ';
if ($value==0) 
	$str .= ' selected ';
$str .= ' value="0">Вибір</option>';
while ($line = mysql_fetch_array($result, MYSQL_ASSOC))  {
	$str .= '<option ';
	if ($line["id"]==$value) 
		$str .= ' selected';
	$str .= ' value="'.$line["id"].'">'.$line[$par].'</option>';
};
    $str .= '</select>';
	return $str;
};

function typetext($par,$value='')  {
	return '<input type="text" name="'.$par.'"  size="40" value="'.$value.'">';
};

function typeint($par,$value='0')  {
	return '<input type="text" name="'.$par.'"  size="40" value="'.$value.'">';
};

function typedate($par,$value='0000-00-00')  {
	return '<input type="text" name="'.$par.'"  size="40" value="'.$value.'">';
};


function typetip($par,$value)  {
global $userparam;
if ($userparam["raj"]<>0) {
	$value["raj"]=$userparam["raj"];
};
$query="select * from atribut where $par>0 and (pole<>'dedit' or '$par'='filtr') and (pole<>'raj' or 0=".$userparam["raj"].") order by $par,id";
$result = mysql_query($query) or die("Query failed : " . mysql_error());		 
	$str=$value["error"];
	$str.='<form name="'.$par.'" method="post" action="index.php">';
while ($line = mysql_fetch_array($result, MYSQL_ASSOC))  {
	$str.= $line["nazva"];
	$str.=  "<br>";
	$str.= call_user_func($line["elem"],$line["pole"],$value[$line["pole"]]);
	$str.= "<br>\n";
};
    $str .= '<input type="hidden" name="oper" value="spd">';
    $str .= '<input type="hidden" name="vvod" value="'.$par.'">';
	if (isset($value["id"])) {	 
	    $str .= '<input type="hidden" name="id" value="'.$value["id"].'">';	
	};
	if ($par=="filtr") {
  	$str .= '  <input type="submit" name="filtr" class="filtrsubmit" value="Фільтрувати" title="Фільтрувати">';
	} else {
  	$str .= '<input type="submit" name="cancel" class="cancelsubmit" value="Відміна" title="Відміна" >';
  	$str .= '<input type="submit" name="save" class="savesubmit" value="Записати" title="Записати">';
	};
    $str.= '</form>';
	
	if ($par=="filtr") {
		fromtemplate("filtr.tpl",array("DATA" =>$str));	
	} else 
		fromtemplate("vvod.tpl",array("DATA" =>$str));
};


function loginuser() {
if(isset($_SESSION['user']))
    {
       // Identifying the user
        return $_SESSION['user'];
    }
else
    {
       // Code for Logged members
        if(isset($_REQUEST['username']) && isset($_REQUEST['password']))
            {
                // Section for logging process -----------
				$query='select * from user where login="'.trim($_REQUEST['username']).'" and password="'.trim($_REQUEST['password']).'"';
				$result = mysql_query($query) or die("Query failed : " . mysql_error());					
				if ($line = mysql_fetch_array($result, MYSQL_ASSOC))  {		
                	$_SESSION['user'] = $line["id"];                    
					inituser($line["id"],$line["raj"]);
  			        return $_SESSION['user'];				
				} else {
					$_REQUEST['oper']='exit';
  			        return 0;									
				};
			} else {
				$_REQUEST['oper']='exit';
		        return 0;													
			}
//			exit();
    }
};

function inituser($user,$raj) {
	makesql("delete from filtr where user=".$user);		
	makesql("insert into filtr (user,raj) values (".$user.",".$raj.")");			
return 1;
};

function makesql($query) {
	$result=mysql_query($query) or die("Query failed : " . mysql_error()) ;
};

function readsql($query) {
	$result=mysql_query($query) or die("Query failed : " . mysql_error()) ;
	return mysql_fetch_array($result, MYSQL_ASSOC);
};


function textsqlinsert($data) {
$query='select * from atribut where '.$data["vvod"].'<>0';
$result = mysql_query($query) or die("Query failed : " . mysql_error());					
$fields='';
$values='';
$i=0;
while ($line = mysql_fetch_array($result, MYSQL_ASSOC))  {		
	$i++;
	if ($i>1) {
		$fields .=',';
		$values .=',';	
	};
	$fields .= $line["pole"];	
	switch ($line["elem"]) {
    	case "typecb":	
			$values .= mysql_real_escape_string($data[$line["pole"]]);	
			break;
    	case "typetext":	
			$values .= '"'.mysql_real_escape_string($data[$line["pole"]]).'"';			
			break;
    	case "typedate":	
			$values .= '"'.mysql_real_escape_string($data[$line["pole"]]).'"';					
			break;
    	case "typeint":	
			$values .= mysql_real_escape_string('0'.trim($data[$line["pole"]]));					
			break;
	};
};
return '('.$fields.') values ('.$values.')';
};

function textsqlupdate($data) {
$query='select * from atribut where '.$data["vvod"].'<>0';
$result = mysql_query($query) or die("Query failed : " . mysql_error());					
$values='';
$i=0;
while ($line = mysql_fetch_array($result, MYSQL_ASSOC))  {		
	$i++;
	if ($i>1) {
		$values .=',';	
	};
	$fields .= $line["pole"];	
	switch ($line["elem"]) {
    	case "typecb":	
			$values .= $line["pole"].'='.mysql_real_escape_string($data[$line["pole"]]);	
			break;
    	case "typetext":	
			$values .= $line["pole"].'='.'"'.mysql_real_escape_string($data[$line["pole"]]).'"';			
			break;
    	case "typedate":	
			$values .= $line["pole"].'='.'"'.mysql_real_escape_string($data[$line["pole"]]).'"';					
			break;
    	case "typeint":	
			$values .= $line["pole"].'='.mysql_real_escape_string('0'.trim($data[$line["pole"]]));					
			break;
	};
};
	return $values;	
};

function testvvod($data) {
$error="";
	if ($data["tiposob"]==0) {
		$error .= '<b class="error">Помилка! Не вказаний тип особи!</b><br>';
	};
	if ($data["tipspd"]==0) {
		$error .= '<b class="error">Помилка! Не вказаний тип об`єкта СПД!</b><br>';
	};
	if ($data["nazva"]=="") {
		$error .= '<b class="error">Помилка! Не вказана назва СПД!</b><br>';
	};
	if ($data["kod"]=="") {
		$error .= '<b class="error">Помилка! Не вказаний код ЄДРПОУ!</b><br>';
	};
	if ($data["kod"]=="") {
		$error .= '<b class="error">Помилка! Не вказане ПІБ керівника/власника!</b><br>';
	};
	if ($data["uradresa"]=="") {
		$error .= '<b class="error">Помилка! Не вказана юридична адреса!</b><br>';
	};

	return $error;
};

?>