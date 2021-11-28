const mix = require('laravel-mix')

mix.sass('resources/css/mails.sass', 'css/mails.css')
	.disableNotifications()