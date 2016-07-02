<?php

/**
 * This is the model class for table "customer".
 *
 * The followings are the available columns in table 'customer':
 * @property integer $id
 * @property string $lang
 * @property integer $is_logged
 * @property string $customer_id
 * @property string $first_name
 * @property string $last_name
 * @property string $username
 * @property string $gender
 * @property string $birth_date
 * @property string $phone
 * @property string $phone_prefix
 * @property string $email
 * @property string $mac_address
 *
 * The followings are the available model relations:
 * @property PromoteCodes[] $promoteCodes
 */
class Customer extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'customer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('is_logged', 'numerical', 'integerOnly'=>true),
			array('lang, gender, phone, phone_prefix', 'length', 'max'=>45),
			array('customer_id, first_name, last_name, username', 'length', 'max'=>128),
			array('email, mac_address', 'length', 'max'=>256),
			array('birth_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, lang, is_logged, customer_id, first_name, last_name, username, gender, birth_date, phone, phone_prefix, email, mac_address', 'safe', 'on'=>'search'),
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
			'promoteCodes' => array(self::HAS_MANY, 'PromoteCodes', 'customer_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'lang' => 'Lang',
			'is_logged' => 'Is Logged',
			'customer_id' => 'Customer',
			'first_name' => 'First Name',
			'last_name' => 'Last Name',
			'username' => 'Username',
			'gender' => 'Gender',
			'birth_date' => 'Birth Date',
			'phone' => 'Phone',
			'phone_prefix' => 'Phone Prefix',
			'email' => 'Email',
			'mac_address' => 'Mac Address',
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
		$criteria->compare('lang',$this->lang,true);
		$criteria->compare('is_logged',$this->is_logged);
		$criteria->compare('customer_id',$this->customer_id,true);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('gender',$this->gender,true);
		$criteria->compare('birth_date',$this->birth_date,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('phone_prefix',$this->phone_prefix,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('mac_address',$this->mac_address,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Customer the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
