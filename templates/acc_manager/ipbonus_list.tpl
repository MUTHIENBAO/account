<div class="primary-block">


    <div class="main-content">


        <h1 class="title-content">IP Bonus</h1>


    </div>


</div>





<div class="primary-block out-top-20">


    <div class="in-top-20">


        <fieldset class="notify-red">


            <legend>Để đăng ký IP Bonus cho quán NET vui lòng gửi cho Admin thông tin sau :</legend>


            <div class="in-10">


                <ul class="noted in-left-10">


                    <li><strong>Tài khoản Game đại diện</strong> : ... (tài khoản để cập nhập IP cho quán NET)</li>


                    <li><strong>Tên quán NET</strong> : ...</li>


                    <li><strong>Địa chỉ quán NET</strong> : ... (Đẩy đủ số nhà, đường, quận/huyện, thành phố/tỉnh)</li>


                    <li>Hình chụp bên ngoài Quán NET</li>


                </ul>


            </div>


        </fieldset>


    </div>


    


    <div class="in-20">


        <strong>Lợi ích khi chơi ở quán NET đăng ký IP Bonus</strong>:


        <ul class="noted in-left-10">


            <li>Reset VIP được giảm <?php echo $ipbonus_decre_price; ?>% phí Reset VIP</li>


            <li>Nạp thẻ được thêm <?php echo $ipbonus_kmcard; ?>% giá trị thẻ nạp</li>


        </ul>


    </div>


    


    <div class="in-top-20">


        <table class="table table-blue table-border-1 table-text-center">


            <thead>


            <tr>


                <th colspan="2">Danh sách quán NET đăng ký IP Bonus</th>


            </tr>


            <tr>


                <th>Tên quán NET</th>


                <th>Địa chỉ quán NET</th>


            </tr>


            </thead>


            <tbody>


            <?php


                for($i=0; $i<count($netname); $i++) {


            ?>


            <tr>


                <td width="30%"><?php echo $netname[$i]; ?></td><td><?php echo $netaddr[$i]; ?></td>


            </tr>


            <?php } ?>


            </tbody>


        </table>


    </div>


</div>