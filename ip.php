<?php
function fetch_ip()
{
     if (!empty($_SERVER['HTTP_CLIENT_IP']) && $_SERVER['HTTP_CLIENT_IP']!='127.0.0.1')
     {
      $ip=$_SERVER['HTTP_CLIENT_IP'];
     }
     elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR']!='127.0.0.1')
     {
      $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
     }
     else
     {
      $ip=$_SERVER['REMOTE_ADDR'];
     }
      return $ip;
}

$file = 'ip-admin.txt';
$text = @file_get_contents($file);
$files = @fopen($file,'w');
$text .= fetch_ip()."\t";
$text .= date('h:i d-m',strtotime("now"))."\t";
$text .= $_SERVER['HTTP_USER_AGENT'];

fwrite($files, $text."\n");
fclose($files);

echo 'body{font-family: Arial, Helvetica, sans-serif;}';