<?php

class PromoteController extends BaseController
{

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'rights', // perform access control for CRUD operations

		);
	}

	public function actionView()
	{
		$code = "";
		$model = null;
		if (isset($_GET['code'])) {

			$code = $_GET['code'];
			$model = PromoteCodes::model()->findAll(array(
				'condition'=>'code=:code',
				'params'=>array(':code'=>$code)
			));
			if (count($model) == 0) {
				$code = "";
			} else {
				$model = $model[0];
			}

		}
		$this->render('view',array(
			'model'=>$model,
			'code'=>$code,

		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		if(Yii::app()->request->isPostRequest)
		{
			// log this post
			$request = new Requests();
			$request->content = json_encode($_POST);
			$request->posted_date = date('Y/m/d H:i:s');
			$request->save();
			// logged
			$model = new PromoteCodes();

			$v2 = json_decode($_POST['v2']);

			// Uncomment the following line if AJAX validation is needed
			// $this->performAjaxValidation($model);
			$errors = array();
			//// Save to others table
			////// tenant
			$tenant = null;
			if(isset($v2->tenant->tenant_id)) {
				$tenant = Tenant::model()->findByAttributes(array('tenant_id' => $v2->tenant->tenant_id));
			}
			if(!isset($tenant)) {
				// New tenant
				$tenant = new Tenant();
				if(isset($v2->tenant->tenant_id))
					$tenant->tenant_id = $v2->tenant->tenant_id;
				if($v2->tenant->name)
					$tenant->name = $v2->tenant->name;
				if(isset($v2->tenant->read_only))
					$tenant->read_only = $v2->tenant->read_only ? 1 : 0;

				if(!$tenant->save()) {
				}
			}
			////// wifiarea
			$wifiarea = null;
			if(isset($v2->wifiarea->wifiarea_id)) {
				$wifiarea = Wifiarea::model()->findByAttributes(array('wifiarea_id' => $v2->wifiarea->wifiarea_id));
			}
			if(!isset($wifiarea)) {
				// New tenant
				$wifiarea = new Wifiarea();
				if(isset($v2->wifiarea->wifiarea_id))
					$wifiarea->wifiarea_id = $v2->wifiarea->wifiarea_id;
				if(isset($v2->wifiarea->name))
					$wifiarea->name = $v2->wifiarea->name;
				if(!$wifiarea->save()) {
				}
			}
			////// customer
			$customer = null;
			if(isset($v2->customer->id)) {
				$customer = Customer::model()->findByAttributes(array('customer_id' => $v2->customer->id));
			}
			if(!isset($customer)) {
				// New tenant
				$customer = new Customer();
				if(isset($v2->customer->id))
					$customer->customer_id = $v2->customer->id;
				if(isset($v2->customer->is_logged))
					$customer->is_logged = $v2->customer->is_logged ? 1 : 0;
				if(isset($v2->customer->lang))
					$customer->lang = $v2->customer->lang;
				if(isset($v2->customer->first_name))
					$customer->first_name = $v2->customer->first_name;
				if(isset($v2->customer->last_name))
					$customer->last_name = $v2->customer->last_name;
				if(isset($v2->customer->username))
					$customer->username = $v2->customer->username;
				if(isset($v2->customer->gender))
					$customer->gender = $v2->customer->gender;
				if(isset($v2->customer->birth_date))
					$customer->birth_date = $v2->customer->birth_date;

				if(!$customer->save()) {
				}
			}
			////// hotspot
			$hotspot = null;
			if(isset($v2->hotspot->id)) {
				$hotspot = Hotspot::model()->findByAttributes(array('hotspot_id' => $v2->hotspot->id));
			}
			if(!isset($hotspot)) {
				// New tenant
				$hotspot = new Hotspot();
				if(isset($v2->hotspot->hotspot_id)) {
					$hotspot->hotspot_id = $v2->hotspot->hotspot_id;
				}
				if(isset($v2->hotspot->identifier)) {
					$hotspot->identifier = $v2->hotspot->identifier;
				}
				if(isset($v2->hotspot->name)) {
					$hotspot->name = $v2->hotspot->name;
				}
				if(isset($v2->hotspot->latitude)) {
					$hotspot->latitude = $v2->hotspot->latitude;
				}
				if(isset($v2->hotspot->longitude)) {
					$hotspot->longitude = $v2->hotspot->longitude;
				}
				if(isset($v2->hotspot->mac_address)) {
					$hotspot->mac_address = $v2->hotspot->mac_address;
				}
				if(isset($v2->hotspot->state)) {
					$hotspot->state = $v2->hotspot->state;
				}
				if(isset($v2->hotspot->zip)) {
					$hotspot->zip = $v2->hotspot->zip;
				}
				if(isset($v2->hotspot->city)) {
					$hotspot->city = $v2->hotspot->city;
				}
				if(isset($v2->hotspot->tag)) {
					$hotspot->tag = $v2->hotspot->tag;
				}

				if(!$hotspot->save()) {
				}

			}

			////// webapp
			$webapp = null;
			if(isset($v2->webapp)) {
				$webapp = Webapp::model()->findByAttributes(array('webapp_id' => $v2->webapp->id));
			}
			if(!isset($webapp)) {
				$webapp = new Webapp();
				if(isset($v2->webapp->id))
					$webapp->webapp_id = $v2->webapp->id;
				if(isset($v2->webapp->name))
					$webapp->name = $v2->webapp->name;

				$webapp->save();
			}

			if (count($errors) == 0) {
				$duplicate = true;
				$code = "";
				while ($duplicate) {
					$code = substr(md5(microtime()),rand(0,26),8);
					$oldRecord = PromoteCodes::model()->findAll(array(
						'condition'=>'code=:code',
						'params'=>array(':code'=>$code)
					));
					if (count($oldRecord) == 0) {
						$duplicate = false;
						break;
					}
				}
				$model->setAttribute("code", $code);
				if(isset($_POST['cloud4wi'])) {
					$model->cloud4wi = $_POST['cloud4wi'];
				}
				if(isset($_POST['data'])) {
					$model->data = $_POST['data'];
				}
				if(isset($_POST['v2'])) {
					$model->v2 = $_POST['v2'];
				}
				if(isset($tenant)) {
					$model->tenant_id = $tenant->id;
				}
				if(isset($wifiarea)) {
					$model->tenant_id = $wifiarea->id;
				}
				if(isset($customer)) {
					$model->customer_id = $customer->id;
				}
				if(isset($hotspot)) {
					$model->hotspot_id = $hotspot->id;
				}
				if(isset($webapp)) {
					$model->webapp_id = $webapp->id;
				}
				$model->setAttribute("created_at", date("Y/m/d H:i:s"));
				$model->discount = 0;

				if(!$model->save()) {
					$errors[] = "Lưu dữ Promote code bị lỗi";
				}
			}

			$top_content = '';
			$bottom_content = '';
			$settings = Settings::model()->findAll(array(
				'condition' => 'setting_key=:setting_key',
				'params' => array(':setting_key' => 'promote_top_content')
			));
			if(isset($settings) && is_array($settings) && count($settings) > 0) {
				$settings = $settings[0];
				if(isset($settings->setting_value)) {
					$top_content = $settings->setting_value;
				}
			}
			$settings = Settings::model()->findAll(array(
				'condition' => 'setting_key=:setting_key',
				'params' => array(':setting_key' => 'promote_bottom_content')
			));
			if(isset($settings) && is_array($settings) && count($settings) > 0) {
				$settings = $settings[0];
				if(isset($settings->setting_value)) {
					$bottom_content = $settings->setting_value;
				}
			}
			// Replace placeholders
			$top_content = $model->replacePlaceHolder($top_content);
			$bottom_content = $model->replacePlaceHolder($bottom_content);

			$this->layout = 'promote';
			$this->render('create', array(
				'model' => $model,
				'errors' => $errors,
				'top_content' => $top_content,
				'bottom_content' => $bottom_content
			));
		} else {
			echo 'This action receives POST method only';
		}
	}

	public function actionNew()
	{
		$model = new PromoteCodes();

		$this->render('new', array(
			'model' => $model
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PromoteCodes']))
		{
			$model->attributes=$_POST['PromoteCodes'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new PromoteCodes('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['PromoteCodes']))
			$model->attributes=$_GET['PromoteCodes'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return PromoteCodes the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=PromoteCodes::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param PromoteCodes $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if (isset($_POST['ajax']) && $_POST['ajax'] === 'promote-codes-form') {
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionUse() {
		$code = $_GET['code'];
		if(isset($code)) {
			$promote = PromoteCodes::model()->findAll(array(
				'condition' => 'code=:code',
				'params' => array(':code' => $code)
			));
			if(isset($promote) && is_array($promote) && count($promote)>0) {
				$promote = $promote[0];
				$promote->used_at = date('Y/m/d H:i:s');
				$promote->save();
			}
		}
		$this->redirect($this->createUrl('promote/view', array('code' => $code)));
	}
}
