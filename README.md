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
作成中。

テスト用アカウント
--
作成中。

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
|account_name|string|null: false, unique: true|アカウントの名前（Twitterの@runba105のようなもの）|
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
- has_one :sns_credential

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
|icon_image|string| |部屋のアイコンの画像、設定されていなければデフォルトの画像|
|explain|string||グループの説明文|
|name|string|null: false|グループ名|

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

