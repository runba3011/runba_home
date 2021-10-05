アプリケーション名
--
Runba's Home

アプリケーション概要
--
簡単に言えば私のファンサイト。
投稿した動画を見ることができたり、作成したゲームの攻略情報を共有することができたり、リクエストを出したりすることができる。
また、ユーザー同士のリアルタイムのチャットも可能。


URL
--
https://runba-home.herokuapp.com/

テスト用アカウント
--
email:example@gmail.com
password:password

利用方法
--
トップページから何を見るかを選択し、そこからさらにどのステージや動画を見るかを選択する。
それぞれのコメント機能から、攻略情報や動画へのコメントの投稿が可能。

チャット機能を選択した場合参加するルームを選択し、下部分の欄からチャットを送信する。

リクエスト機能を選択した場合、リクエストする内容を選択、その他を選択した場合はリクエストする内容のタイトルを入力し、その下の広い部分に詳細な内容を記載し送信を押すと、リクエストを送信することができる。

目指した課題解決
--
ユーザー同士の交流がそれほど活発ではないのに加え、特に作成したゲームに関しては交流の場そのものが提供されていない。
攻略情報の共有などの便利情報を備えながら、その場で交流することができるようにした。

洗い出した要件
--
- 攻略情報、チャットルーム機能の作成は必須。
- リクエスト機能を実装し、ユーザーの声を作者に届けやすくしたい。
- 投稿した動画をみれるようにし、可能であればyoutubeに表示されているコメントをこちらのサイトに表示したり、こちらのサイトで投稿したコメントをYouTubeの方でも投稿されるようにしたい。

実装した機能の画像、説明
--

__サイトとしての機能__
ゲームの情報を選択していき、ステージの攻略ページを開く機能
https://gyazo.com/cdcbada91ff8a46b7905d7b468792f3b

攻略ページにコメントを投稿する機能（ページの遷移は無し）
https://gyazo.com/f775aeab469a2be20d199a2454b8b6c5

攻略ページにつけたコメントを削除する機能（ページの遷移は無し）
https://gyazo.com/2e5487f29f9b955194ddff41aaf23c75

キャラクターステータスを確認する機能（素手　のみ現在作成済みです）
https://gyazo.com/2aabd4befec9401d2b216f02c1758fa8

開いているページから、前後のキャラクターページへ移動する機能
https://gyazo.com/4cb46e466cfbfd1a83e53c68e4781b89


動画を視聴する機能
https://gyazo.com/deddee54f3c2d33e8ba54c58b24f9258

動画にコメントを追加する機能（非同期通信）
https://gyazo.com/4bd2a8a5c35e1da3e1aa93295942a94d

動画につけたコメントを削除する機能（非同期通信）
https://gyazo.com/1c898bea90b5fceb96b15f338777b524

__拡張部分__
ユーザーアイコンなどを変更する際、設定した画像が表示されるようにする機能
https://gyazo.com/d263e7e369c77c17ed844a19034f20f6


__基礎部分__

__ユーザー関係__
ユーザー登録をする機能
https://gyazo.com/ef512f118a7953ba1b3403ca32f81fb9

ログアウトをする機能
https://gyazo.com/e145385787548dd96df11fd6a841469e

ログインする機能
https://gyazo.com/55063cc3e919fa836b26e469095927e1

Googleアカウントを使用してログインする機能
https://gyazo.com/ddfb9d6db69d9b924c4afca0fd732b84

ユーザー編集機能
変更前
https://gyazo.com/23cd28c4dda65680576ca96153697b6b

変更後
https://gyazo.com/86261dec871ed2802917205b35323965



実装予定の機能
--

ローカルでの動作方法
--



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
|explain|text|text|自己紹介|

- has_many :group_user_relations
- has_many :groups , through: :group_user_relation
- has_many :message
- has_many :followers 
- has_many :stickman_war_comments
- has_many :requests
- has_many :movie_comments
- has_one :sns_credential
- has_one_attached :icon_image
- has_one_attached :background_image

最初登録する時にはaccount_nameは入力させず、編集する時にのみバリデーションをかける

SnsCredentials table
--
SNSアカウントを利用してログインした時に使用するもの。

|column|type|options|explain|
|-|-|-|-|
|provider|string|null: false|使用したSNSアカウントのプロバイダー|
|uid|string|null: false|ユーザーのID|
|user|references|null: false|このレコードに該当するユーザー|

- belongs_to :user


GroupUserRelationsテーブル
--
グループとユーザーの中間テーブル。
## 権限について
５：ルームの作者。メンバーの追放、追加、ルームの削除が可能。
４：メンバーの追加、追放が可能。権限５以外のメンバーから追放されない。
３：メンバーの追加、追放が可能。
２：メンバーの追加が可能。
１：なんの権限も持たない。

|column|type|options|explain|
|-|-|-|-|
|user|references|null: false|ユーザー|
|group|references|null: false|グループ|
|authority|integer|only_integer: :true|メンバーを管理する権限|

- belongs_to :user
- belongs_to :group

Groupsテーブル
--
チャットを行うことができる場所。

|column|type|options|explain|
|-|-|-|-|
|explain|string||グループの説明文|
|name|string|null: false|グループ名|

- has_one_attached :image
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
- has_one_attached :image

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
|stage_id|string|null: false|投稿されたステージのID、"3-8"というような形で表される|
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

