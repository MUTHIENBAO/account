<div class="primary-block">

    <div class="main-content">

        <h1 class="title-content">Mua lần quay may mắn</h1>

    </div>

</div>

<div class="primary-block out-top-20">

    <div class="in-20">

        <form id="costspin" name="costspin" method="post" action="index.php?mod=tiente&act=costspin">

            <input type="hidden" name="action" value="costspin" />

            <div class="form-3">

                <div class="form-row">

                    <div class="form-col-1">&nbsp;</div>

                    <div class="form-col-2">

                        <div class="caption-block caption-blue"><b>Tỷ giá: 1 lần quay = <?=$costspin_gcoin;?> G.Coin <br>hoặc <?=$costspin_vpoint;?> V.Point</b></span></div>

                    </div>

                </div>

                <div class="form-row">

                    <div class="form-col-1">Sử dụng đơn vị:</div>

                    <div class="form-col-2">

                    <input type="radio" name="moneytype" value="Gcoin" checked="checked" /> Gcoin 
					<input type="radio" name="moneytype" value="Vpoint" /> Vpoint

                    </div>

                </div>

				<div class="form-row">

                    <div class="form-col-1">Số lần muốn mua:</div>

                    <div class="form-col-2"><input class="form-style" type="text" name="costspin" id="costspin" size="14" maxlength="10"/>

                    </div>

                </div>

                <div class="form-row">

                    <div class="form-col-1">Mật khẩu cấp 2</div>

                    <div class="form-col-2"><input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>

                    </div>

                </div>



                <div class="form-submit">

                    <button class="btn btn-green btn-lg" type="submit" name="Submit">Mua lần quay</button>

                </div>

            </div>

        </form>

    </div>

</div>