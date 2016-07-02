<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Viễn Tin',
	'timeZone' => 'Asia/Ho_Chi_Minh',
	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.modules.user.models.*',
		'application.modules.user.components.*',
		'application.modules.rights.*',
		'application.modules.rights.components.*',
		'application.controllers.BaseController',
	),
	'modules'=>array(
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'123',
			// 'ipFilters'=>array(...a list of IPs...),
			// 'newFileMode'=>0666,
			// 'newDirMode'=>0777,
		),
		'user'=>array(
			'tableUsers' => 'user',
			'tableProfiles' => 'profiles',
			'tableProfileFields' => 'profiles_fields',
			# encrypting method (php hash function)
			'hash' => 'md5',
			# send activation email
			'sendActivationMail' => true,
			# allow access for non-activated users
			'loginNotActiv' => false,
			# activate user on registration (only sendActivationMail = false)
			'activeAfterRegister' => false,
			# automatically login from registration
			'autoLogin' => true,
			# registration path
//			'registrationUrl' => array('/user/registration'),
			# recovery password path
//			'recoveryUrl' => array('/user/recovery'),
			# login form path
			'loginUrl' => array('/site/login'),
			# page after login
			'returnUrl' => array('/user/profile'),
			# page after logout
			'returnLogoutUrl' => array('/site/login'),
		),

		//Modules Rights
		'rights'=>array(

			'superuserName'=>'Admin', // Name of the role with super user privileges.
			'authenticatedName'=>'Authenticated',  // Name of the authenticated user role.
			'userIdColumn'=>'id', // Name of the user id column in the database.
			'userNameColumn'=>'username',  // Name of the user name column in the database.
			'enableBizRule'=>true,  // Whether to enable authorization item business rules.
			'enableBizRuleData'=>true,   // Whether to enable data for business rules.
			'displayDescription'=>true,  // Whether to use item description instead of name.
			'flashSuccessKey'=>'RightsSuccess', // Key to use for setting success flash messages.
			'flashErrorKey'=>'RightsError', // Key to use for setting error flash messages.

			'baseUrl'=>'/rights', // Base URL for Rights. Change if module is nested.
			'layout'=>'rights.views.layouts.main',  // Layout to use for displaying Rights.
			'appLayout'=>'application.views.layouts.main', // Application layout.
			'cssFile'=>'rights.css', // Style sheet file to use for Rights.
			'install'=>false,  // Whether to enable installer.
			'debug'=>false,
		),
	),
	'defaultController'=>'promote/view',
	// application components
	'components'=>array(
		'format' => array(
			'class' => 'application.extensions.CustomFormatter',
		),
		'user'=>array(
			'class'=>'RWebUser',
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
			'loginUrl'=>array('/site/login'),
		),
		'authManager' => array(
			'class'=>'RDbAuthManager',
			'connectionID'=>'db',
			'itemTable'=>'authitem',
			'itemChildTable'=>'authitemchild',
			'assignmentTable'=>'authassignment',
			'rightsTable'=>'rights',
			'defaultRoles'=>array('Guest'),
		),
//		'db'=>array(
//			'connectionString' => 'sqlite:protected/data/blog.db',
//			'tablePrefix' => 'tbl_',
//		),
		// uncomment the following to use a MySQL database

		'db'=>array(
			// Local
			'connectionString' => 'mysql:host=localhost;dbname=vientin02',
			'username' => 'root',
			'password' => 'root',
			// VienTin Server
//			'connectionString' => 'mysql:host=localhost;dbname=dbapp',
//			'username' => 'vanminh',
//			'password' => '123456',
			'charset' => 'utf8',
			'emulatePrepare' => true,
//			'tablePrefix' => 'tbl_',
		),

		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		'urlManager'=>array(
			'urlFormat'=>'path',
			'showScriptName'=>true,
			'caseSensitive'=>false,
			'rules'=>array(
				'post/<id:\d+>/<title:.*?>'=>'post/view',
				'posts/<tag:.*?>'=>'post/index',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
				'coupon_sdk'=>'promote/create',
			),
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=> require(dirname(__FILE__) . '/params.php'),
);