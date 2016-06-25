<?php
/* @var $this RequestsController */
/* @var $model Requests */

$this->breadcrumbs=array(
	'Requests'=>array('admin'),
	'Manage',
);

?>

<h1>Manage Requests</h1>

</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'requests-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
//		'id',
		array(
			'name' => 'content',
			'headerHtmlOptions' => array(
				'style' => 'width: 500px;'
			)
		),
		array(
			'name' => 'posted_date',
			'headerHtmlOptions' => array(
				'style' => 'width: 100px;'
			)
		),
		array(
			'class'=>'CButtonColumn',
			'headerHtmlOptions' => array(
				'style' => 'width: 50px;'
			)
		),
	),
)); ?>
