<?php
/* @var $this PromoteCodesController */
/* @var $model PromoteCodes */
/* @var $top_content String */
/* @var $bottom_content String */

$errorClass = count($errors) > 0 ? "error" : "";
?>
<SCRIPT language="javascript">
	j4wi.service('NewCoupon');
</SCRIPT>
<div class="row">
	<div class="col-lg-4 col-md-4 col-sm-3  col-xs-1"></div>
	<div class="coupon-content <?php echo $errorClass;?> col-lg-4 col-md-4 col-sm-6  col-xs-10">
		<?php if (count($errors) == 0) {?>
			<div class="say-thank">
				<?php echo $top_content; ?>
			</div>
			<div class="qr-code">
				<?php echo $model->getQRCode(); ?>
			</div>
			<div class="promote-code">
				<?php echo $model->code;?>
			</div>

			<div class="policies">
				<?php echo $bottom_content; ?>
			</div>
		<?php } else { ?>
			<div class="error">
				<?php echo $errors[0];?>
			</div>
		<?php } ?>
	</div>
	<div class="col-sm-4 col-lg-3 col-xs-1"></div>
</div>