<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi Gcent sang Vcent</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<form id="gcoin2vpoint" name="gcoin2vpoint" method="post" action="index.php?mod=tiente&act=gcoin2vpoint">
    <input type="hidden" name="action" value="gcoin2vpoint" />


    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">Tỷ giá</div>
            <div class="form-col-2">
                <div class="caption-block caption-blue">1 Gcent = 1 Vcent</div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Gcent đang có</div>
            <div class="form-col-2">
                <div class="caption-block caption-blue"><?php echo number_format($_SESSION['acc_gcoin'], 0, ',', '.'); ?> Gcent</div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-col-1"><span>GCent</span></div>
            <div class="form-col-2">
                <input class="form-style" type="text" name="gcoin" id="gcoin" size="14" maxlength="10"/>
            </div>
            <div class="form-col-3">
                <span class="form-middle">đổi sang VCent</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1"><span>Mật khẩu cấp 2</span></div>
            <div class="form-col-2"><input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
            </div>
        </div>

        <div class="form-submit">
            <button class="btn btn-green btn-lg" type="submit" name="Submit">Đổi Gcent sang Vcent</button>
		</div>
    </div>
</form>
        
    </div>
</div>