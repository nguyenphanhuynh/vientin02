<?php
/* @var $this SettingsController */
/* @var $model Settings */
/* @var $form CActiveForm */
?>
<script src="<?php echo Yii::app()->baseUrl;?>/lib/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector: 'textarea',
		height: 300,
		theme: 'modern',
		plugins: [
			'advlist autolink lists link image charmap print preview hr anchor pagebreak',
			'searchreplace wordcount visualblocks visualchars code fullscreen',
			'insertdatetime media nonbreaking save table contextmenu directionality',
			'emoticons template paste textcolor colorpicker textpattern imagetools'
		],
		toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
		toolbar2: 'print preview media | forecolor backcolor emoticons',
		image_advtab: true,
		templates: [
			{ title: 'Test template 1', content: 'Test 1' },
			{ title: 'Test template 2', content: 'Test 2' }
		],
		content_css: [
			'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
			'//www.tinymce.com/css/codepen.min.css'
		]
	});
</script>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'settings-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save', array('class' => 'btn btn-success btn-lg btn-block')); ?>
	</div>
	<div class="row">
		<h3>Keywords</h3>
		<ul>
			<li><kbd>{{customer.first_name}}</kbd></li>
			<li><kbd>{{customer.last_name}}</kbd></li>
			<li><kbd>{{customer.username}}</kbd></li>
			<li><kbd>{{tenant.name}}</kbd></li>
		</ul>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'setting_key'); ?>
		<?php echo $form->textField($model,'setting_key',array('size'=>60,'maxlength'=>256, 'readonly' => true)); ?>
		<?php echo $form->error($model,'setting_key'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'setting_value'); ?>
		<?php echo $form->textArea($model,'setting_value',array('size'=>60,'maxlength'=>8000)); ?>
		<?php echo $form->error($model,'setting_value'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save', array('class' => 'btn btn-success btn-lg btn-block')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
<div class="panel panel-primary">
	<div class="panel-heading">Expected POST Data</div>
	<div class="panel-body">
		<pre>{
	"v2": {
		"tenant": {
			"tenant_id": "63",
			"name": "Tenant Name",
			"read_only": false
		},
		"wifiarea": {
			"wifiarea_id": "80808080503c12ff015041c618d80083",
			"name": "Venue Name"
		},
		"customer": {
			"lang": "eng",
			"is_logged": true,
			"id": "rlo7ggvYDzK2Y",
			"first_name": "None",
			"last_name": "None",
			"username": "12F753BB",
			"gender": "M",
			"birth_date": "1967-11-22 10:20:30",
			"phone": "+44123456678",
			"phone_prefix": "+44",
			"email": "email@test.it",
			"mac_address": ["e49a79a56d82"]
		},
		"hotspot": {
			"id": "2063",
			"identifier": "00:18:0a:82:0c:cc",
			"name": "Hotspot Name",
			"latitude": "43.722839355469",
			"longitude": "10.401688575745",
			"mac_address": "00180g820ccc",
			"state": "State",
			"zip": "12345",
			"city": "City",
			"tag": "hotspot"
		},
		"webapp": {
			"id": "77",
			"name": "Hello World"
		}
	}
}		</pre>
	</div>
</div>

