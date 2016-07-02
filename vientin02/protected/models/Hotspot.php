<?php

/**
 * This is the model class for table "hotspot".
 *
 * The followings are the available columns in table 'hotspot':
 * @property integer $id
 * @property string $hotspot_id
 * @property string $identifier
 * @property string $name
 * @property string $latitude
 * @property string $longitude
 * @property string $mac_address
 * @property string $state
 * @property string $zip
 * @property string $city
 * @property string $tag
 *
 * The followings are the available model relations:
 * @property PromoteCodes[] $promoteCodes
 */
class Hotspot extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'hotspot';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('hotspot_id, identifier, mac_address, zip', 'length', 'max'=>45),
			array('name, tag', 'length', 'max'=>256),
			array('latitude, longitude', 'length', 'max'=>18),
			array('state, city', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, hotspot_id, identifier, name, latitude, longitude, mac_address, state, zip, city, tag', 'safe', 'on'=>'search'),
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
			'promoteCodes' => array(self::HAS_MANY, 'PromoteCodes', 'hotspot_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'hotspot_id' => 'Hotspot',
			'identifier' => 'Identifier',
			'name' => 'Name',
			'latitude' => 'Latitude',
			'longitude' => 'Longitude',
			'mac_address' => 'Mac Address',
			'state' => 'State',
			'zip' => 'Zip',
			'city' => 'City',
			'tag' => 'Tag',
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
		$criteria->compare('hotspot_id',$this->hotspot_id,true);
		$criteria->compare('identifier',$this->identifier,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('latitude',$this->latitude,true);
		$criteria->compare('longitude',$this->longitude,true);
		$criteria->compare('mac_address',$this->mac_address,true);
		$criteria->compare('state',$this->state,true);
		$criteria->compare('zip',$this->zip,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('tag',$this->tag,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Hotspot the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
