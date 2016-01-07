<?php

/**
 * This is the model class for table "passage".
 *
 * The followings are the available columns in table 'passage':
 * @property integer $PassageID
 * @property integer $MovieID
 * @property integer $UserID
 * @property string $Title
 * @property string $Content
 * @property string $IssueDate
 * @property integer $GoodTime
 * @property integer $BadTime
 * @property double $Mark
 *
 * The followings are the available model relations:
 * @property Movie $movie
 * @property User $user
 */
class Passage extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'passage';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('MovieID, UserID, Title, Content, IssueDate', 'required'),
			array('MovieID, UserID, GoodTime, BadTime', 'numerical', 'integerOnly'=>true),
			array('Mark', 'numerical'),
			array('Title', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('PassageID, MovieID, UserID, Title, Content, IssueDate, GoodTime, BadTime, Mark', 'safe', 'on'=>'search'),
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
			'movie' => array(self::BELONGS_TO, 'Movie', 'MovieID'),
			'user' => array(self::BELONGS_TO, 'User', 'UserID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'PassageID' => '长评ID',
			'MovieID' => '电影ID',
			'UserID' => '发布的用户ID',
			'Title' => '长评论标题',
			'Content' => 'Content',
			'IssueDate' => 'Issue Date',
			'GoodTime' => '被赞次数',
			'BadTime' => '被贬次数',
			'Mark' => '评分',
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

		$criteria->compare('PassageID',$this->PassageID);
		$criteria->compare('MovieID',$this->MovieID);
		$criteria->compare('UserID',$this->UserID);
		$criteria->compare('Title',$this->Title,true);
		$criteria->compare('Content',$this->Content,true);
		$criteria->compare('IssueDate',$this->IssueDate,true);
		$criteria->compare('GoodTime',$this->GoodTime);
		$criteria->compare('BadTime',$this->BadTime);
		$criteria->compare('Mark',$this->Mark);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Passage the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    public function getPassageByMovieID($id){
        $sql = "select PassageID,P.movieID,P.UserID,P.Title as PTitle,Content,P.IssueDate,Mark,GoodTime,BadTime,ShortCut,M.Title,U.UserID as MovieName,U.UserName
                from passage P  JOIN movie M ON p.MovieID = M.MovieID JOIN user U ON U.UserID = P.UserID
                where P.MovieID = $id";

        return Yii::app()->db->createCommand($sql)->queryAll();
    }

    public function getPassageByID($id){
        $sql = "select P.PassageID,P.MovieID,P.UserID,P.Title,Content,P.IssueDate,Mark,GoodTime,BadTime,M.Title as MovieName,U.UserName
                from passage P  JOIN movie M ON p.MovieID = M.MovieID JOIN user U ON U.UserID = P.UserID
                where P.PassageID = $id";

        return Yii::app()->db->createCommand($sql)->queryAll();
    }

    public function updatePassageByID($id,$evelate){
        $sql = "update Passage set $evelate = $evelate + 1 where PassageID = $id";

        Yii::app()->db->createCommand($sql)->query();
    }

    public function getPassageByUserID($id){
        $sql = "select P.PassageID,P.MovieID,P.UserID,P.Title,Content,P.IssueDate,Mark,GoodTime,BadTime,ShortCut,M.Title as MovieName,U.UserName
                from passage P  JOIN movie M ON p.MovieID = M.MovieID JOIN user U ON U.UserID = P.UserID
                where U.UserID = $id";

        return Yii::app()->db->createCommand($sql)->queryAll();
    }
}
