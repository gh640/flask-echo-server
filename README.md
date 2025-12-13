# `flask-echo-server`

Python Flask ベースのエコーサーバーです。

## 動作要件

- Python 3.14
- uv `0.9.x`

## 使い方

- A) ホストマシンで使う
- B) Docker 上で使う

### A) ホストマシンで使う

パッケージをインストールします。

```zsh
uv sync
```

サーバーを起動します。

```zsh
uv run flask --app echo run --port 8080
```

### B) Docker 上で使う

Docker イメージをビルドします。

```zsh
image_name=$(basename $(pwd))
docker build -t $image_name --build-arg PYTHON_VERSION=3.14 .
```

Docker コンテナを起動します。

```zsh
docker run --rm -it -p 8080:8080 $image_name
```

A) B) どちらの場合も `localhost:8080` でサーバーが待機します。
