<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Mua Bùa Thiên Sứ</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">
        <div class="form-2">
            <div class="form-row">
                <div class="form-col-1"><span>Nhân vật mua </span></div>
                <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                </div>
            </div>

            <div class="form-row">
                <div class="form-col-1"><span>Gói Bùa</span></div>
                <div class="form-col-2">

                    <select name="buats_choise" id="buats_choise" class="form-style">
                        <?php 
                        for($i=0; $i<$buats_slg; $i++) {
                            echo '<option value="'. $i .'">Bùa '. $buats_day[$i] .' ngày = '. number_format($buats_price[$i], 0, ',', '.') .' Gcent</option>';
                        }
                        ?>
                        
                    </select>
                </div>
            </div>
            <div class="form-submit">
                    <button class="btn btn-green btn-block btn-lg" id="buats_buy" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Mua Bùa Thiên Sứ</button>
                    <div id="msg_buats"></div>
            </div>
        </div>
    </div>
</div>