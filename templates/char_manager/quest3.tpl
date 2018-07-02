<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Làm nhiệm vụ Cấp 3</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
        <div class="form-2">
            <div class="form-row">
                <div class="form-col-1"><span>Nhân vật </span></div>
                <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                </div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Chi phí</span></div>
                <div class="form-col-2"><?php echo number_format($quest3_price, 0, ',', '.'); ?> Gcent</div>
            </div>
            <div class="form-row">
                <div class="form-col-1"><span>Đổi nhân vật</span></div>
                <div class="form-col-2"><?php echo $doinv; ?></div>
            </div>
            <div class="form-submit">
                    <button class="btn btn-green btn-block btn-lg" id="quest3" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Làm nhiệm vụ Cấp 3</button>
                    <div id="msg_quest3"></div>
            </div>
        </div>
    </div>
</div>