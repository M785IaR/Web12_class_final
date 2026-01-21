# 後期課題_構築手順書

## 構築手順
ターミナル等からec2インスタンス上で以下のコマンドを順に打ってください

//gitインストール  
sudo yum install git -y  
  
//ec2インスタンスの中にdockertestディレクトリを作る  
mkdir dockertest   

//ec2インスタンスの中にdockertestディレクトリがあるか確認  
ls -l  
  
//dockertestディレクトリがあれば、ディレクトリ内に入る  
cd dockertest  
  
//Dockerが入っていない場合はインストールし、自動的に起動させるようにする  
sudo yum install -y docker  
sudo systemctl start docker  
sudo systemctl enable docker  
  
//権限を毎回sudoして実行しないように、dockerコマンドを実行できるようにdockerグループに追加する  
sudo usermod -a -G docker ec2-user  
  
//ログアウトしてもう一度再ログインする(権限のエラーを防ぐ)  
newgrp docker  
  
//Docker Composeをインストールする  
sudo mkdir -p /usr/local/lib/docker/cli-plugins/  
sudo curl -SL https://github.com/docker/compose/releases/download/v2.36.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose  
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose  
  
//インストールできたかバージョンを確認する  
docker compose version  
  
//GitHubからソースコード(Dockerfile, compose.yml, その他phpコード等)をダウンロードする  
git clone https://github.com/M785IaR/Web12_class_final.git  
  
//ダウンロードしたリポジトリのディレクトリに移動する  
cd Web12_class_final  
  
//ダウンロードしたcompose.ymlがあるか確認する  
ls -l  
   
//ビルド&起動する  
docker compose up -d --build  
  
//ダウンロードしたinit.sqlをデータベースに入れる  
//init.sqlには仮のデータが入ってます  
docker compose exec -T mysql mysql example_db < init.sql  
  
### 以上で構築完了になります
  
## 動作確認
3の構築したサービスのURLでアクセス後、新規登録してログインでもできますが、init.sqlにデータ挿入しているので、  
メールアドレス： chitose@example.com  
パスワード：　password    
と入力してもログインできます。
