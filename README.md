# 後期課題_構築手順書

## 構築手順
ターミナル等からec2インスタンス上で以下のコマンドを順に打ってください  

### 1. gitインストール
```sh
sudo yum install git -y
```  

### 2. ec2インスタンスの中にdockertestディレクトリを作る
```sh
mkdir dockertest
```

### 3. ec2インスタンスの中にdockertestディレクトリがあるか確認
```sh
ls -l
```

### 4. dockertestディレクトリがあれば、ディレクトリ内に入る
```sh
cd dockertest
```

### 5. Dockerが入っていない場合はインストールし、自動的に起動させるようにする
```sh
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
```

### 6. 権限を毎回sudoして実行しないように、dockerコマンドを実行できるようにdockerグループに追加する
```sh
sudo usermod -a -G docker ec2-user
``` 

### 7. ログアウトしてもう一度再ログインする(権限のエラーを防ぐ)
```sh
newgrp docker
```

### 8. Docker Composeをインストールする
```sh
sudo mkdir -p /usr/local/lib/docker/cli-plugins/
sudo curl -SL https://github.com/docker/compose/releases/download/v2.36.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
```

### 9. インストールできたかバージョンを確認する
```sh
docker compose version
```

### 10. GitHubからソースコード(Dockerfile, compose.yml, その他phpコード等)をダウンロードする
```sh
git clone https://github.com/M785IaR/Web12_class_final.git
```

### 11. ダウンロードしたリポジトリのディレクトリに移動する
```sh
cd Web12_class_final
```

### 12. ダウンロードしたcompose.ymlがあるか確認する
```sh
ls -l
```

### 13. ビルド&起動する
```sh
docker compose up -d --build
```

### 14. ダウンロードしたinit.sqlをデータベースに入れる(init.sqlには仮のデータが入ってます)
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
