<?php

/**
 * This is the model class for table "movie".
 *
 * The followings are the available columns in table 'movie':
 * @property integer $MovieID
 * @property string $Title
 * @property string $Director
 * @property string $Writer
 * @property string $Starts
 * @property double $Rating
 * @property string $Contury
 * @property string $Poster
 * @property string $TimeSpan
 * @property string $IssueDate
 * @property string $MovieDesc
 *
 * The followings are the available model relations:
 * @property Comment[] $comments
 * @property IsType[] $isTypes
 */
class Movie extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'movie';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Title, Director, Writer, Starts', 'required'),
			array('Rating', 'numerical'),
			array('Title, Starts, Poster', 'length', 'max'=>255),
			array('Director, Writer, Contury', 'length', 'max'=>60),
			array('TimeSpan', 'length', 'max'=>10),
			array('IssueDate, MovieDesc', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('MovieID, Title, Director, Writer, Starts, Rating, Contury, Poster, TimeSpan, IssueDate, MovieDesc', 'safe', 'on'=>'search'),
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
			'comments' => array(self::HAS_MANY, 'Comment', 'MovieID'),
			'isTypes' => array(self::HAS_MANY, 'IsType', 'MovieID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'MovieID' => '电影主键',
			'Title' => '电影片名',
			'Director' => '电影导演',
			'Writer' => '电影编剧',
			'Starts' => '电影主演',
			'Rating' => '电影评分',
			'Contury' => '出品国家',
			'Poster' => '电影海报（图片路径）',
			'TimeSpan' => '电影时长',
			'IssueDate' => '上映时间',
			'MovieDesc' => '电影描述/介绍',
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

		$criteria->compare('MovieID',$this->MovieID);
		$criteria->compare('Title',$this->Title,true);
		$criteria->compare('Director',$this->Director,true);
		$criteria->compare('Writer',$this->Writer,true);
		$criteria->compare('Starts',$this->Starts,true);
		$criteria->compare('Rating',$this->Rating);
		$criteria->compare('Contury',$this->Contury,true);
		$criteria->compare('Poster',$this->Poster,true);
		$criteria->compare('TimeSpan',$this->TimeSpan,true);
		$criteria->compare('IssueDate',$this->IssueDate,true);
		$criteria->compare('MovieDesc',$this->MovieDesc,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Movie the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
