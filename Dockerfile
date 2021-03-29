FROM python:3-stretch

RUN pip install poetry

RUN poetry config virtualenvs.create false

RUN mkdir /app

WORKDIR /app

# Install Pipfile contents system-wide
ONBUILD COPY pyproject.toml pyproject.toml
ONBUILD RUN poetry install --no-dev && poetry cache clear --all -n pypi && poetry cache clear --all -n . && rm pyproject.toml && rm poetry.lock
