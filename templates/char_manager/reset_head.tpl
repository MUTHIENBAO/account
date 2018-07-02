<?php
if(!isset($thehe_choise)) {
    $thehe_choise = $_SESSION['acc_thehe'];
    if(!isset($use_gioihanrs[$thehe_choise])) include_once('config/config_gioihanrs.php');
}
    
?>

<ul class="tabs-content">
    <li <?php if($_GET['act'] == 'reset') echo 'class="active"'; ?> ><a href="#char_manager&act=reset" rel="ajax">Reset</a></li>

    <?php if(isset($Use_ResetVIP) && $Use_ResetVIP == 1) { ?>
    <li <?php if($_GET['act'] == 'resetvip') echo 'class="active"'; ?> ><a href="#char_manager&act=resetvip" rel="ajax">Reset VIP</a></li>
    <?php } ?>

    <?php if((isset($Use_UyThacOnline) && $Use_UyThacOnline == 1) || (isset($Use_UyThacOffline) && $Use_UyThacOffline == 1)) { ?>
    <li <?php if(in_array($_GET['act'], array('uythac_reset', 'uythac_resetvip'))) echo 'class="active"'; ?> >
    	<a href="#char_manager&act=uythac_reset" rel="ajax">Reset Ủy Thác</a>
    	<div class="submenu">
            <p <?php if($_GET['act']=='uythac_reset') echo 'class="active"'; ?>><a href="#char_manager&act=uythac_reset" rel="ajax">Reset Ủy Thác</a></p>
            
            <?php if (isset($Use_ResetVIP) && $Use_ResetVIP == 1) { ?>
            <p <?php if($_GET['act']=='uythac_resetvip') echo 'class="active"'; ?>><a href="#char_manager&act=uythac_resetvip" rel="ajax">Reset Ủy Thác VIP</a></p>
            <?php } ?>
        </div>
    </li>
    <?php } ?>

    <?php if(isset($Use_ResetOver) && $Use_ResetOver == 1) { ?>
    <li <?php if(in_array($_GET['act'], array('resetover', 'resetvipover'))) echo 'class="active"'; ?> >
    	<a href="#char_manager&act=resetover" rel="ajax">Reset OVER</a>
    	<div class="submenu">
            <p <?php if($_GET['act']=='resetover') echo 'class="active"'; ?>><a href="#char_manager&act=resetover" rel="ajax">Reset OVER</a></p>
            
            <?php if (isset($Use_ResetVIP) && $Use_ResetVIP == 1) { ?>
            <p <?php if($_GET['act']=='resetvipover') echo 'class="active"'; ?>><a href="#char_manager&act=resetvipover" rel="ajax">Reset OVER VIP</a></p>
            <?php } ?>
        </div>
    </li>
    <?php } ?>
    
    <?php if ( isset($Use_ResetVIP) && $Use_ResetVIP == 1 && ( ($use_gioihanrs[$thehe_choise] == 1 && isset($Use_RS_Bu[$thehe_choise]) && $Use_RS_Bu[$thehe_choise] == 1) || ($use_gioihanrs[$thehe_choise] == 2 && isset($Use_RS_Bu2[$thehe_choise]) && $Use_RS_Bu2[$thehe_choise] == 1) ) ) { ?>
        <li <?php if($_GET['act'] == 'rs_bu') echo 'class="active"'; ?> ><a href="#char_manager&act=rs_bu" rel="ajax">Reset Bù</a></li>
    <?php } ?>
    
    <?php if ( isset($Use_ResetVIP) && $Use_ResetVIP == 1 && ( ($use_gioihanrs[$thehe_choise] == 1 && isset($Use_UP_RS_Daily[$thehe_choise]) && $Use_UP_RS_Daily[$thehe_choise] == 1) || ($use_gioihanrs[$thehe_choise] == 2 && isset($Use_UP_RS_Daily2[$thehe_choise]) && $Use_UP_RS_Daily2[$thehe_choise] == 1) ) ) { ?>
        <li <?php if($_GET['act'] == 'rs_up') echo 'class="active"'; ?> ><a href="#char_manager&act=rs_up" rel="ajax">Reset Hộ</a></li>
    <?php } ?>
    
</ul>