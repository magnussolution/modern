<?php

namespace app\controllers;

use Yii;
use yii\helpers\Url;
use yii\web\Response;
use yii\web\Controller;
use app\models\LoginForm;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;
use yii\base\ViewNotFoundException;
use yii\web\JsExpression;
use yii\data\ActiveDataProvider;
use app\models\Provider;



class RouteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionProvider()
    {
        if (Yii::$app->session->get('logged')) {
            $query = Provider::find();

            $provider = new ActiveDataProvider([
                'query' => $query,

            ]);

            // Extract data from ActiveDataProvider
            $data = array_map(function ($model) {
                return $model->attributes;
            }, $provider->getModels());

            $this->layout = 'magnus_layout';

            return $this->render('provider', [
                'dataProvider' => $data,  // Pass extracted data
                'gridColumns' => [],
                'searchModel' => []
            ]);
        } else {
            return $this->redirect(['authentication/index']);
        }
    }
    public function actionSave()
    {
        $request = Yii::$app->request;
        $data = json_decode($request->getRawBody(), true);
        $provider = new Provider();
        $provider->provider_name = isset($data['provider_name']) ? $data['provider_name'] : null;
        $provider->credit = isset($data['credit']) ? $data['credit'] : null;
        $provider->credit_control = isset($data['creditcontrol']) ? $data['creditcontrol'] : null;
        $provider->description = isset($data['description']) ? $data['description'] : null;
        $provider->creationdate = date('Y-m-d H:i:s'); // Setting current timestamp

        if ($provider->save()) {

            return $this->asJson(['success' => true, 'data' => $provider->id]);
        } else {
            return $this->asJson(['success' => false, 'message' => 'Failed to save provider.', 'errors' => $provider->errors]);
        }
    }
    public function actionDelete()
    {
        $request = Yii::$app->request;
        $data = json_decode($request->getRawBody(), true);
        $id = isset($data['id']) ? $data['id'] : null;

        if (!$id) {
            return $this->asJson(['success' => false, 'message' => 'ID is required.']);
        }

        $provider = Provider::findOne($id);

        if (!$provider) {
            return $this->asJson(['success' => false, 'message' => 'Provider not found.']);
        }

        if ($provider->delete()) {
            return $this->asJson(['success' => true, 'message' => 'Provider deleted successfully.']);
        } else {
            return $this->asJson(['success' => false, 'message' => 'Failed to delete provider.']);
        }
    }
    public function actionUpdate()
    {
        $request = Yii::$app->request;
        $data = json_decode($request->getRawBody(), true);

        $id = isset($data['id']) ? $data['id'] : null;

        if (!$id) {
            return $this->asJson(['success' => false, 'message' => 'ID is required.']);
        }

        $provider = Provider::findOne($id);

        if (!$provider) {
            return $this->asJson(['success' => false, 'message' => 'Provider not found.']);
        }

        // Updating attributes if they are set in the request
        if (isset($data['provider_name'])) {
            $provider->provider_name = $data['provider_name'];
        }
        if (isset($data['description'])) {
            $provider->description = $data['description'];
        }
        if (isset($data['credit'])) {
            $provider->credit = $data['credit'];
        }
        if (isset($data['creationdate'])) {
            $provider->creationdate = $data['creationdate'];
        }

        if ($provider->save()) {
            return $this->asJson(['success' => true, 'message' => 'Provider updated successfully.']);
        } else {
            return $this->asJson(['success' => false, 'message' => 'Failed to update provider.', 'errors' => $provider->getErrors()]);
        }
    }

    public function actionTrunk()
    {

        $this->layout = 'magnus_layout';
        return $this->render('trunk');
    }

    public function actionRoot($action = '')
    {

        $this->layout = 'magnus_layout';
        try {
            return $this->render($action);
        } catch (ViewNotFoundException $e) {
            throw new NotFoundHttpException();
        }
    }
}
