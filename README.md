### データベース構造
#### モデル名：User
<table>
<tr><th>カラム名</th><th>データ型</th>
<tr><td>name</td><td>string</td></tr>
<tr><td>password_digest</td><td>string</td></tr>
</table>

#### モデル名：Task
<table>
<tr><th>カラム名</th><th>データ型</th>
<tr><td>user_id</td><td>bigint</td></tr>
<tr><td>body</td><td>text</td></tr>
<tr><td>deadline</td><td>datetime</td></tr>
<tr><td>priority</td><td>integer</td></tr>
<tr><td>status</td><td>string</td></tr>
</table>

#### モデル名：Label
<table>
<tr><th>カラム名</th><th>データ型</th>
<tr><td>task_id</td><td>bigint</td></tr>
<tr><td>attribute</td><td>text</td></tr>
</table>

#### herokuデプロイ手順
$ heroku login<br>
$ heroku create <アプリの名前><br>
$ git push heroku master<br>
$ heroku run rails db:migrate<br>
$ heroku open<br>

URL:https://rystaskmaneger.herokuapp.com

#### バージョン
フレームワーク：Ruby on Rails　6.0.0
