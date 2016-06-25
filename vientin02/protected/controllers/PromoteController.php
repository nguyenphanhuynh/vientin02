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
			$request->posted_date = date('Y/m/d H:m:i');
			$request->save();
			// logged
			$model = new PromoteCodes();

			/*
         {
            "User":{"name":"John", "surname":"Doe", "gender":"Male", "username":"john_user", "email":"example@example.com"},
            "WifiArea":{"id":"123"},
            "Parameters"={"key": "value"},
            "Tenant"={}
        }
            */

			// Uncomment the following line if AJAX validation is needed
			// $this->performAjaxValidation($model);
			$errors = array();
			//$promoteCodeParams = $_POST['PromoteCodes'];
			$promoteCodeParams = $_POST;
//        var_dump($promoteCodeParams);
//        die();
			if (!empty($promoteCodeParams['User'])) {
				$model->setAttribute("user_info", json_encode($promoteCodeParams['User']));
			} /*else {
            $errors[] = "Thiếu tham số 'User'";
        }*/
			if (isset($promoteCodeParams['Tenant'])) {
				$model->setAttribute("tenant_info", json_encode($promoteCodeParams['Tenant']));
			}
			if (isset($promoteCodeParams['WifiArea'])) {
				$model->setAttribute("wifi_area", json_encode($promoteCodeParams['WifiArea']));
			}
			if (isset($promoteCodeParams['Parameters'])) {
				$model->setAttribute("parameters", json_encode($promoteCodeParams['Parameters']));
			}
			if (isset($promoteCodeParams['Discount'])) {
				$model->setAttribute("discount", json_encode($promoteCodeParams['Discount']));
			} else {
				$model->setAttribute("discount", "20%");
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
				$model->setAttribute("created_at", date("Y/m/d H:i:s"));
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
		$this->redirect('/promote/view?code='.$code);
	}
}
