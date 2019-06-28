<?php
session_start();	
require_once "HTML/Template/IT.php";
require_once "connect.php";
require_once "procedure.php";
require_once "config.php";
// не работаем без авторизации
$user=loginuser();

if(isset($_REQUEST['oper'])) {
	$oper=$_REQUEST['oper']; 
} else {
	$oper="main";
};


if ($user&&($oper!="exit")) {
	$userparam=readsql('select * from user where id=0'.$user);
	fromtemplate("menu.tpl",array("username" => $userparam['login']));
} else {
	$userparam=readsql('select * from user where id=0'.$user);
	fromtemplate("menu.tpl",array("username" => 'Гость'));
};





//foreach($_REQUEST as $key=>$cell) echo "$key=>$cell";


switch ($oper) {
    case "exit":
		session_destroy();
 		fromtemplate("login.tpl",array("login" => "Введіть логін та пароль."));
        break;
    case "main":
		if (isset($_REQUEST["del"])) {
			makesql("delete from spd where id=0".$_REQUEST["id"]);
		};
		if (isset($_REQUEST["edit"])) {
			$line=readsql("select * from spd where id=0".$_REQUEST["id"]);		
			if (isset($line["tipspd"])) {
				typetip('tip'.$line["tipspd"],$line);
			} else 	{
				fromtemplatesql("main.tpl", "sql/main.sql", "f.user=".$user,$_REQUEST["order"],$_REQUEST["startrow"]);	
				fromtemplatesql("mainfiltr.tpl", "sql/filtr.sql", "f.user=".$user);	
			};
		} else 
		if (isset($_REQUEST["add1"])) {
			typetip('tip1',array("tipspd" => 1));
		} else 
		if (isset($_REQUEST["add2"])) {
			typetip('tip2',array("tipspd" => 2));
		} else 
		if (isset($_REQUEST["add3"])) {
			typetip('tip3',array("tipspd" => 3));
		} else 
		if (isset($_REQUEST["add4"])) {
			typetip('tip4',array("tipspd" => 4));
		} else 
		if (isset($_REQUEST["filtr"])) {
			typetip('filtr',array());
		} else 	{
				if ($user==99) {
				fromtemplatesql("main_read.tpl", "sql/main.sql", "f.user=".$user,$_REQUEST["order"],$_REQUEST["startrow"]);	
				} else
				fromtemplatesql("main.tpl", "sql/main.sql", "f.user=".$user,$_REQUEST["order"],$_REQUEST["startrow"]);								
				fromtemplatesql("mainfiltr.tpl", "sql/filtr.sql", "f.user=".$user);					
		};
        break;		
    case "spd":
		if (isset($_REQUEST["save"])) {
			$error=testvvod($_REQUEST);
			if ($error!="") {
				typetip($_REQUEST["vvod"],array_merge(array("error"=>$error), $_REQUEST));				
		        break;				
			};
			if ($userparam["raj"]<>0) {
				$_REQUEST["raj"]=$userparam["raj"];
			};
			$_REQUEST["dedit"]=date("Y-m-d");
			if (isset($_REQUEST["id"])) {
				$query="update spd set ".textsqlupdate($_REQUEST)." where id=".$_REQUEST["id"];
			} else {
				$query="insert into spd ".textsqlinsert($_REQUEST);
			};
//			echo($query);
			makesql($query);
		};
		if (isset($_REQUEST["filtr"])) {
			if ($userparam["raj"]<>0) {
				$_REQUEST["raj"]=$userparam["raj"];
			};
			$query="update filtr set ".textsqlupdate($_REQUEST)." where user=".$user;
//			echo($query);
			makesql($query);
		};
		fromtemplatesql("main.tpl", "sql/main.sql", "f.user=".$user,$_REQUEST["order"],$_REQUEST["startrow"]);	
		fromtemplatesql("mainfiltr.tpl", "sql/filtr.sql", "f.user=".$user);			
        break;
    case "report":
		if ($user==99) {
			fromtemplatesql("alltable.tpl", "sql/alltable.sql", "99=".$user,"",0,1);
		} else {
			echo "<b>Для користувача ".$userparam["login"]." даний режим не передбачений.<b>";
		};
        break;
    case "report1":
		fromtemplatesql("report1.tpl", "sql/report1.sql", "f.user=".$user);
        break;
    case "report2":
		fromtemplatesql("report2.tpl", "sql/report2.sql", "f.user=".$user);
        break;
    case "report3":
		fromtemplatesql("report3.tpl", "sql/report3.sql", "f.user=".$user);
        break;
    case "report4":
		fromtemplatesql("report4.tpl", "sql/report4.sql", "f.user=".$user);
        break;
    case "user":
		if (isset($_REQUEST["naselen"])) {	
			$userparam["naselen"]=mysql_real_escape_string($_REQUEST["naselen"]);
			$query="update raj set naselen= 0".$userparam["naselen"]." where id=".$userparam["raj"];
			makesql($query);
		} else {	
		    $arr=readsql("select naselen from raj where id=0".$userparam["raj"]);
			$userparam["naselen"]=$arr["naselen"];
		};
 		fromtemplate("user.tpl",array("naselen" => $userparam["naselen"]));
        break;
   case "help":
		fromtemplate("help.tpl", array("email" => ""));
        break;		
	default:
       echo "Інструкція користувача!";
		
}


fromtemplate("footer.tpl",array("email" => ""));

?>
