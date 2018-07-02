<?php
/**
 * @author		ndgame
 * @copyright	2014 - 2016
 * @website		http://ndgame.net
 * @HotLine		0169 330 22 84
 * @Version		VIP v1.01
*/
 
	if (!defined('DWebMU')) die("Ban khong co quyen truy cap he thong");
if ($Use_TienTe != 1) {
	echo "<center>Chức năng không có hoặc không được sử dụng</center>";
}
else {
	if ( !isset($_SESSION['mu_username']) ) {
		echo "<div align=center><font color=red><b>Hãy Login trước khi thực hiện chức năng này</b></font></div>";
		include('modules/home.php');
	} else {
		//include_once('config/config_chucnang.php');
        $act = isset($_GET['act']) ? $_GET['act'] : null;
		switch ($act)
		{
			case 'vpoint2item': include('modules/tiente/vpoint2item.php'); break;
			case 'item2vpoint': include('modules/tiente/item2vpoint.php'); break;
			case 'gcoin2vpoint': 
                if ($Use_Gcoin2Vpoint != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/gcoin2vpoint.php');  }
                break;
            case 'gcoin2vipmoney': 
                if ($Use_Gcoin2VipMoney != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/gcoin2vipmoney.php');  }
                break;
            case 'gcoin2wcoin': 
                if ($Use_Gcoin2WCoin != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/gcoin2wcoin.php');  }
                break;
            case 'gcoin2wcoinp': 
                if ($Use_Gcoin2WCoinP != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/gcoin2wcoinp.php');  }
                break;
            case 'gcoin2goblincoin': 
                if ($Use_Gcoin2GoblinCoin != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/gcoin2goblincoin.php');  }
                break;
            case 'vpoint2gcoin': 
                if ($Use_Vpoint2Gcoin != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/vpoint2gcoin.php');  }
                break;
            //case 'vpoint2cash': include('modules/tiente/vpoint2cash.php'); break;
            //case 'cash2vpoint': include('modules/tiente/cash2vpoint.php'); break;
            case 'ipbonuspoint2vpoint': 
                if ($Use_IPBonus2Vpoint != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/ipbonuspoint2vpoint.php');  }
                break;
            
            case 'ipbonuspoint2pcpoint': 
                if ($Use_IPBonus2PCPoint != 1) {
					echo "<center>Chức năng không có hoặc không được sử dụng</center>";
				}
				else { include('modules/tiente/ipbonuspoint2pcpoint.php');  }
                break;
                			case 'costspin': include('modules/tiente/costspin.php'); break;   
            default : $page_template = 'templates/tiente.tpl';
		}
	}
}

?>