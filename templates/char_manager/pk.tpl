<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Rửa tội</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

    	<table class="table table-blue table-border-2 table-text-center">
		  <thead>
            <tr>
                <th scope="col" align="center">PK</th>
                <th scope="col" align="center">Phí</th>
		    </tr>
          </thead>
            <tbody>
		  <tr>
		    <td><div align="center">Giết <= <?php echo $pk_zen_vpoint; ?> mạng</div></td>
		    <td><div align="center"><?php echo number_format($pk_zen, 0, ',', '.'); ?> Zen/mạng</div></td>
		  </tr>
		  <tr>
		    <td><div align="center">Giết > <?php echo $pk_zen_vpoint; ?> mạng</div></td>
		    <td><div align="center"><?php echo number_format($pk_vpoint, 0, ',', '.'); ?> Vcent/mạng</div></td>
		  </tr>
            </tbody>
		</table>
    	<br><br>
    	<form id="reset" name="reset" method="post" action="index.php?mod=char_manager&act=pk">
    		  <input type="hidden" name="action" value="pk" />
    		  <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Rửa tội </span></div>
                    <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>
                <div class="line"></div>
                <p class="in-10">Điều kiện Rửa tội</p>
                <div class="form-row">
                    <div class="form-col-1"><span>Đổi nhân vật</span></div>
                    <div class="form-col-2">
                        <?php echo $doinv; ?>
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; }  ?> >Rửa tội</button>

                </div>
            </div>
        </form>
    </div>
</div>