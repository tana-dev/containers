# apache
systemctl start httpd.service

# mysql
systemctl start mysqld.service

# VueコンポーネントやSass->CSSコンパイル
npm run dev

# auto compile
npm run watch

# laravelバージョン確認
php artisan --version
php artisan -V

# model作成(※migrationファイルも一緒に)
# とりあえず全部小文字でファイル作成
# 全部複数形に勝手になるが修正
php artisan make:model Models/BasicInfo --migration

# maigrate反映
php artisan migrate

# controller作成(※resourceオプションは標準的CRUDルート)
php artisan make:controller BasicController --resource

# controller作成(※apiオプションは標準的CRUDルート)
php artisan make:controller BasicController --api
