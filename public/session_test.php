<?php

// セッションIDの取得（なければ新規で作成&設定）
$session_cookie_name = 'session_id';
$session_id = $_COOKIE[$session_cookie_name] ?? base64_encode(random_bytes(64));
if (!isset($_COOKIE[$session_cookie_name])) {
  setcookie($session_cookie_name, $session_id);
}

// 接続 (redisコンテナの6379番ポートに接続)
$redis = new Redis();
$redis->connect('redis', 6379);

// redisにセッション変数を保存しておくキーを決めておきます。
$redis_session_key = "session-" . $session_id; 

// 既にセッション変数(の配列)が何かしら格納されていればそれを、なければ空の配列を $session_values変数に保存。
$session_values = $redis->exists($redis_session_key)
  ? json_decode($redis->get($redis_session_key), true) 
  : []; 

// 値の保存
// 例として、username は kitagawaと保存
// $session_valuesにセットした上で、redisに保存。
$session_values["username"] = "kitagawa";

// 演習2
$last_access = $session_values['last_access'] ?? 'ありません';
$time = date('Y年m月d日 H時i分s秒');
$session_values['last_access'] = $time;

// 演習1
$access_count = $session_values['access_count'] ?? 0;
$access_count++;
$session_values['access_count'] = $access_count;

$redis->set($redis_session_key, json_encode($session_values));

// 値の取得
// $session_values変数の中身は連想配列なので、素直に値の取得ができますね。
$name = $session_values["username"];
?>
このセッションで<?= $access_count?>回目のアクセスです！<br>
前回の訪問は<?= $last_access?>でした。
