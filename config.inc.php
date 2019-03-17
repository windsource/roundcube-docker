<?php
    $config['db_dsnw'] = 'sqlite:////var/www/html/db/sqlite.db?mode=0646';
    $config['db_dsnr'] = '';
    $config['default_host'] = 'ssl://imap.gmx.net';
    $config['default_port'] = '993';
    $config['smtp_server'] = 'ssl://mail.gmx.net';
    $config['smtp_port'] = '465';
    $config['temp_dir'] = '/var/www/html/temp';
    $config['plugins'] = ['archive', 'zipdownload', 'carddav', 'html5_notifier', 'ident_switch', 'persistent_login'];
    $config['zipdownload_selection'] = true;
    $config['log_driver'] = 'stdout';
    $config['skin'] = 'elastic';