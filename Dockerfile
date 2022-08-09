FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONUTF8=1 \
  PYTHONIOENCODING="UTF-8" \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=false \
  PATH="/root/.local/bin:${PATH}"

WORKDIR /tmp

RUN python -m pip install -U pip

ARG POETRY_VERSION="1.1.14"
# 公式の https://install.python-poetry.org は invalid not-modified ETag エラーで
# アクセスできないことがあるためこちらの URL を使う
ARG POETRY_URL="https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py"

ADD "${POETRY_URL}" ./install-poetry.py
RUN python /tmp/install-poetry.py --version "${POETRY_VERSION}"

WORKDIR /app

COPY ./pyproject.toml ./
RUN poetry install --no-root

COPY ./echo.py ./

CMD ["flask", "--app", "echo", "--debug", "run", "--host=0.0.0.0"]
