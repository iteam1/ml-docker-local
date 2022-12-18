FROM jupyter/scipy-notebook
WORKDIR /app
RUN pip install joblib
COPY . /app
RUN bash
