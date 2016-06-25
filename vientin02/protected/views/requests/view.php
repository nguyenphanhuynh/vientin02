<?php
/* @var $this RequestsController */
/* @var $model Requests */

$this->breadcrumbs=array(
	'Requests'=>array('admin'),
	$model->id,
);

?>

<h1>View Requests #<?php echo $model->id; ?></h1>
<fieldset>
	<legend>ID: <?php echo $model->id; ?></legend>
	<hr>
	<div>Date: <?php echo $model->posted_date;?></div>
	<hr>
	<div>Content</div>
<pre>
<?php
var_dump(json_decode($model->content));
?>
</pre>
</fieldset>