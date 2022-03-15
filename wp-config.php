<?php

//Begin Really Simple SSL session cookie settings
@ini_set('session.cookie_httponly', true);
@ini_set('session.cookie_secure', true);
@ini_set('session.use_only_cookies', true);
//END Really Simple SSL
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'nomisite_wp647' );

/** Database username */
define( 'DB_USER', 'nomisite_wp647' );

/** Database password */
define( 'DB_PASSWORD', 'T8.S-8pb6s' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'ivwseofa0s9zyajptjqvmro47ogqcukduc1vgcjcml3qpsspzqenfd438zsalaj9' );
define( 'SECURE_AUTH_KEY',  'pqk9r4v18uzn48i5tsut8gfymxgtlhf8omhk5yppkg2qsvhnru3cgo5bsou7rlgb' );
define( 'LOGGED_IN_KEY',    'qubnjdk8c5ermjupsgxycxsqm1y1m3cjec1xoih27h0ihdap5ob2pkzbylryaker' );
define( 'NONCE_KEY',        'oizgsyy5xcasqfvlju3rnimij0v8rlrka3frvssu6tiwlc2z6kgs36ml4o4kh3he' );
define( 'AUTH_SALT',        '8olmxzbm6fd3szi0tpmi5k5cq1ysvc43uhpp5xfylnnwqzfi6u4xlkry9uxil2ru' );
define( 'SECURE_AUTH_SALT', '0jmo6uglien57ur0ddo4iqxsdeiraszwrbwvyhmdrecnwhtubyjlawjsmzh9gslq' );
define( 'LOGGED_IN_SALT',   '5kf8rxoqpxm5pivwgqpocibw4mlduykmzstg5wdptvilfa2qzw7z2mmypor37ffa' );
define( 'NONCE_SALT',       'jjtavx2isxbzxr5acfkmn1zrtuyoetaje0epqqjtcjdngvms1pr5iqo5l8v0lqzp' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wpcy_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
