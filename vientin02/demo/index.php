<html>
<style type="text/css">
body {
    text-align: center;
    background: url(bg.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;


}

.box {
    background-color: rgba(255, 255, 255, 0.9);
}



.number {
    display: inline-block;
    height: 60px;
    width: 60px;
    line-height: 60px;

    -moz-border-radius: 30px; /* or 50% */
    border-radius: 30px; /* or 50% */

    background-color: orange;
    color: white;
    text-align: center;
    font-size: 2em;
}

.apice {
  vertical-align: super; 
} 


@media only screen and (max-device-width: 480px) 
 {
h1, h2, h3, h4, h5, h6 {
    font-size: 24px;
}
}

</style>

<body>
<?php 
//echo "PARAMS: POST" .json_encode($_POST['cloud4wi']);
echo "PARAMS: POST" .json_encode($_POST);
?>



<?php

$c4w = json_decode($_POST['cloud4wi']);

$user = $c4w->User;
$wifiarea = $c4w->WifiArea;
$tenant = $c4w->Tenant;
$marketplace = $c4w->MarketPlace;

$tenant_id = null;
$tenant_name = null;
$tenant_wifiarea = null;
$tenant_list = null;
$tenant_userlist = null;

$wifiarea_id = null;
$wifiarea_name = null;
$wifiarea_hotspot_list = null;
$wifiarea_category = null;
$wifiarea_user_list = null;

$user_id = null;
$user_DOB = null;
$gender = null;
$name = null;
$surname = null;
$email = null;
$username = null;

$marketplace_app = null;

?>


<?php 

if (!empty($tenant)) { 

    if (isset($tenant->id) && !empty($tenant->id)) {
        $tenant_id = $tenant->id;
    }

    if (isset($tenant->name) && !empty($tenant->name)) {
        $tenant_name = $tenant->name;
    }

    if (isset($tenant->wifi_areas) && !empty($tenant->wifi_areas)) {
        $tenant_wifiarea = $tenant->wifi_areas;
    }

    if (isset($tenant->tenants_list) && !empty($tenant->tenants_list)) {
        $tenant_list = $tenant->tenants_list;

    }

    if (isset($tenant->users_list) && !empty($tenant->users_list)) {
        $tenant_userlist = $user->users_list;

    }

}

if (!empty($wifiarea)) { 

    if (isset($wifiarea->id) && !empty($wifiarea->id)) {
        $wifiarea_id = $wifiarea->id;
    }

	if (isset($wifiarea->name) && !empty($wifiarea->name)) {
			$wifiarea_name = $wifiarea->name;
		}
	
	if (isset($wifiarea->hotspots_list) && !empty($wifiarea->hotspots_list)) {
			$wifiarea_hotspot_list = $wifiarea->hotspots_list;
		}
	if (isset($wifiarea->category) && !empty($wifiarea->category)) {
			$wifiarea_category = $wifiarea->category;
		}
}

if (!empty($user)) { 

    if (isset($user->id) && !empty($user->id)) {
        $user_id = $user->id;
    }
	
	if (isset($user->name) && !empty($user->name)) {
        $name = $user->name;
    }

    if (isset($user->surname) && !empty($user->surname)) {
        $surname = $user->surname;
    }

    if (isset($user->gender) && !empty($user->gender)) {
        $gender = $user->gender;
    }
	if (isset($user->birth_date) && !empty($user->birth_date)) {
        $user_DOB = $user->birth_date;

    }
    if (isset($user->email) && !empty($user->email)) {
        $email = $user->email;

    }

    if (isset($user->username) && !empty($user->username)) {
        $username = $user->username;

    }

    $name = $user->name;

}

if (!empty($marketplace)) { 

    if (isset($marketplace->apps) && !empty($marketplace->apps)) {
        $marketplace_app = $marketplace->apps;
    }
}


?>



<div class="well box">

<h2>Welcome back <b> <?php echo $username; ?></b>!</h2>
<h2>User ID: <b> <?php echo $user_id; ?></b>!</h2>
<h2>Name: <b> <?php echo $name; ?></b>!</h2>
<h2>Surname: <b> <?php echo $surname; ?></b>!</h2>
<h2>Gender: <b> <?php echo $gender; ?></b>!</h2>
<h2>Birthdate: <b> <?php echo $user_DOB; ?></b>!</h2>
<h2>Email: <b> <?php echo $email; ?></b>!</h2>

<h2>Tenant ID: <b> <?php echo $tenant_id; ?></b>!</h2>
<h2>Tenant name: <b> <?php echo $tenant_name; ?></b>!</h2>
<h2>Tenant Wifi Areas: <b> <?php echo $tenant_wifiarea; ?></b>!</h2>
<h2>Tenant List: <b> <?php echo $tenant_list; ?></b>!</h2>
<h2>Tenant User List: <b> <?php echo $tenant_user_list; ?></b>!</h2>

<h2>Wifi Area ID: <b> <?php echo $wifiarea_id; ?></b>!</h2>
<h2>Wifi Area name: <b> <?php echo $wifiarea_name; ?></b>!</h2>
<h2>Wifi Area Hotspot List: <b> <?php echo $wifiarea_hotspot_list; ?></b>!</h2>
<h2>Wifi Area Category: <b> <?php echo $wifiarea_category; ?></b>!</h2>

<h2>Marketplace App: <b> <?php echo $marketplace_app; ?></b>!</h2>

<br>

<h2>You visited us <span class="number">5 </span> times this week</h2>

<br>

<h2>We would like to reward you with a <b>FREE BEER!</b></h2>
<br>
<img style="max-height:80px;" src="beer.png">
<br>
<button style="margin-top:30px" class="btn btn-primary btn-large"><a href="http://vientin.com">Get it!</a></button>
<div>

</body>
</html>
