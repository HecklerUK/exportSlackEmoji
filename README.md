# exportSlackEmoji
slackのemojiをexportできる。(slackにexport機能はない)

ファイル名がemoji名になった画像が保存される。

importはSlack Emoji Toolsという拡張を使うと一括で可能。


## 動作環境
WSL Ubuntuで動作確認済。

package管理がaptでない場合、既にnodejsやnpmを使用している場合は適宜setup.shを修正してください。


## Usage
### JavaScriptと必要なnpm module一式を入れる

`$ ./setup.sh`

- 途中色々聞かれるが全てEnterでよい

- warnがいくつか出るがこれも特に問題なし

- ディレクトリにpackage-lock.jsonとnode_modules/ができていればOK


### workspaceアクセス用にトークンを発行する(今回はslack apiでappを作成することで発行する、時期によって発行方法は変わることがある)

- exportしたいemojiがあるWorkspaceにサインイン

- [https://api.slack.com/](https://api.slack.com/)にアクセス

- 発行用のappを作成

-- Your App->create new appでApp Nameに適当な名前を入れ、Development Slack Workspaceにexport元のWorkspaceを選択してcreate

- emojiを見るためのscopeを追加

-- Your Apps->登録したapp->Add features and functionality->Permissions->Scopesで"User Token Scopes"の"Add an OAuth Scope"に"emoji:read"を追加


- トークンの発行

-- Your Apps->登録したapp->Install your app to your workspace->Install App to Workspaceでappをインストール

--- 無料プランの場合appを作れる上限があるので、弾かれるようならappに空きがあるか確認する

- 成功したらトークンをメモする

-- Your Apps->登録したapp->Add features and functionality->Permissions->OAuth & PermissionsのOAuth Access Tokenに"sosp-..."のような文字列があるのでcopy

- copyしたトークンを使えるようにする

-- .envというファイルを作成し、中身を以下のようにする
`apitoken = "xoxp-..."`


### emojiのexport

`node index.js`

- emojis/にemojiの画像ファイルが生成されていれば成功

- 何もできていない場合、tokenが間違っている可能性がある




