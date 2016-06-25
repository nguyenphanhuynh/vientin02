<?php
/* @var $this PromoteController */
/* @var $data PromoteCodes */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('code')); ?>:</b>
	<?php echo CHtml::encode($data->code); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('discount')); ?>:</b>
	<?php echo CHtml::encode($data->discount); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tenant_info')); ?>:</b>
	<?php echo CHtml::encode($data->tenant_info); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_info')); ?>:</b>
	<?php echo CHtml::encode($data->user_info); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('wifi_area')); ?>:</b>
	<?php echo CHtml::encode($data->wifi_area); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('parameters')); ?>:</b>
	<?php echo CHtml::encode($data->parameters); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('created_at')); ?>:</b>
	<?php echo CHtml::encode($data->created_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('updated_at')); ?>:</b>
	<?php echo CHtml::encode($data->updated_at); ?>
	<br />

	*/ ?>

</div>