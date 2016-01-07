<?php

/**
 * This is the model class for table "comment".
 *
 * The followings are the available columns in table 'comment':
 * @property integer $CommentID
 * @property integer $MovieID
 * @property integer $UserID
 * @property string $Content
 * @property string $IssueData
 *
 * The followings are the available model relations:
 * @property Movie $movie
 * @property User $user
 */
class Comment extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'comment';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('MovieID, Content', 'required'),
			array('MovieID, UserID', 'numerical', 'integerOnly'=>true),
			array('IssueData', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('CommentID, MovieID, UserID, Content, IssueData', 'safe', 'on'=>'search'),
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
			'CommentID' => '评论主键',
			'MovieID' => '该评论对应的电影',
			'UserID' => 'User',
			'Content' => 'Content',
			'IssueData' => 'Issue Data',
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

		$criteria->compare('CommentID',$this->CommentID);
		$criteria->compare('MovieID',$this->MovieID);
		$criteria->compare('UserID',$this->UserID);
		$criteria->compare('Content',$this->Content,true);
		$criteria->compare('IssueData',$this->IssueData,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Comment the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    public function getCommentByMovieID($id){
        $sql = "select S.UserName,T.Content,T.IssueDate,T.UserID from user S  join Comment T
				where T.MovieID = $id and S.UserID = T.UserID order by IssueDate desc";
        return Yii::app()->db->createCommand($sql)->queryAll();
    }
}
