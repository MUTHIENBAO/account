<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Cộng điểm</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Cộng điểm khi mới Reset sẽ được lưu mặc định, lần sau Reset sẽ được áp dụng cộng sẵn.</li>
            <li>Khi cần cộng lại, vào chức năng <a href="#char_manager&act=resetpoint" rel="ajax">Tẩy Điểm</a>.</li>
        </ul>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Cộng điểm</span></h1>
    </div>
		<form id="addpoint" name="addpoint" method="post" action="index.php?mod=char_manager&act=addpoint">
		  <input type="hidden" name="action" value="addpoint" />
		  <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-3">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Cộng Điểm </span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Điểm chưa cộng</span></div>
                    <div class="form-col-2">
                        <?php echo number_format($_SESSION['nv_point'], 0, ',', '.'); ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Điểm dự trữ</span></div>
                    <div class="form-col-2">
                        <?php echo number_format($_SESSION['nv_pointdutru'], 0, ',', '.'); ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Tổng Điểm có thể cộng</span></div>
                    <div class="form-col-2">
                        <span class="tag tag-blue" id="point_total"><?php echo number_format($_SESSION['nv_point'] + $_SESSION['nv_pointdutru'], 0, ',', '.'); ?></span>
                    </div>
                    <div class="form-col-3"><div id="addpoint_err"></div></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Sức mạnh </span></div>
                    <div class="form-col-2">
                        <input class="form-style addpoint" type="text" name="str" id="str" value="0" size="4" maxlength="5" />
                    </div>
                    <div class="form-col-3">
                        +<span id="str_view"><?php echo number_format($_SESSION['nv_str'], 0, ',', '.'); ?></span>
                        <label id="msg_str" class="msg"></label>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Nhanh nhẹn </span></div>
                    <div class="form-col-2">
                        <input class="form-style addpoint" type="text" name="dex" id="dex" value="0" size="4" maxlength="5" />
                    </div>
                    <div class="form-col-3">
                        +<span id="dex_view"><?php echo number_format($_SESSION['nv_dex'], 0, ',', '.'); ?></span>
                        <label id="msg_dex" class="msg"></label>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Sức khỏe </span></div>
                    <div class="form-col-2">
                        <input class="form-style addpoint" type="text" name="vit" id="vit" value="0" size="4" maxlength="5" />
                    </div>
                    <div class="form-col-3">
                        +<span id="vit_view"><?php echo number_format($_SESSION['nv_vit'], 0, ',', '.'); ?></span>
                        <label id="msg_vit" class="msg"></label>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Năng lượng </span></div>
                    <div class="form-col-2">
                        <input class="form-style addpoint" type="text" name="ene" id="ene" value="0" size="4" maxlength="5" />
                    </div>
                    <div class="form-col-3">
                        +<span id="ene_view"><?php echo number_format($_SESSION['nv_ene'], 0, ',', '.'); ?></span>
                        <label id="msg_ene" class="msg"></label>
                    </div>
                </div>
<?php if( $_SESSION['nv_class'] >= 64 && $_SESSION['nv_class'] <= 66 ) { ?>

                <div class="form-row">
                    <div class="form-col-1"><span>Mệnh lệnh </span></div>
                    <div class="form-col-2">
                        <input class="form-style addpoint" type="text" name="ml" id="ml" value="0" size="4" maxlength="5" />
                    </div>
                    <div class="form-col-3">
                        +<span id="com_view"><?php echo number_format($_SESSION['nv_com'], 0, ',', '.'); ?></span>
                        <label id="msg_ml" class="msg"></label>
                    </div>
                </div>
<?php } ?>

                <div class="form-row">
                    <div class="form-col-1"><span>Cộng Sẵn Point </span></div>
                    <div class="form-col-2">
                        <input type="checkbox" name="keeppoint" id="keeppoint" value="1" />
                    </div>
                    <div class="form-col-3">
                        
                    </div>
                </div>
                <div class="form-row">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" id="SubmitAddPoint" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?>>Cộng Điểm</button>
                    
                </div>
                <div class="form-row">
                    <br />
                    <a href="#char_manager&act=resetpoint" rel="ajax" class="tag tag-orange">Tẩy Điểm</a> : nếu muốn cộng lại từ đầu<br /><br />
                    <strong>Cộng Sẵn Point</strong> : tích vào nếu muốn sau khi Reset nhân vật có sẵn Point như lần Cộng Điểm này.<br />Nên cộng sẵn 1.000 điểm Năng Lượng để tránh bị mất Skill khi không đủ năng lượng.
                </div>
            </div>
        </form>
</div>
