<?php
/* @var $this PromoteCodesController */
/* @var $model PromoteCodes */
/* @var $form CActiveForm */
?>

<div class="coupon-verification">
	<?php if ($code == "") { ?>
		<div class="form row">
			<div style="text-align: center">
				<form action="" method="GET">
					<label>Nhập Coupon Code để kiểm tra: </label>
					<input type="text" name="code">
					<?php if (isset($_GET['code'])) {?>
						<div class="coupon-error">
							Coupon không hợp lệ! Vui lòng nhập lại.
						</div>
					<?php }?>
					<br/>
					<input type="submit" value="Kiểm tra">
				</form>
			</div>

		</div>

	<?php } else { ?>
		<div class="view-title">
			Coupon hợp lệ! Xem chi tiết bên dưới:
		</div>
		<?php if(!isset($model->used_at)):?>
			<div class="content row padding-bottom">
				<a href="<?php echo Yii::app()->createUrl('/promote/use', array('code' => $model->code))?>" class="btn btn-success btn-lg btn-block">Sử dụng coupon này</a>
			</div>
		<?php endif;?>
		<div class="content row">
			<div class="coupon-info">
				<div class="code-info">
					<!-- Code -->
					<div class="code row-info">
						<div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
							Coupon Code:
						</div>
						<div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
							<strong style="color: green;"><?php echo $model->code;?></strong>
						</div>
					</div>
					<!-- Discount -->
					<!--<div class="discount row-info">
                    <div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
                        Discount:
                    </div>
                    <div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
                        <?php //echo $model->discount;?>
                    </div>
                </div>-->
					<!-- User At -->
					<div class="tenant-info row-info">
						<div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
							Ngày sử dụng:
						</div>
						<div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
							<?php
								if(!isset($model->used_at)) { ?>
									<b>Coupon chưa sử dụng</b>
									<a href="<?php echo Yii::app()->createUrl('/promote/use', array('code' => $model->code))?>"
									   class="btn btn-success btn-xs">Sử dụng ngay <span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
								<?php } else {
									echo '<b class="text-danger"> Đã sử dụng vào: '. date_format(date_create($model->used_at), 'd/m/Y H:m') . '</b>';
								}
							?>
						</div>
					</div>
					<!-- User -->
					<div class="user-info row-info">
						<div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
							User:
						</div>
						<div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
							<?php echo $model->getHtmlJsonField('user_info');?>
						</div>
					</div>
					<!-- Wifi Area -->
					<div class="wifi-area row-info">
						<div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
							Wifi Area:
						</div>
						<div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
							<?php echo $model->getHtmlJsonField('wifi_area');?>
						</div>
					</div>
					<!-- Tenant -->
					<div class="tenant-info row-info">
						<div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
							Tenant:
						</div>
						<div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
							<?php echo $model->getHtmlJsonField('tenant_info');?>
						</div>
					</div>
					<!-- Tenant -->
					<div class="tenant-info row-info">
						<div class="left-col col-lg-2 col-md-2 col-sm-4  col-xs-12">
							Parameters:
						</div>
						<div class="right-col col-lg-10 col-md-10 col-sm-8  col-xs-12">
							<?php echo $model->getHtmlJsonField('parameters');?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php if(!isset($model->used_at)):?>
			<div class="content row padding-bottom">
				<a href="<?php echo Yii::app()->createUrl('/promote/use', array('code' => $model->code))?>" class="btn btn-success btn-lg btn-block">Sử dụng coupon này</a>
			</div>
		<?php endif;?>
	<?php }?>
</div>