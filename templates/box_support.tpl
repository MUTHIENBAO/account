<?php if( !in_array($_SESSION[mu_username], $quantri_arr )) { ?>
<a href="#support&act=inbox" title="Hộp tin : <?php echo $unread; ?> tin mới"><div class="notice-top"><div class="badge"><?php echo $unread; ?></div></div></a>
<?php } else { ?>     
<a href="#support&act=adm_inbox" title="Quản lý : <?php echo $support_notans; ?> hỗ trợ"><div class="task-top"><div class="badge"><?php echo $support_notans; ?></div></div></a>
<?php } ?>