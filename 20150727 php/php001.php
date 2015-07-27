<html>
  <head>
    <mata charset=utf-8>
    <title>first PHP</title>
  </head>
  <body>
<?php
  $sysos = $_SERVER["SERVER_SOFTWARE"];
  $sysversion = PHP_VERSION;
  // 连接数据库，获得版本信息
  mysql_connect("localhost","root","123456");
  $mysqlinfo = mysql_get_server_info();
  // 获取GD库信息
  if(function_exists("gd_info")){
    $gd = gd_info();
    $gdinfo = $gd['GD Version'];
  }else{
    $gdinfo = "未知";
  }

  // 是否支持FreeType
  $freetype = $gd["FreeType Support"]? "支持":"不支持";

  // 前端和PHP配合的时候就是需要用直接把Class写到echo中，至于数据从php连接到MySQL进行显示
  echo "<table align = center cellspacing=0 cellpadding=0>";
  echo "<caption><h2>系统信息</h2></caption>";
  echo "<tr><td>Web服务器 </td><td>$sysos</td></tr>";
?>
  </body>
</html>