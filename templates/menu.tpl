<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head>
<meta http-equiv="content-type" content="text/html; charset=windows-1251">
<title>�������������� ���������� ���� ���������� ��������� �� �������� ���-��������� � ��������� ������</title>
<link rel="stylesheet" href="css/style.css" type="text/css">

<style>
		#menu{
			list-style:none;
			padding:0;
			margin:0;
			font-size: 100%;
			font-family: Georgia;
		}
		#menu li{
			float:left;
			height:33px;
			padding:0;
			margin:0;
			width:180px;
			text-align:center;
			background:#006666;
			position:relative;
			padding-top: 12px;
		}
		#menu li ul{
			list-style:none;
			padding:0;
			margin:0;
			width:180px;
			display:none;
			position:absolute;
			left:0;
			top:45px;
		}
		#menu li ul li{
			float:none;
			height:33px;
			margin:0;
			width:180px;
			text-align:center;
			background:#007777;
		}
		#menu li a{
			display:block;
			width:180px;
			height:33px;
			color: #fff;
			text-decoration: none;
		}
		#menu li:hover ul, #menu li.jshover ul{
			display:block;  
		}
		#menu li:hover, #menu li.jshover{
			background:#004444;
		}
		.back
		{
		width:100%;
		background:#006666;
		height: 45px;
		}
</style>
    <script>
		jsHover = function() {
		var hEls = document.getElementById("menu").getElementsByTagName("li");
		for (var i=0, len=hEls.length; i<len; i++) {
		hEls[i].onmouseover=function() { this.className+=" jshover"; }
		hEls[i].onmouseout=function() { this.className=this.className.replace(" jshover", ""); }
		}
		}
		if (window.attachEvent && navigator.userAgent.indexOf("Opera")==-1) window.attachEvent("onload", jsHover);
    </script>
</head>
<body>
<!-- BEGIN cell -->
<!-- ��������� ������ ������ �� ���� ������! -->
<div id="wrap">
	<div id="headline">
		<a href="index.php">�������������� ���������� ���� ���������� ��������� �� �������� ���-��������� � ��������� ������</a> 
	</div>
		<div id="content" class="clearfix">
	<div class="back">
		<ul id="menu">
			<li><a href="index.php">�����������: {username}</a>

 				<ul>
					<li><a href="index.php?oper=user">���������</a></li>
					<li><a href="index.php?oper=exit">�����</a></li>					
				</ul>		
				
			</li>
			<li>
				<a href="index.php?oper=main">������ � �����</a>

 				<ul>
					<li><a href="index.php?oper=report&filtr=filtr">�������� �����</a></li>
				</ul>
			</li>		
			<li>
				<a href="index.php?oper=main&filtr=filtr">Գ��������</a>
<!--				
				<ul>
					<li><a href="#">�������� �1</a></li>
					<li><a href="#">�������� �2</a></li>
					<li><a href="#">�������� �3</a></li>
					<li><a href="#">�������� �4</a></li>
					<li><a href="#">�������� �5</a></li>
				</ul>
-->
			</li>
			<li>
				<a href="index.php?oper=main">��������� �������</a>
				<ul>
					<li><a href="index.php?oper=report1&filtr=filtr">�������</a></li>
					<li><a href="index.php?oper=report2&filtr=filtr">�����</a></li>
					<li><a href="index.php?oper=report3&filtr=filtr">����������</a></li>
					<li><a href="index.php?oper=report4&filtr=filtr">����� ������</a></li>															
				</ul>
			</li>
			<li>
				<a href="index.php?oper=help">����������</a>
				<ul>
					<li><a href="index.php?oper=help">�������� �����</a></li>
					<li><a href="index.php?oper=help">�����������</a></li>
					<li><a href="index.php?oper=help">Գ��������</a></li>
					<li><a href="index.php?oper=help">��������� ����</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>
<!-- END cell -->
