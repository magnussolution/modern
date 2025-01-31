<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

class User extends ActiveRecord implements IdentityInterface
{
    public $id;
    public $username;
    public $password;
    public $authKey;
    public $accessToken;


    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pkg_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $rules = [
            [['username', 'password'], 'required'],
            [[
                'id_user',
                'id_group',
                'id_plan',
                'id_offer',
                'active',
                'enableexpire',
                'expiredays',
                'typepaid',
                'creditlimit',
                'credit_notification',
                'sipaccountlimit',
                'restriction',
                'callingcard_pin',
                'callshop',
                'plan_day',
                'active_paypal',
                'boleto',
                'boleto_day',
                'calllimit',
                'disk_space',
                'id_group_agent',
                'transfer_dbbl_rocket_profit',
                'transfer_bkash_profit',
                'transfer_flexiload_profit',
                'transfer_international_profit',
                'transfer_dbbl_rocket',
                'transfer_bkash',
                'transfer_flexiload',
                'transfer_international',
                'transfer_bdservice_rate',
                'transfer_show_selling_price',
                'cpslimit',
                'restriction_use',
                'credit_notification_daily',
                'email_services',
                'email_did',
                'inbound_call_limit'
            ], 'integer'],
            [['language', 'mix_monitor_format', 'calllimit_error'], 'string', 'max' => 5],
            [['zipcode', 'phone', 'mobile', 'vat'], 'string', 'max' => 20],
            [['city', 'state', 'country', 'loginkey'], 'string', 'max' => 40],
            [['lastname', 'firstname', 'redial', 'neighborhood'], 'string', 'max' => 50],
            [['company_website', 'dist'], 'string', 'max' => 100],
            [['address', 'email', 'email2', 'doc'], 'string', 'max' => 100],
            [['username'], 'string', 'min' => 4, 'max' => 20],
            [['description', 'prefix_local', 'access_token'], 'string', 'max' => 500],
            [['credit', 'contract_value'], 'number'],
            [['expirationdate', 'password', 'lastuse', 'company_name', 'commercial_name'], 'string', 'max' => 100],
            [['username'], 'checkUsername'],
            [['password'], 'checkSecret'],
            [['username'], 'unique', 'targetClass' => self::class, 'message' => 'Username already exists'],
        ];

        return $this->getExtraField($rules);
    }

    /**
     * Validação personalizada do nome de usuário.
     */
    public function checkUsername($attribute, $params)
    {
        if (preg_match('/ /', $this->username)) {
            $this->addError($attribute, Yii::t('zii', 'No space allowed in username'));
        }

        if (!preg_match('/^[0-9A-Za-z]/', $this->username)) {
            $this->addError($attribute, Yii::t('zii', 'Username must start with numbers or letters'));
        }
    }

    /**
     * Validação personalizada da senha.
     */
    public function checkSecret($attribute, $params)
    {
        if (preg_match('/ /', $this->password)) {
            $this->addError($attribute, Yii::t('zii', 'No space allowed in password'));
        }

        if (in_array($this->password, [['123456'], '12345678', '012345'])) {
            $this->addError($attribute, Yii::t('zii', 'Do not use sequences in the password'));
        }

        if ($this->password === $this->username) {
            $this->addError($attribute, Yii::t('zii', 'Password cannot be equal to username'));
        }
    }



    private static $users = [
        '100' => [
            'id' => '100',
            'username' => 'admin',
            'password' => 'admin',
            'authKey' => 'test100key',
            'accessToken' => '100-token',
        ],
        '101' => [
            'id' => '101',
            'username' => 'demo',
            'password' => 'demo',
            'authKey' => 'test101key',
            'accessToken' => '101-token',
        ],
    ];


    /**
     * {@inheritdoc}
     */
    public static function findIdentity($id)
    {
        return isset(self::$users[$id]) ? new static(self::$users[$id]) : null;
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        foreach (self::$users as $user) {
            if ($user['accessToken'] === $token) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        foreach (self::$users as $user) {
            if (strcasecmp($user['username'], $username) === 0) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->authKey;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->password === $password;
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->auth_key = \Yii::$app->security->generateRandomString();
            }
            return true;
        }
        return false;
    }
}
