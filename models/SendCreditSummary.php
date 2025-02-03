<?php
namespace app\models;

use Yii;
use yii\base\Model;
/**
 * Modelo para a tabela "SendCredit".
 * =======================================
 * ###################################
 * MagnusBilling
 *
 * @package MagnusBilling
 * @author Adilson Leffa Magnus.
 * @copyright Copyright (C) 2005 - 2023 MagnusSolution. All rights reserved.
 * ###################################
 *
 * This software is released under the terms of the GNU Lesser General Public License v3
 * A copy of which is available from http://www.gnu.org/copyleft/lesser.html
 *
 * Please submit bug reports, patches, etc to https://github.com/magnusbilling/mbilling/issues
 * =======================================
 * Magnusbilling.com <info@magnusbilling.com>
 * 19/02/2018
 */

class SendCreditSummary extends Model
{

    protected $_module = 'sendcreditsummary';
    public $day;
    public $stopdate;
    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    /**
     * @return nome da tabela.
     */
    public function tableName()
    {
        return 'pkg_send_credit';
    }

    /**
     * @return array validacao dos campos da model.
     */
    public function rules()
    {
        $rules = [
            ['id_user, confirmed', 'numerical', 'integerOnly' => true],
            ['service,provider,received_amout', 'length', 'max' => 50],
            ['operator_name', 'length', 'max' => 100],
            ['number, cost, sell, earned, amount', 'length', 'max' => 20],
        ];
        return $this->getExtraField($rules);
    }

    /*
     * @return array regras de relacionamento.
     */
    public function relations()
    {
        return [
            'idUser' => [self::BELONGS_TO, 'User', 'id_user'],
        ];
    }
}
