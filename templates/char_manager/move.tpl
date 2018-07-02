<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Di chuyển</h1>
    </div>
</div>

<div class="primary-block out-top-20">
    <div class="in-20">

        <form id="move" name="move" method="post" action="index.php?mod=char_manager&act=move">
              <input type="hidden" name="action" value="move" />
              <input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />
            <div class="form-2">
                <div class="form-row">
                    <div class="form-col-1"><span>Nhân vật Cần di chuyển </span></div>
                    <div class="form-col-2">
                    <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-col-1"><span>Khu vực chuyển đến</span></div>
                    <div class="form-col-2">

                        <select name="location" class="form-style">
                                <option value="loren">Lorencia</option>
                                <option value="noria">Noria</option>
                            </select>
                    </div>
                </div>
                <div class="form-submit">

                        <button class="btn btn-green btn-block btn-lg" type="submit" name="Submit" <?php if($accept=='0') { echo 'disabled="disabled"'; } ?> >Di chuyển</button>


                </div>
            </div>
        </form>
    </div>
</div>