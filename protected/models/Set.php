<?php

/**
 * This is the model class for table "set".
 *
 * The followings are the available columns in table 'set':
 * @property integer $SetID
 * @property string $SetName
 * @property integer $UserID
 * @property string $CreatTime
 * @property string $Remark
 *
 * The followings are the available model relations:
 * @property User[] $users
 * @property User $user
 * @property Movie[] $movies
 */
class Set extends CActiveRecord
{
    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return 'set';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('SetName, UserID, CreatTime', 'required'),
            array('UserID', 'numerical', 'integerOnly'=>true),
            array('SetName, Remark', 'length', 'max'=>255),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('SetID, SetName, UserID, CreatTime, Remark', 'safe', 'on'=>'search'),
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
            'users' => array(self::MANY_MANY, 'User', 'collect(SetID, UserID)'),
            'user' => array(self::BELONGS_TO, 'User', 'UserID'),
            'movies' => array(self::MANY_MANY, 'Movie', 'set_movie(SetID, MovieID)'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'SetID' => '集合ID',
            'SetName' => '集合名称',
            'UserID' => '创建者',
            'CreatTime' => '创建时间',
            'Remark' => '备注',
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

        $criteria->compare('SetID',$this->SetID);
        $criteria->compare('SetName',$this->SetName,true);
        $criteria->compare('UserID',$this->UserID);
        $criteria->compare('CreatTime',$this->CreatTime,true);
        $criteria->compare('Remark',$this->Remark,true);

        return new CActiveDataProvider($this, array(
            'criteria'=>$criteria,
        ));
    }

    /**
     * Returns the static model of the specified AR class.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Set the static model class
     */
    public static function model($className=__CLASS__)
    {
        return parent::model($className);
    }

    public function getSetsCount(){
        $sql = "SELECT S.SetID as SetID,COUNT(movieID) as Num from `set` S LEFT JOIN set_movie T USING (SetID) GROUP BY S.SetID";
        $tmp = Yii::app()->db->createCommand($sql)->queryAll();

        $rtn = array();
        foreach($tmp as $one){
            $rtn[$one['SetID']] = $one['Num'];
        }
        return $rtn;
    }

    public function getMoviesOfSet($setID,$select = '*'){
        $sql = "SELECT {$select} from set_movie LEFT JOIN movie USING (MovieID) where setID = '{$setID}'";
        return  Yii::app()->db->createCommand($sql)->queryAll();
    }

    public function getSetsByID($setID){
        $sql = "select * from `set` s LEFT JOIN user u USING (UserID) where setID = '{$setID}'";
        return  Yii::app()->db->createCommand($sql)->queryAll();
    }
}
