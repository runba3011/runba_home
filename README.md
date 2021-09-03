# データベース設計


Usersテーブル
--
ログインなどに関わる部分。

|column|type|options|explain|
|-|-|-|-|
|nickname|string|null: false|名前|
|account_name|string|null: false|アカウントの名前（Twitterの@runba105のようなもの）|
|email|string|null: false|メールアドレス|
|encrypted_password|string|null: false|パスワード|
|rank|integer|only_integer|現在のレベル（今後実装）|
|point|integer|only_integer|所有ポイント（今後実装）|
|image_name|string| |アイコンの画像、publicディレクトリに保存する|
|explain|text|text|自己紹介|

- has_many :group_user_relations
- has_many :groups , through: :group_user_relation
- has_many :message
- has_many :followers 
- has_many :stickman_war_comments
- has_many :requests
- has_many :movie_comments


GroupUserRelationsテーブル
--
グループとユーザーの中間テーブル。

|column|type|options|explain|
|-|-|-|-|
|user|references|null: false|ユーザー|
|group|references|null: false|グループ|

- belongs_to :user
- belongs_to :group

Groupsテーブル
--
チャットを行うことができる場所。

|column|type|options|explain|
|-|-|-|-|
|icon_image|string| |部屋のアイコンの画像、設定されていなければデフォルトの画像|
|explain|string||グループの説明文|

- has_many :group_user_relations , dependent: :destroy
- has_many :users , through: :group_user_relation
- has_many :messages , dependent: :destroy

Messagesテーブル
--
チャットで送信されたメッセージの内容。

|column|type|options|explain|
|-|-|-|-|
|group|references|null: false|このメッセージが所属するグループ|
|user|references|null: false|投稿したユーザー|
|text|string|null: false|メッセージの内容|

- belongs_to :group
- belongs_to :user

Followersテーブル
--
ユーザー同士のフォローの関係。

|column|type|options|explain|
|-|-|-|-|
|user|references|null: false|フォロー元のユーザー|
|following_id|references|null: false|フォロー先のユーザー|

- belongs_to :user
- belongs_to :following , class_name: "User"

StickmanWarCommentsテーブル
--
棒バトチャレンジのステージ攻略についたコメント。

|column|type|options|explain|
|-|-|-|-|
|stage_id|integer|null: false|投稿されたステージのID、"3-8"というような形で表される|
|text|string|null: false||
|user|references|null: false|投稿したユーザー名|
|stage_type|string|null: false|ステージタイプ名、現時点ではbasic, challenge,moneyの三種類|
|
|stage_number|integer|null: false|ステージ番号、3-8 の3の部分|
|detail_stage_number|integer|null: false|ステージ詳細番号、3-8 の8の部分|

- belongs_to :user


Requestsテーブル
--
リクエストの内容。ページの中で表示することはそれほどない。
更新されたらメールが届くようにしたい。
|column|type|options|explain|
|-|-|-|-|
|text|string|null: false|リクエストの内容|
|user|references|null: false|リクエストを投稿したユーザー|

- belongs_to :user

MovieCommentsテーブル
--
動画についたコメント。
動画をテーブルで管理しないため、データの取り出し方が少し違う点に注意。
|column|type|options|explain|
|-|-|-|-|
|movie_id|integer|null: false|動画の番号、paramsから取得|
|text|string|null: false|コメントの内容|
|user|references|null: false|投稿したユーザー|

- belongs_to :user
