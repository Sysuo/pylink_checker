# リンクが有効化をチェックするツール
（というのがおこがましいくらい簡易なもの）

## 環境
Python3 以上で動作します。
Dockerfileが入っているので、dockerコンテナを作って動かせます。
こちらのコマンドでビルドできます。
```
./docker-up.sh
```

## 使い方
フォルダ内に `links.txt`を配置して、`check.py`を実行します。
```
python3 check.py
```
`links.txt`はチェックしたいURLを１行ずつ入力してください。