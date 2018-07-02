<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Relife</h1>
    </div>
</div>

<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <div id="rs_content">
            <ul class="noted in-left-10">
                <li>Phải Relife khi đạt mốc Reset tương ứng</li>
                <li>Relife không cần cởi đồ</li>
                <li>Zen để trên người nhân vật</li>
                <li>Nguyên Liệu gửi vào Ngân Hàng</li>
            </ul>
        </div>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">



		<form id="relife" name="relife" method="post" action="index.php?mod=char_manager&act=relife">
		  	<input type="hidden" name="action" value="relife" />
		    <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Reset</span></div>
                    <div class="form-col-2">
                        <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>

                <div class="line"></div>
                <div class="form-row">
                    <div class="form-col-1"><span>ReLife lần thứ</span></div>
                    <div class="form-col-2">
                        <?php echo $_SESSION['nv_relife']+1; ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Reset</span></div>
                    <div class="form-col-2">
                        <?php echo $rl_reset_relifes; ?>
                    </div>
                    <div class="form-col-3"><? echo $notice_reset; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Cấp độ</span></div>
                    <div class="form-col-2">400</div>
                    <div class="form-col-3"><?php echo $notice_level; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span class="bank-icon bank-zen"></span> <span>Zen</span></div>
                    <div class="form-col-2">
                        <?php echo number_format($rl_zen_relifes, 0, ',', '.'); ?>
                    </div>
                    <div class="form-col-3"><?php echo $notice_zen; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span class="bank-icon bank-chaos"></span> <span>Chaos</span></div>
                    <div class="form-col-2">
                        <?php echo $rl_chao_relifes; ?>
                    </div>
                    <div class="form-col-3"><? echo $notice_chao; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span class="bank-icon bank-creation"></span> <span>Creation</span></div>
                    <div class="form-col-2">
                        <?php echo $rl_cre_relifes; ?>
                    </div>
                    <div class="form-col-3"><? echo $notice_cre; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span class="bank-icon bank-blue"></span> <span>Blue</span></div>
                    <div class="form-col-2">
                        <?php echo $rl_blue_relifes; ?>
                    </div>
                    <div class="form-col-3"><? echo $notice_blue; ?></div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-row">
                    <div class="form-col-1"><span>Thoát Game</span></div>
                    <div class="form-col-2">
                        <?php echo $online; ?>
                    </div>
                    <div class="form-col-3">&nbsp;</div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?> >ReLife</button>

                </div>
            </div>
        </form>
    </div>
</div>
<div class="out-top-20">
        <table class="table table-blue table-border-1 table-text-center">
		  <tr bgcolor="#FFFFFF">
		    <td colspan="9" align="center">ReLife là bắt buộc khi đạt mức Reset quy định</td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		    <th align="center" scope="col">ReLife</th>
		    <th align="center" scope="col">Reset</th>
		    <th align="center" scope="col">Level</th>
		    <th align="center" scope="col">Point</th>
		    <th align="center" scope="col">Mệnh lệnh</th>
            <th align="center" scope="col">Zen</th>
            <th align="center" scope="col">Chao</th>
            <th align="center" scope="col">Cre</th>
            <th align="center" scope="col">Blue</th>
		  </tr>
          <?php for($i=1; $i<= $cap_relife_max; $i++) { ?>
		  <tr bgcolor="#FFFFFF">
		    <td align="center"><?php echo $i; ?></td>
		    <td align="center"><?php echo number_format($rl_reset_relife[$i], 0, ',', '.'); ?></td>
		    <td align="center">400</td>
		    <td align="center"><?php echo number_format($rl_point_relife[$i], 0, ',', '.'); ?></td>
		    <td align="center"><?php echo number_format($rl_ml_relife[$i], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($rl_zen_relife[$i], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($rl_chao_relife[$i], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($rl_cre_relife[$i], 0, ',', '.'); ?></td>
            <td align="center"><?php echo number_format($rl_blue_relife[$i], 0, ',', '.'); ?></td>
		  </tr>
          <?php } ?>
		</table>
</div>