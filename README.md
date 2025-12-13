# `flask-echo-server`

Python Flask ベースのエコーサーバーです。

## 使い方

- A) ホストマシンで使う
- B) Docker 上で使う

### A) ホストマシンで使う

パッケージをインストールします。

```zsh
poetry install
```

サーバーを起動します。

```zsh
poetry run flask --app echo run --port 8080
```

### B) Docker 上で使う

Docker イメージをビルドします。

```zsh
image_name=$(basename $(pwd))
docker build -t $image_name .
```

Docker コンテナを起動します。

```zsh
docker run --rm -it -p 5000:8080 $image_name
```

A) B) どちらの場合も `localhost:8080` でサーバーが待機します。
