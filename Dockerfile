# https://github.com/orgs/python-poetry/discussions/1879#discussioncomment-216865


FROM python:3.12-slim


ENV PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    # poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    # POETRY_VERSION=1.0.3 \
    # make poetry install to this location
    POETRY_HOME="/opt/poetry" \
    # make poetry create the virtual environment in the project's root
    # it gets named `.venv`
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    # do not ask any interactive question
    POETRY_NO_INTERACTION=1


ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"


RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        # deps for installing poetry
        curl \
        # deps for building python deps
        build-essential


# install poetry
RUN curl -sSL https://install.python-poetry.org | python -

WORKDIR /app
COPY poetry.lock pyproject.toml ./

RUN poetry install

COPY . .
