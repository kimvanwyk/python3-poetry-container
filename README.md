# python3-poetry
A Docker container to be used as a base for Python 3 [poetry](https://poetry.eustace.io) based projects.

# Usage

* Use this image as the **FROM** argument in a container.

* Copy all source files to */app/* in the container

* Ensure there is a *pyproject.toml* in the root directory - it will be copied into the directory and all contents **poetry install**ed into the container.

# Example Child Project

## Project Directory

```
- Dockerfile
- pyproject.toml
- app/
     - python_source.py
     - other_python_source.py
```

## Dockerfile

``` docker
FROM python3-poetry-container:latest

COPY app/* /app/

ENTRYPOINT ["python", "python_source.py"]

```

# Versions and Packages

A manifest file detailing the Python, pip, and Poetry versions and the installed Python packages is in a file inside the image at **/manifest.txt**.

# Update Schedule

This image is built and pushed to registries once a month, including the latest Python, pip and Poetry versions available at the time.

# Development

The source for this image is kept and developed in [this GitLab repository](https://gitlab.com/kimvanwyk/python3-poetry-container).

# Licensing

This image is licensed under the [BSD 3-Clause License](https://gitlab.com/kimvanwyk/python3-poetry-container/-/blob/d6104a25a33c7f3f584a09475ef1863a1224cf7c/LICENSE)

# Authors

* [Kim van Wyk](https://gitlab.com/kimvanwyk)
