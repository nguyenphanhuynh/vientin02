<?php

/**
 * This is the model class for table "promote_codes".
 *
 * The followings are the available columns in table 'promote_codes':
 * @property integer $id
 * @property string $code
 * @property string $discount
 * @property string $tenant_info
 * @property string $user_info
 * @property string $wifi_area
 * @property string $parameters
 * @property string $created_at
 * @property integer $status
 * @property string $updated_at
 * @property string $used_at
 */
class PromoteCodes extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'promote_codes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('code, discount, created_at', 'required'),
			array('status', 'numerical', 'integerOnly'=>true),
			array('code, discount', 'length', 'max'=>255),
			array('tenant_info, user_info, wifi_area, parameters, updated_at, used_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, code, discount, tenant_info, user_info, wifi_area, parameters, created_at, status, updated_at, used_at', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'code' => 'Code',
			'discount' => 'Discount',
			'tenant_info' => 'Tenant Info',
			'user_info' => 'User Info',
			'wifi_area' => 'Wifi Area',
			'parameters' => 'Parameters',
			'created_at' => 'Created At',
			'status' => 'Status',
			'updated_at' => 'Updated At',
			'used_at' => 'Used At',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('code',$this->code,true);
		$criteria->compare('discount',$this->discount,true);
		$criteria->compare('tenant_info',$this->tenant_info,true);
		$criteria->compare('user_info',$this->user_info,true);
		$criteria->compare('wifi_area',$this->wifi_area,true);
		$criteria->compare('parameters',$this->parameters,true);
		$criteria->compare('created_at',$this->created_at,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('updated_at',$this->updated_at,true);
		$criteria->compare('used_at',$this->used_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PromoteCodes the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function beforeSave()
	{
		if (parent::beforeSave()) {
			{
				// for example
				$this->setAttribute("updated_at", date("Y/m/d H:i:s"));
				return true;
			}
			return false;
		}
	}

	public function getQRCode() {
		if ($this->code != "") {
			return '<img width="100%" src="https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=' . $this->code . '&choe=UTF-8" title="Promote code" />';
		} else {
			return "";
		}
	}

	public function getUserFirstName() {
		try {
			$user = json_decode($this->getAttribute("user_info"), true);
			if (isset($user['name'])) {
				return $user['name'];
			}
		} catch (Exception $ex) {

		}
		return "";

	}

	public function getUserLastName() {
		try {
			$user = json_decode($this->getAttribute("user_info"), true);
			if (isset($user['name'])) {
				return $user['name'];
			}
		} catch (Exception $ex) {

		}
		return "";

	}

	public function getTenantName() {
		try {
			$tenant = json_decode($this->getAttribute("tenant_info"), true);
			if (isset($tenant['name'])) {
				return $tenant['name'];
			}
		} catch (Exception $ex) {

		}
		return "";
	}

	public function getHtmlJsonField($fieldName) {
		$data = $this->$fieldName;
		$html = "";
		if (!empty($data)) {
			try {
				$data = json_decode($data, true);
				if(!is_array($data)) {
					$data = json_decode($data);
				}
//				echo '<pre>';
//				var_dump($data);
//				die();
				if(is_array($data)) {
					foreach ($data as $key => $value) {
//						var_dump($key);
//						var_dump($value);
						$html .= '<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4">' . $key . ': </div><div class="blue col-lg-10 col-md-10 col-sm-8 col-xs-8">' . $value . '</div><br/>';
					}
				}
			} catch (Exception $ex) {

			}
		}
		return $html;
	}
}
