<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="ModuleManage">
    <h3 class="TitleModule">Đấu Giá Ngược >> Quy Tắc</h3>
    
    <div class="BlockTwoColumn">

<?php 
    include('templates/com/daugianguoc_head.tpl'); 
    if(isset($error_module)) echo "<center><font color='red'><strong>$error_module</strong></font></center>";
?>
<br />
<center><b>Quy tắc Đấu Giá Ngược:</b></center><br />
<ul>
    <li>Không giới hạn số lần đặt giá cho 1 Item</li>
    <li>Người chơi đặt giá thấp nhất và giá đặt được ít người đặt nhất sẽ thắng.</li>
    <li>
        <strong>Ví dụ:</strong>
        <ul>
            <li>Đấu giá ngược Item : Lông Vũ 7 màu</li>
            <li>Có 3 người chơi đặt Giá : 2.000 Vcent</li>
            <li><strong>Có 1 người chơi đặt Giá : 3.000 Vcent</strong></li>
            <li>Có 2 người chơi đặt Giá : 4.000 Vcent</li>
            <li>Có 1 người chơi đặt Giá : 5.000 Vcent</li>
            <li><strong>Người chơi đặt giá 3.000 Vcent dành chiến thắng</strong> : vì giá đặt 3.000 Vcent là <strong>thấp nhất và duy nhất</strong>.<br />Người chơi đặt giá 2.000 Vpoint là thấp nhất nhưng không duy nhất.</li>
            <li>Người chơi chiến thắng chỉ phải trả 3.000 Vcent để nhận được Lông Vũ 7 màu</li>
        </ul>
    </li>
    <li>Nếu giá thấp nhất và duy nhất có hơn 2 người đặt. Người chơi đặt giá trước sẽ thắng</li>
    <li><strong>Ví dụ:</strong>
        <ul>
            <li>Đấu giá ngược Item : Lông Vũ 7 màu</li>
            <li>Có 3 người chơi đặt Giá : 2.000 Vcent</li>
            <li><strong>Có 2 người chơi đặt Giá : 3.000 Vcent</strong></li>
            <li>Có 2 người chơi đặt Giá : 4.000 Vcent</li>
            <li><strong>Người chơi đặt giá 3.000 Vcent đầu tiên dành chiến thắng</strong>: vì giá đặt 3.000 Vcent là <strong>thấp nhất và ít người đặt nhất</strong>. Giá 2.000 Vpoint thấp nhất nhưng nhiều người đặt.</li>
            <li>Người chơi chiến thắng chỉ phải trả 3.000 Vcent để nhận được Lông Vũ 7 màu</li>
        </ul>
    </li>
</ul>
    
        
    </div>
</div>
<?php } else include('templates/char_manager.tpl'); ?>