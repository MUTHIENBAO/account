<?php
include('templates/temp_config.php');

$_template = DIR.'templates';
$_dir = DIR;
$_version = '2.0.2';
$_left_menu = isset($_COOKIE['left-collap']) ? 'left-collap' : '';

$files_template = array(
    
    'js'    => array(
        $_dir.'/js-d/jquery-1.7.2.min.js',
        $_template.'/js-d/jquery.cookie.js',
        $_template.'/js-d/jquery-ui-1.8.16.custom.min.js',
        $_template.'/js-d/jquery.ba-hashchange.min.js',
        $_template.'/js-d/jquery.tablesorter.min.js',
        $_template.'/js-d/jquery.colorbox.js',
        $_template.'/js-d/jquery.tooltipster.min.js',
        $_dir.'/js-d/tooltip.jquery.js',
        $_dir.'/fancybox/jquery.mousewheel-3.0.4.pack.js',
        $_dir.'/fancybox/jquery.fancybox-1.3.4.pack.js',
        $_dir.'/js-d/check.js',
        array(
            $_dir.'/js-d/js_140903.js',
            filemtime('js-d/js_140903.js')
        )
    )
);

?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="robots" content="index,follow" />
    <meta name="robots" content="noodp,noydir" />
    <meta http-equiv="Expires" content="-1" />
    <link rel="icon" type="image/png" href="favicon.png?1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title><?php echo $title; ?></title>
    <meta name="description" content="Quản lý Tài khoản <?php echo $description; ?>" />
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <meta name="viewport" content="width=width-device-width, initial-scale=1, user-scalable=no">

    <link rel="stylesheet" type="text/css" href="css.css?<?php echo filemtime('templates/css/common.dev.css'); ?>" />
	<!--<link rel="stylesheet" type="text/css" href="style.css">-->
	<script type="text/javascript" src="js.js?<?php echo filemtime('js-d/js_140903.js'); ?>"></script>

</head>
<body>
<div class="wrap-fluid <?php echo $_left_menu;?>">
 <div class="body_wrapper">
    <div class="topuser">
        <div class="logo">
            <img src="<?php echo $_template; ?>/images/logo-min.png" />
        </div>
        <?php if(isset($_SESSION['mu_username'])) { ?>
        <div class="money_block">
            <span class="money_sub money_tit">Tiền tệ: </span>
            <span class="money_sub money_gc" title="GCent hiện có" id="head_gcoin"><?php echo isset($_SESSION['acc_gcoin']) ? number_format($_SESSION['acc_gcoin'], 0, ',', '.') : 0; ?></span>
            <span class="money_sub money_gcp" title="GCent khuyến mại" id="head_gcoin_km"><?php echo isset($_SESSION['acc_gcoin_km']) ? number_format($_SESSION['acc_gcoin_km'], 0, ',', '.') : 0; ?></span>
            <span class="money_sub money_vc" title="VCent hiện có" id="head_vpoint"><?php echo isset($_SESSION['acc_vpoint']) ? number_format($_SESSION['acc_vpoint'], 0, ',', '.') : 0; ?></span>
            <span class="money_sub money_vcp" title="VCent Event hiện có" id="head_vpoint_km"><?php echo isset($_SESSION['acc_vpoint_km']) ? number_format($_SESSION['acc_vpoint_km'], 0, ',', '.') : 0; ?></span>
            <span class="money_sub money_wc" title="WCoin hiện có" id="head_wcoin"><?php echo isset($_SESSION['WCoin']) ? number_format($_SESSION['WCoin'], 0, ',', '.') : 0; ?></span>
            <span class="money_sub money_pp" title="PPoint hiện có" id="head_pp"><?php echo isset($_SESSION['acc_ppoint']) ? number_format($_SESSION['acc_ppoint'], 0, ',', '.') : 0; ?></span>
            <span class="money_sub money_ppp" title="PPoint+ hiện có" id="head_pp_extra"><?php echo isset($_SESSION['acc_ppoint_extra']) ? number_format($_SESSION['acc_ppoint_extra'], 0, ',', '.') : 0; ?></span>
        </div>

        <div class="rightuser">
			<div class="top_notice boxmeudropdown">
				<?php include('modules/box_support.php'); ?>		
				<?php if($Use_VIP == 2) { ?>
					<?php if($_SESSION['acc_vip'] > 0) { ?>
						<a href="#vip_system"><div class="image-vip-s vip-<?php echo $_SESSION['acc_vip']; ?>"></div></a>
					<?php } else { ?>
						<a href="#vip_system" title="Nâng cấp VIP"><div class="image-vip-s upgrade-vip vip-2"></div></a>
					<?php } ?>
				<?php } ?>
			</div>
            <div class="userinfo">
                <div class="user-welcome">
                    Chào, <span><?php echo $_SESSION['mu_username']; ?></span>
                </div>
                <div class="user-top-icon"></div>
                <div class="userinfo-submenu">
                    <ul class="link-userinfo">
                        <li><a rel="menuajax" href="#acc_manager">Thông tin tài khoản</a></li>
                        <li><a rel="menuajax" href="#acc_manager&act=changepassgame_info">Đổi mật khẩu Game</a></li>
                        <li><a rel="menuajax" href="#acc_manager&act=changepass1_info">Đổi mật khẩu cấp 1</a></li>
                        <li><a rel="menuajax" href="#acc_manager&act=changepass2_info">Đổi mật khẩu cấp 2</a></li>
                        <li class="endline"></li>
                        <li>
                            <form method="post" name="logout" action="index.php">
                                <input type="hidden" name="logout" value="logout" />
                                <input type="submit" name="submit" value="Thoát" />
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <?php } else { ?>
            <span class="welcome">Hệ thống web tài khoản MU Việt</span>
        <?php } ?>
    </div>
            <?
            include('box_login.php');
            if(isset($_SESSION['mu_username'])){ //check LOGIN
            ?>
		<div class="col-left">
			<?php include('templates/box_menu.tpl'); ?>
		</div>
		<div class="col-right">
        <div class="right-content">
            <div class="main-block">
                <div class="main-left">
                    <div class="in-right-30">
                        <div class="notify">
                            <marquee behavior="scroll" direction="left">Hệ thống quản lý tài khoản Mu Việt <strong>&reg;Beta 2015</strong>.</marquee>
                        </div>
						<!--<div class="primary-block out-top-20">
                            <div class="adv-main" id="adv-main-top">
                                <img src="<?php echo $_template; ?>/images/demo/baner2.jpg">
                            </div>
                        </div>-->
                            <?
                            if (isset($nbbinfo)) {
                                echo "<div class='primary-block'><div class='in-20'><div class='form-success'>$nbbinfo</div></div></div>";
                            }

                            if (isset($error)) {
                                echo "<div class='primary-block'><div class='in-20'><div class='form-error'>$error</div></div></div>";
                            }

                            if (isset($notice)) {
                                echo "<div class='primary-block'><div class='in-20'><div class='form-success'>$notice</div></div></div>";
                            }
                            ?>

                            <div id='BlockLeft'>

                                <?php if ($page_template) include($page_template); ?>
                            </div>

                    </div>

                </div>
                <div class="main-right">
                    <div class="guide-use">
                        <a href="#" title="Hướng dẫn dùng web"><span>Hướng dẫn dùng web</span></a>
                    </div>
                    <div id="Login_Content">
                        <?php include('modules/box_account.php'); ?>
                    </div>
                </div>
            </div>
		</div>
	</div>
            <?php }//END check LOGIN ?>
		<div class="no-user">
            <?php
                if(!isset($_SESSION['mu_username'])){
                    if (isset($nbbinfo)) {
                        echo "<div class='primary-block'><div class='in-20'><div class='form-success'>$nbbinfo</div></div></div>";
                    }

                    if (isset($error)) {
                        echo "<div class='primary-block'><div class='in-20'><div class='form-error'>$error</div></div></div>";
                    }

                    if (isset($notice)) {
                        echo "<div class='primary-block'><div class='in-20'><div class='form-success'>$notice</div></div></div>";
                    }
                    if ($page_template) include($page_template);
                }

            ?>
		</div>
        </div>
</div>
        <div class="footer">
            <p class="copyright">
               Copyright &copy; NWebMU. All rights reserved.</br>
                <span>Phiên bản web MU được phát triển bởi www.vietmu.vn</span>
            </p>
        </div>
<? if(isset($_SESSION['mu_username'])){ ?>
<div class="ResultAcc">
    <div class="ra-ct">
        <table width="100%" cellspacing="1">
            <tr>
                <td align="center"><p class="welcome">Chào <strong><? echo $_SESSION['mu_username']; ?></strong></p></td>
            </tr>
            <tr>
                <td>
                    GCent hiện có<br />
                    <strong><?php echo isset($_SESSION['acc_gcoin']) ? number_format($_SESSION['acc_gcoin'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    GCent khuyến mại<br/>
                    <strong><?php echo isset($_SESSION['acc_gcoin_km']) ? number_format($_SESSION['acc_gcoin_km'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    VCent hiện có<br/>
                    <strong><?php echo isset($_SESSION['acc_vpoint']) ? number_format($_SESSION['acc_vpoint'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    VCent Event hiện có<br/>
                    <strong><?php echo isset($_SESSION['acc_vpoint_km']) ? number_format($_SESSION['acc_vpoint_km'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    WCoin hiện có<br/>
                    <strong><?php echo isset($_SESSION['WCoin']) ? number_format($_SESSION['WCoin'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    PPoint hiện có<br/>
                    <strong><?php echo isset($_SESSION['nbb_pl']) ? number_format($_SESSION['nbb_pl'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    PPoint+ hiện có<br/>
                    <strong><?php echo isset($_SESSION['nbb_pl_extra']) ? number_format($_SESSION['nbb_pl_extra'], 0, ',', '.') : 0; ?></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <form method="post" name="logout" action="index.php">
                        <input type="hidden" name="logout" value="logout">
                        <button type="submit" name="submit" class="btn btn-green btn-block btn-lg">Thoát</button>
                    </form>
                </td>
            </tr>
        </table>


    </div>
</div>
<div class="barBot">
    <div class="barCol">
        <div class="TabBar Tab-Menu">
            <span class="glyphicon glyphicon-th-large"></span>
            <p>Menu</p>
        </div>
    </div>
    <div class="barCol">
        <div class="TabBar Tab-Acc">
            <span class="glyphicon glyphicon-info-sign"></span>
            <p>Tài khoản</p>
        </div>
    </div>
    <div class="barCol">
        <div class="TabBar Tab-Char">
            <span class="glyphicon glyphicon-user"></span>
            <p>Nhân vật</p>
        </div>
    </div>
</div>
<? } ?>

<div class="popupCenter">
    <p class="popupCaption">Popup</p>
    <i class="popupClose"></i>
    <div class="popupContent">

    </div>
</div>
<div class="loading"></div>
<div class="blackBg"></div>
</body>
</html>