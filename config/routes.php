<?php

use Slim\App;
use Slim\Container;
use App\Controllers;
use App\Middleware\Auth;
use App\Middleware\Guest;
use App\Middleware\Admin;
use App\Middleware\Api;
use App\Middleware\Mu;
use Zeuxisoo\Whoops\Provider\Slim\WhoopsMiddleware;

/***
 * The slim documents: http://www.slimframework.com/docs/objects/router.html
 */

// config
$debug = false;
if (defined("DEBUG")) {
    $debug = true;
}
/***
 * $configuration = [
 * 'settings' => [
 * 'displayErrorDetails' => $debug,
 * ]
 * ];
 * $c = new Container($configuration);
 ***/

// Make a Slim App
// $app = new App($c);
$app = new App([
    'settings' => [
        'debug' => $debug,
        'whoops.editor' => 'sublime'
    ]
]);
$app->add(new WhoopsMiddleware);


// Home
$app->get('/', 'App\Controllers\HomeController:index');
$app->get('/code', 'App\Controllers\HomeController:code');
$app->get('/tos', 'App\Controllers\HomeController:tos');

// User Center
$app->group('/user', function () {
    $this->get('', 'App\Controllers\UserController:index');
    $this->get('/', 'App\Controllers\UserController:index');
    $this->post('/checkin', 'App\Controllers\UserController:doCheckin');
    $this->get('/node', 'App\Controllers\UserController:node');
	$this->get('/lookingglass', 'App\Controllers\UserController:lookingglass');
    $this->get('/node/{id}', 'App\Controllers\UserController:nodeInfo');
    $this->get('/profile', 'App\Controllers\UserController:profile');
    $this->get('/invite', 'App\Controllers\UserController:invite');
	
	$this->get('/shop', 'App\Controllers\UserController:shop');
	$this->post('/coupon_check', 'App\Controllers\UserController:CouponCheck');
	$this->post('/buy', 'App\Controllers\UserController:buy');
	
    $this->post('/invite', 'App\Controllers\UserController:doInvite');
    $this->get('/edit', 'App\Controllers\UserController:edit');
    $this->post('/password', 'App\Controllers\UserController:updatePassword');
	$this->post('/wechat', 'App\Controllers\UserController:updateWechat');
	$this->post('/theme', 'App\Controllers\UserController:updateTheme');
	$this->post('/mail', 'App\Controllers\UserController:updateMail');
    $this->post('/sspwd', 'App\Controllers\UserController:updateSsPwd');
    $this->post('/method', 'App\Controllers\UserController:updateMethod');
    $this->get('/sys', 'App\Controllers\UserController:sys');
    $this->get('/trafficlog', 'App\Controllers\UserController:trafficLog');
    $this->get('/kill', 'App\Controllers\UserController:kill');
    $this->post('/kill', 'App\Controllers\UserController:handleKill');
    $this->get('/logout', 'App\Controllers\UserController:logout');
	$this->get('/code', 'App\Controllers\UserController:code');
	$this->post('/code', 'App\Controllers\UserController:codepost');
	$this->post('/gacheck', 'App\Controllers\UserController:GaCheck');
	$this->post('/gaset', 'App\Controllers\UserController:GaSet');
	$this->get('/gareset', 'App\Controllers\UserController:GaReset');
	$this->post('/resetport', 'App\Controllers\UserController:ResetPort');
	$this->post('/pacset', 'App\Controllers\UserController:PacSet');
	$this->get('/getpcconf', 'App\Controllers\UserController:GetPcConf');
	$this->get('/getiosconf', 'App\Controllers\UserController:GetIosConf');
	$this->post('/unblock', 'App\Controllers\UserController:Unblock');
	$this->get('/bought', 'App\Controllers\UserController:bought');
	$this->get('/bought/{id}/delete', 'App\Controllers\UserController:deleteBoughtGet');
})->add(new Auth());

// Auth
$app->group('/auth', function () {
    $this->get('/login', 'App\Controllers\AuthController:login');
    $this->post('/login', 'App\Controllers\AuthController:loginHandle');
    $this->get('/register', 'App\Controllers\AuthController:register');
    $this->post('/register', 'App\Controllers\AuthController:registerHandle');
    $this->get('/logout', 'App\Controllers\AuthController:logout');
})->add(new Guest());

// Password
$app->group('/password', function () {
    $this->get('/reset', 'App\Controllers\PasswordController:reset');
    $this->post('/reset', 'App\Controllers\PasswordController:handleReset');
    $this->get('/token/{token}', 'App\Controllers\PasswordController:token');
    $this->post('/token/{token}', 'App\Controllers\PasswordController:handleToken');
})->add(new Guest());

// Admin
$app->group('/admin', function () {
    $this->get('', 'App\Controllers\AdminController:index');
    $this->get('/', 'App\Controllers\AdminController:index');
    $this->get('/trafficlog', 'App\Controllers\AdminController:trafficLog');
    // Node Mange
    $this->get('/node', 'App\Controllers\Admin\NodeController:index');
    $this->get('/node/create', 'App\Controllers\Admin\NodeController:create');
    $this->post('/node', 'App\Controllers\Admin\NodeController:add');
    $this->get('/node/{id}/edit', 'App\Controllers\Admin\NodeController:edit');
    $this->put('/node/{id}', 'App\Controllers\Admin\NodeController:update');
    $this->delete('/node/{id}', 'App\Controllers\Admin\NodeController:delete');
    $this->get('/node/{id}/delete', 'App\Controllers\Admin\NodeController:deleteGet');
	
	
	// Shop Mange
    $this->get('/shop', 'App\Controllers\Admin\ShopController:index');
	
	$this->get('/bought', 'App\Controllers\Admin\ShopController:bought');
	$this->get('/bought/{id}/delete', 'App\Controllers\Admin\ShopController:deleteBoughtGet');
	
    $this->get('/shop/create', 'App\Controllers\Admin\ShopController:create');
    $this->post('/shop', 'App\Controllers\Admin\ShopController:add');
    $this->get('/shop/{id}/edit', 'App\Controllers\Admin\ShopController:edit');
    $this->put('/shop/{id}', 'App\Controllers\Admin\ShopController:update');
    $this->get('/shop/{id}/delete', 'App\Controllers\Admin\ShopController:deleteGet');
	
	// Ann Mange
    $this->get('/announcement', 'App\Controllers\Admin\AnnController:index');
    $this->get('/announcement/create', 'App\Controllers\Admin\AnnController:create');
    $this->post('/announcement', 'App\Controllers\Admin\AnnController:add');
    $this->get('/announcement/{id}/edit', 'App\Controllers\Admin\AnnController:edit');
    $this->put('/announcement/{id}', 'App\Controllers\Admin\AnnController:update');
    $this->delete('/announcement/{id}', 'App\Controllers\Admin\AnnController:delete');
    $this->get('/announcement/{id}/delete', 'App\Controllers\Admin\AnnController:deleteGet');
	
	// IP Mange
    $this->get('/alive', 'App\Controllers\Admin\IpController:index');
	$this->get('/block', 'App\Controllers\Admin\IpController:block');
	$this->get('/unblock', 'App\Controllers\Admin\IpController:unblock');
	$this->get('/login', 'App\Controllers\Admin\IpController:index1');
	
	// Code Mange
    $this->get('/code', 'App\Controllers\Admin\CodeController:index');
    $this->get('/code/create', 'App\Controllers\Admin\CodeController:create');
    $this->post('/code', 'App\Controllers\Admin\CodeController:add');

    // User Mange
    $this->get('/user', 'App\Controllers\Admin\UserController:index');
    $this->get('/user/{id}/edit', 'App\Controllers\Admin\UserController:edit');
    $this->put('/user/{id}', 'App\Controllers\Admin\UserController:update');
    $this->delete('/user/{id}', 'App\Controllers\Admin\UserController:delete');
    $this->get('/user/{id}/delete', 'App\Controllers\Admin\UserController:deleteGet');
	
	
	$this->get('/coupon', 'App\Controllers\AdminController:coupon');
    $this->post('/coupon', 'App\Controllers\AdminController:addCoupon');

    $this->get('/profile', 'App\Controllers\AdminController:profile');
    $this->get('/invite', 'App\Controllers\AdminController:invite');
    $this->post('/invite', 'App\Controllers\AdminController:addInvite');
    $this->get('/sys', 'App\Controllers\AdminController:sys');
    $this->get('/logout', 'App\Controllers\AdminController:logout');
})->add(new Admin());

// API
$app->group('/api', function () {
    $this->get('/token/{token}', 'App\Controllers\ApiController:token');
    $this->post('/token', 'App\Controllers\ApiController:newToken');
    $this->get('/node', 'App\Controllers\ApiController:node')->add(new Api());
    $this->get('/user/{id}', 'App\Controllers\ApiController:userInfo')->add(new Api());
});

// mu
$app->group('/mu', function () {
    $this->get('/users', 'App\Controllers\Mu\UserController:index');
    $this->post('/users/{id}/traffic', 'App\Controllers\Mu\UserController:addTraffic');
    $this->post('/nodes/{id}/online_count', 'App\Controllers\Mu\NodeController:onlineUserLog');
	$this->post('/nodes/{id}/info', 'App\Controllers\Mu\NodeController:info');
})->add(new Mu());

// res
$app->group('/res', function () {
    $this->get('/captcha/{id}', 'App\Controllers\ResController:captcha');
});


$app->group('/link', function () {
    $this->get('/{token}', 'App\Controllers\LinkController:GetContent');
});


// Run Slim Routes for App
$app->run();

