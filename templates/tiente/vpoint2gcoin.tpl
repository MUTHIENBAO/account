<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Đổi Vcent sang Gcent</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
<form id="gcoin2vpoint" name="gcoin2vpoint" method="post" action="index.php?mod=tiente&act=vpoint2gcoin">

    <input type="hidden" name="action" value="vpoint2gcoin" />
    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">Tỷ giá</div>
            <div class="form-col-2">
                <div class="caption-block caption-blue">Gcent nhận = 80% Vcent đổi</div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-col-1">Vcent đang có</div>
            <div class="form-col-2">
                <div class="caption-block caption-blue"><?php echo number_format($_SESSION['acc_vpoint'], 0, ',', '.'); ?> Vcent</div>
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-col-1">Vcent muốn đổi</div>
            <div class="form-col-2">
                <input class="form-style" type="text" name="vpoint" id="vpoint" size="5" maxlength="10"/>
            </div>
            <div class="form-col-3">
                <span class="form-middle">.000</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2">
                <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
            </div>
        </div>

        <div class="form-submit">
            <button class="btn btn-green btn-lg" type="submit" name="Submit">Đổi Vcent sang Gcent</button>
        </div>
    </div>
</form>
    </div>
</div>
