<?php
session_start();

// セッション変数をすべて解除する
$_SESSION = array();

// クッキーに保存されているセッションIDも削除する
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 42000, '/');
}

// 最終的にセッションを破棄する
session_destroy();

// ログイン画面へリダイレクト
header("Location: /login.php");
exit;
