FROM python:3-buster

RUN pip install --upgrade pip

## Do an apt upgrade here for security

RUN pip install poetry

RUN poetry config virtualenvs.create false

RUN mkdir /app

WORKDIR /app

RUN echo "Tag:" >> /manifest.txt; echo $(date +%y%m%d)-python$(python --version | cut -d " " -f2)-pip$(pip --version | cut -d " " -f2)-poetry$(poetry --version | cut -d " " -f3  | cut -d ")" -f1) >> /manifest.txt; echo "\nVersions:" >> /manifest.txt; echo $(python --version) >> /manifest.txt; echo $(pip --version) >> /manifest.txt; echo $(poetry --version) >> /manifest.txt; echo "\nPackages:" >> /manifest.txt; echo $(pip freeze) >> /manifest.txt; 
# Install Pipfile contents system-wide
ONBUILD COPY pyproject.toml pyproject.toml
ONBUILD RUN poetry install --only main --no-root
ONBUILD RUN poetry -n cache clear pypi --all || true
ONBUILD RUN poetry -n cache clear . --all || true
ONBUILD RUN rm pyproject.toml && rm poetry.lock
