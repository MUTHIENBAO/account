<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/

//Kiểm tra quyền Ghi Folder
$folder[]   =   'data';
$folder[]   =   'config';

$write_flag = false;

$content_checkwrite = '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />';
$content_checkwrite .= "<ul>";
for ($i=0;$i<count($folder);$i++)
{
	$notice_write = null;
    
	if(!is_dir($folder[$i])) {
	   $notice_write .= "<font color=red>Thư mục <strong>'{$folder[$i]}'</strong> Không tồn tại. Vui lòng kiểm tra lại.</b></font>";
       $write_flag = true; 
	} else {
	   if(!is_writable($folder[$i])) { 
            $notice_write .= "<font color=red>Thư mục <strong>'{$folder[$i]}'</strong> Không thể Ghi. Vui lòng chuyển <b>Folder permission</b> sang <b>777</b></font>"; 
            $write_flag = true;
        }
        
        if ($folder_read = opendir($folder[$i])) {
            $notice_write .= "<ul>";
            while ($item = readdir($folder_read)) {
        		if ($item != "." && $item != "..") {
            		//Is File
            		if ( is_file($folder[$i]."/".$item) ) {
                        if(!is_writable($folder[$i]."/".$item)) {
                           $notice_write .= "<li><font color=red> <strong>'". $folder[$i]."/".$item ."'</strong> Không thể Ghi. Vui lòng chuyển <b>File permission</b> sang <b>666</b></font></li>";
                           $write_flag = true; 
                        }
        			}
        		}
        	}
            closedir($folder_read);
            unset($item);
            $notice_write .= "</ul>";
        }
	}
	if($write_flag === true) {
		$content_checkwrite .= "<li>Folder <font color='blue'><b>". $folder[$i] ."</b></font> : $notice_write</li>";
	}
}
$content_checkwrite .= "</ul>";

if($write_flag === true) {
?>
<center>
	Để <b>file</b> có thể ghi : Vui lòng sử dụng chương trình <a href='http://filezilla-project.org/download.php' target='_blank'><b>FileZilla</b></a> chuyển <b>File permission</b> sang <b>666</b><br>
	Để <b>thư mục</b> có thể ghi : Vui lòng sử dụng chương trình <a href='http://filezilla-project.org/download.php' target='_blank'><b>FileZilla</b></a> chuyển <b>File permission</b> sang <b>777</b><br>
	<img src="images/chmod.jpg">
</center>
<?php
    echo $content_checkwrite;
    exit();
}
?>