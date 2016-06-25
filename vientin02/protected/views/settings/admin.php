<?php
/* @var $this SettingsController */
/* @var $model Settings */

$this->breadcrumbs=array(
	'Settings'=>array('admin'),
	'Manage',
);

?>

<h1>Manage Settings</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'settings-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
//		'id',
		'setting_key',
//		'setting_value',
		array(
			'class'=>'CButtonColumn',
			'headerHtmlOptions' => array('style' => 'width: 70px;'),
			'template' => '{update}',
		),
	),
)); ?>
