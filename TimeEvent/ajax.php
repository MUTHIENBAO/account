<?php
$GetTimeType = str_replace(' ', '', strtolower($_GET['event']));
date_default_timezone_set('Asia/Jakarta');
$timestamp = time();
$tomorrow = date('Y/m/d', $timestamp+86400);
$today = false;
include('config.php');

Switch ($GetTimeType){
	Case 'blood':
		foreach($Blood_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Blood_Event[0]; break;
	Case 'devil':
		foreach($Devil_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Devil_Event[0]; break;
	Case 'chaos':
		foreach($Chaos_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Chaos_Event[0]; break;
	Case 'reddragon':
		foreach($RedDragon_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $RedDragon_Event[0]; break;
	Case 'phuthuytrang':
		foreach($PhuThuyTrang_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $PhuThuyTrang_Event[0]; break;
	Case 'blue':
		foreach($Blue_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Blue_Event[0]; break;
	Case 'sky':
		foreach($Sky_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Sky_Event[0]; break;
	Case 'bossattack':
		foreach($BossAttack_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $BossAttack_Event[0]; break;
	Case 'happyhour':
		foreach($HappyHour_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $HappyHour_Event[0]; break;
	Case 'hitandup':
		foreach($HitAndUp_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $HitAndUp_Event[0]; break;
	Case 'raklion':
		foreach($Raklion_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Raklion_Event[0]; break;
	Case 'swamp':
		foreach($Swamp_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Swamp_Event[0]; break;
	Case 'summer':
		foreach($Summer_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $Summer_Event[0]; break;
	Case 'hideandseek':
		foreach($HideAndSeek_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $HideAndSeek_Event[0]; break;
	Case 'rongvang':
		foreach($RongVang_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $RongVang_Event[0]; break;

	Case 'daichienkundun':
		foreach($daichienkundun as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $daichienkundun[0]; break;

	Case 'santa':
		foreach($santa as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $santa[0]; break;

	Case 'pvpevent':
		foreach($PvP_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $PvP_Event[0]; break;

	Case 'castledeep':
		foreach($CastleDeep_Event as &$value){
			$return = strtotime($value);
			if($return > $timestamp){$today = true; echo date('Y/m/d H:i:s', $return); break;}
		}
		if($today == false) echo $tomorrow . ' ' . $CastleDeep_Event[0]; break;
		
}
?>