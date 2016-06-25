<?php
/* @var $this PromoteController */
/* @var $model PromoteCodes */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'promote-codes-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'code'); ?>
		<?php echo $form->textField($model,'code',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'code'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'discount'); ?>
		<?php echo $form->textField($model,'discount',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'discount'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tenant_info'); ?>
		<?php echo $form->textArea($model,'tenant_info',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'tenant_info'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_info'); ?>
		<?php echo $form->textArea($model,'user_info',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'user_info'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'wifi_area'); ?>
		<?php echo $form->textArea($model,'wifi_area',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'wifi_area'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'parameters'); ?>
		<?php echo $form->textArea($model,'parameters',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'parameters'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'created_at'); ?>
		<?php echo $form->textField($model,'created_at'); ?>
		<?php echo $form->error($model,'created_at'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->textField($model,'status'); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'updated_at'); ?>
		<?php echo $form->textField($model,'updated_at'); ?>
		<?php echo $form->error($model,'updated_at'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->