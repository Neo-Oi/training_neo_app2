# README
## プロジェクト概要
- プライムテックユニットの研修に当たり、ログイン、ユーザ管理のできるシステムを開発した。
- ボタンによる遷移と入力によるデータ保存を通し、ログイン及び管理を行える。
- AIを使用せず、自らの手で作成した。

## 機能
- ユーザのログイン、ログアウト
- ユーザのCRUD
- 権限区分
- バリデーション
- アクセス制御

## インストール手順
### 前提
- Docker for Desktop
- WSL2
- Rails : 8.0.2
- Ruby : 3.3.0

### 導入
- $ git clone https://github.com/Neo-Oi/training_neo_app2#
- $ docker compose build
- $ docker compose web exec db:create
- $ docker compose web exec db:migrate
- $ docker compose web exec db:seed
- $ docker compose up
- http://localhost:3000 へアクセス

## 作者
- 日本コムシンク株式会社
- プライムテックユニット
- neo-oi@comthink.co.jp
- 大井 音和
- 2026/07/10

## 学習したこと
- 詰まれば詰まるほど、その部分に対する理解が大きくなる。
- AIを使用しないことで、自分でエラーを読み解くことができるようになり、コピペする手間が省ける。
- 自分の手だからこそ可読性の高い文にしなくてはのちの修正が大変になる。
- 古い記事は参考になってもあっているとは限らないので日時についてはしっかり確認するべき。