<?php
/* @var $this PromoteController */
/* @var $model PromoteCodes */

$this->breadcrumbs=array(
	'Promote Codes'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PromoteCodes', 'url'=>array('index')),
	array('label'=>'Create PromoteCodes', 'url'=>array('create')),
	array('label'=>'View PromoteCodes', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PromoteCodes', 'url'=>array('admin')),
);
?>

<h1>Update PromoteCodes <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>