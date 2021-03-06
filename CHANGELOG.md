tamachi_vue CHANGELOG
=====================

以下、Git のタグ `ver0` からの変更を記録する。

## Webpacker, Vue.js の導入

* `Gemfile` に `webpacker` を追加して `bundle install`
* `rails webpacker:install`
* `rails webpacker:install:vue`
* `touch app/javascript/packs/.keep`
* `rm app/javascript/packs/app.vue`
* `rm app/javascript/packs/*.js`

## jQuery の除去

* `Gemfile` から `jquery-rails` を削除して `bundle install`
* `app/assets/javascripts/application.js` から `//= require jquery` を削除
* `app/assets/javascripts/users.js` を削除

## `users/form.js` の作成

* `mkdir -p app/javascript/packs/users`
* `app/javascript/packs/users/form.js` を作成
* `Gemfile` から `turbolinks` を削除して `bundle install`
* `app/assets/javascripts/application.js` から `//= require turbolinks` を削除
* `app/views/layouts/application.html.erb` から Turbolinks 関連の記述を削除
* `users/form.js` を document.querySelector でデータ初期化するように書き換え
* `<div v-cloak>...</div>` でフォームを囲む

ここでタグ `ver1` をセット。

* `yarn add vue-data-scooper`
* `users/form.js` で `Vue.use(VueDataScooper)`

ここでタグ `ver2` をセット。

* `Gemfile` に `vue-rails-form-builder` を追加して `bundle install`
* `form_with` を `vue_form_with` で置換
* `v-model` 属性を除去

ここでタグ `ver3` をセット。

* `app/initializers/action_view.rb` を追加。
* `vue_form_with` から `local: true` オプションを除去。

ここでタグ `ver4` をセット。完成。

## Webpacker 2.0 への対応

* `bundle update` を実行。
* `bundle exec rails webpacker:install` を実行。
* 以下のファイルを削除。
  * config/webpack/paths.yml
  * config/webpack/development.server.yml
  * config/webpack/development.server.js
