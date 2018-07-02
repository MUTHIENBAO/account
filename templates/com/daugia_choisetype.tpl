<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Chọn Loại Item</h1>
    </div>
</div>



<div class="priority-block out-top-20">
    <div class="in-20">
<?php 
    include('templates/com/daugia_head.tpl'); 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>


<?php 
    if(isset($_SESSION['mu_nvchon'])) { 
    if(count($group_item) > 0) {
    foreach($group_item as $group_val) {
?>

	<a href="#com&act=daugia&page=daugia_biding&type=<?php echo $group_val['group_type']; ?>" rel="ajax" class="cont05">
		<p><img src="images/dot.png" alt="" /><?php echo $group_val['group_name']; ?>
		<span><strong><?php echo $group_val['group_count']; ?></strong> Item đang bán</span></p>
	</a>
    
<?php } } else echo "<center><strong>Không có Item nào đang bán</strong></center>"; ?>

<?php } ?>

        
    </div>
</div>