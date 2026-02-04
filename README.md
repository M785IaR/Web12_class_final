# 後期課題_構築手順書

## 構築手順
ターミナル等からec2インスタンス上で以下のコマンドを順に打ってください
### gitインストール  
```sh
sudo yum install git -y
```

### ec2インスタンスの中にdockertestディレクトリを作る  
```sh
mkdir dockertest
```

### ec2インスタンスの中にdockertestディレクトリがあるか確認  
```sh
ls -l
```

### dockertestディレクトリがあれば、ディレクトリ内に入る  
```sh
cd dockertest
```

### Dockerが入っていない場合はインストールし、自動的に起動させるようにする
```sh
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
```

### 権限を毎回sudoして実行しないように、dockerコマンドを実行できるようにdockerグループに追加する
```sh
sudo usermod -a -G docker ec2-user
``` 

### ログアウトしてもう一度再ログインする(権限のエラーを防ぐ)
```sh
newgrp docker
```

### Docker Composeをインストールする
```sh
sudo mkdir -p /usr/local/lib/docker/cli-plugins/
sudo curl -SL https://github.com/docker/compose/releases/download/v2.36.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
```

### インストールできたかバージョンを確認する
```sh
docker compose version
```

### GitHubからソースコード(Dockerfile, compose.yml, その他phpコード等)をダウンロードする
```sh
git clone https://github.com/M785IaR/Web12_class_final.git
```

### ダウンロードしたリポジトリのディレクトリに移動する
```sh
cd Web12_class_final
```

### ダウンロードしたcompose.ymlがあるか確認する
```sh
ls -l
```

### ビルド&起動する
```sh
docker compose up -d --build
```

### ダウンロードしたinit.sqlをデータベースに入れる(init.sqlには仮のデータが入ってます)
```sh
docker compose exec -T mysql mysql -u root example_db < init.sql
```

以上で構築完了になります
  
## 動作確認
構築したサービスのURLでアクセス後、新規登録も可能ですがinit.sqlにデータ挿入しているので、  
すぐに動作確認をしたい場合は以下のアカウントを利用してください。  

```sh
メールアドレス： chitose@example.com
パスワード：　password
```
