<?php
/* @var $this PromoteController */
/* @var $model PromoteCodes */

$this->breadcrumbs=array(
	'Promote Codes'=>array('admin'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List PromoteCodes', 'url'=>array('admin')),
	array('label'=>'Create PromoteCodes', 'url'=>array('create')),
);

?>

<h1>Manage Promote Codes</h1>


<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'promote-codes-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
//		'id',
		array(
			'name' => 'code',
			'headerHtmlOptions' => array('style' => 'width: 200px;'),
			'htmlOptions' => array('style' => 'text-align: center; font-size: 150%;'),
		),
//		'discount',
//		'tenant_info',
//		'user_info',
//		'wifi_area',
		array(
			'filter' => '',
			'name' => 'created_at',
			'headerHtmlOptions' => array('style' => 'width: 200px;'),
			'htmlOptions' => array('style' => 'text-align: center; font-size: 150%;'),
		),
		array(

			'filter' => '',
			'name' => 'used_at',
			'headerHtmlOptions' => array('style' => 'width: 200px;'),
			'htmlOptions' => array('style' => 'text-align: center; font-size: 150%;'),
		),
		/*
		'parameters',
		'created_at',
		'status',
		'updated_at',
		*/
		array(
			'class'=>'CButtonColumn',
			'buttons' => array(
				'custom_view' => array(
					'url'=>'Yii::app()->controller->createUrl("/promote/view",array("code"=>$data->code))',
					'htmlOptions' => array('class', 'view'),
					'imageUrl'=>Yii::app()->baseUrl . '/img/view.png',
				),
			),
			'template'=>'{custom_view}{delete}',


		),
	),
)); ?>
