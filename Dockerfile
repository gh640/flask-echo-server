FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONUTF8=1 \
  PYTHONIOENCODING="UTF-8" \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on

WORKDIR /tmp

RUN python -m pip install -U pip uv

WORKDIR /app

COPY ./pyproject.toml ./uv.lock ./
RUN uv sync --frozen

COPY ./echo.py ./

CMD ["uv", "run", "flask", "--app", "echo", "--debug", "run", "--host=0.0.0.0", "--port", "8080"]
