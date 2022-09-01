FROM python:3-stretch

RUN pip install --upgrade pip

RUN pip install poetry

RUN poetry config virtualenvs.create false

RUN mkdir /app

WORKDIR /app

RUN echo "Tag:" >> /manifest.txt; echo $(date +%y%m%d)-python$(python --version | cut -d " " -f2)-pip$(pip --version | cut -d " " -f2)-poetry$(poetry --version | cut -d " " -f3  | cut -d ")" -f1) >> /manifest.txt; echo "\nVersions:" >> /manifest.txt; echo $(python --version) >> /manifest.txt; echo $(pip --version) >> /manifest.txt; echo $(poetry --version) >> /manifest.txt; echo "\nPackages:" >> /manifest.txt; echo $(pip freeze) >> /manifest.txt; 
# Install Pipfile contents system-wide
ONBUILD COPY pyproject.toml pyproject.toml
ONBUILD RUN poetry install --no-dev && poetry cache clear --all -n pypi && poetry cache clear --all -n . && rm pyproject.toml && rm poetry.lock
