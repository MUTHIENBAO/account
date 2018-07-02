<?php if (isset($_SESSION['mu_nvchon'])) { ?>
<div class="primary-block">
    <div class="main-content">
        <h1 class="title-content">Mua Item Vcent</h1>
    </div>
</div>


<div class="priority-block out-top-20">
    <div class="head-block">
        <h1 class="title-head"><span class="text-semibold">Lưu ý</span></h1>
    </div>
    <div class="in-20">
        <ul class="noted in-left-10">
            <li>Số Vcent sẽ bị trừ tương ứng với giá trị vật phẩm khi mua.</li>
            <li>Sau khi mua xong, Item Vcent sẽ nằm trong hòm đồ chung.</li>
            <li class="tik">Item Vcent 50k không được ném ra đất</li>
            <li>Mọi trường hợp không đọc kỹ trước khí sử dụng đều không được giải quyết</li>
        </ul>
    </div>
</div>



<form id="vpoint2item" name="vpoint2item" method="post" action="index.php?mod=tiente&act=vpoint2item">
<div class="out-top-20">
    <table class="table table-blue table-text-center table-border-2">
        <thead>
            <tr>
                <th align="center">#</th>
                <th align="center"><strong>Hình ảnh</strong></th>
                <th align="center"><strong>Tên Item</strong></th>
                <th align="center"><strong>Giá</strong> ( Vcent )</th>
                <th align="center"><strong>Mua</strong></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center">1</td>
                <td align="center" bgcolor="#121212"><img src="img_item/gold.gif"></td>
                <td align="center">Item 1.000 Vcent</td>
                <td align="center"><?php echo number_format($item_low, 0, ',', '.'); ?></td>
                <td align="center"><input type="radio" name="item" checked="checked" value="gold" /></td>
            </tr>
            <tr>
                <td align="center">2</td>
                <td align="center" bgcolor="#121212"><img src="img_item/zen.gif"></td>
                <td align="center">Item 10.000 Vcent</td>
                <td align="center"><?php echo number_format($item_hight, 0, ',', '.'); ?></td>
                <td align="center"><input type="radio" name="item" value="zen" /></td>
            </tr>
            <tr>
                <td align="center">3</td>
                <td align="center" bgcolor="#121212"><img src="items/1412000.gif"></td>
                <td align="center">Item 50.000 Vcent</td>
                <td align="center"><?php echo number_format($item_50k, 0, ',', '.'); ?></td>
                <td align="center"><input type="radio" name="item" value="vpoint50k" /></td>
            </tr>
        </tbody>
    </table>
</div>


<div class="primary-block out-top-20">
    <div class="in-20">


	<input type="hidden" name="action" value="vpoint2item" />
	<input type="hidden" name="character" value="<?php echo $_SESSION['mu_nvchon']; ?>" />

    <div class="form-3">
        <div class="form-row">
            <div class="form-col-1">Nhân vật Mua Item Vcent </div>
            <div class="form-col-2">
                <span class="tag tag-orange"><?php echo $_SESSION['mu_nvchon']; ?></span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Số lượng đồ cần mua</div>
            <div class="form-col-2">
					<select name="slg" class="form-style">
						<option value="1" selected="selected">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
					</select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col-1">Mật khẩu cấp 2</div>
            <div class="form-col-2">
                <input class="form-style" type="password" name="pass2" size="14" maxlength="32"/>
            </div>
        </div>

        <div class="form-submit">
            <button class="btn btn-green btn-lg" type="submit" name="Submit">Mua Item Vcent</button>
        </div>
    </div>

    </div>
</div>
</form>
<?php } else include('templates/char_manager.tpl'); ?>