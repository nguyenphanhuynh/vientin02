<?php
/* @var $this PromoteCodesController */
/* @var $model PromoteCodes */

?>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-3  col-xs-1"></div>
    <div class="coupon-content col-lg-4 col-md-4 col-sm-6  col-xs-10">


        <form action="<?php echo Yii::app()->createUrl("/promote/create");?>" method="POST" name="frmNewPromote">
            <b>User:</b><textarea style="width: 250px; height: 80px;" type="text" name="User">{"name":"John", "surname":"Doe", "gender":"Male", "username":"john_user", "email":"example@example.com"}</textarea>
            <br/><br/>
            <b>Tenant:</b> <textarea style="width: 250px; height: 80px;" type="text" name="Tenant">{"id":367}</textarea>
            <br/><br/>
            <b>Wifi Area:</b> <textarea style="width: 250px; height: 80px;" type="text" name="WifiArea"></textarea>
            <br/><br/>
            <b>Parameters:</b> <textarea style="width: 250px; height: 80px;" type="text" name="Parameters"></textarea>
            <br/><br/>
            <input type="submit" value="submit">
        </form>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-3  col-xs-1"></div>
</div>