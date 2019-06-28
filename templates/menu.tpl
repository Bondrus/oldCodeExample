<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html><head>
<meta http-equiv="content-type" content="text/html; charset=windows-1251">
<title>Автоматизована електронна база дислокації юридичних та фізичних осіб-підприємців в Луганській області</title>
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
<!-- Заголовок всегда ссылка на саму статью! -->
<div id="wrap">
	<div id="headline">
		<a href="index.php">Автоматизована електронна база дислокації юридичних та фізичних осіб-підприємців в Луганській області</a> 
	</div>
		<div id="content" class="clearfix">
	<div class="back">
		<ul id="menu">
			<li><a href="index.php">Авторизація: {username}</a>

 				<ul>
					<li><a href="index.php?oper=user">Параметри</a></li>
					<li><a href="index.php?oper=exit">Вихід</a></li>					
				</ul>		
				
			</li>
			<li>
				<a href="index.php?oper=main">Робота з базою</a>

 				<ul>
					<li><a href="index.php?oper=report&filtr=filtr">Внесення даних</a></li>
				</ul>
			</li>		
			<li>
				<a href="index.php?oper=main&filtr=filtr">Фільтрація</a>
<!--				
				<ul>
					<li><a href="#">Подпункт №1</a></li>
					<li><a href="#">Подпункт №2</a></li>
					<li><a href="#">Подпункт №3</a></li>
					<li><a href="#">Подпункт №4</a></li>
					<li><a href="#">Подпункт №5</a></li>
				</ul>
-->
			</li>
			<li>
				<a href="index.php?oper=main">Отримання звітності</a>
				<ul>
					<li><a href="index.php?oper=report1&filtr=filtr">Торгівля</a></li>
					<li><a href="index.php?oper=report2&filtr=filtr">Ринки</a></li>
					<li><a href="index.php?oper=report3&filtr=filtr">Харчування</a></li>
					<li><a href="index.php?oper=report4&filtr=filtr">Сфера послуг</a></li>															
				</ul>
			</li>
			<li>
				<a href="index.php?oper=help">Інструкція</a>
				<ul>
					<li><a href="index.php?oper=help">Внесення даних</a></li>
					<li><a href="index.php?oper=help">Редагування</a></li>
					<li><a href="index.php?oper=help">Фільтрація</a></li>
					<li><a href="index.php?oper=help">Отримання звітів</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>
<!-- END cell -->
