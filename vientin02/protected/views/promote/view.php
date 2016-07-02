<?php
/* @var $this PromoteController */
/* @var $model PromoteCodes */

$this->breadcrumbs=array(
	'Promote Codes'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List PromoteCodes', 'url'=>array('index')),
	array('label'=>'Create PromoteCodes', 'url'=>array('create')),
	array('label'=>'Update PromoteCodes', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PromoteCodes', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PromoteCodes', 'url'=>array('admin')),
);

function niceJson($jsonString) {
	return $jsonString;
}
?>

<h1>View PromoteCodes #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'code',
//		'discount',
		'tenant_id',
		'customer_id',
		'wifiarea_id',
		'parameters',
		'created_at:datetime',
		'status',
		'updated_at:datetime',
		'used_at:datetime',
		'hotspot_id',
		'webapp_id',
		'cloud4wi',
		'data',
		'v2:json',
	),
)); ?>
