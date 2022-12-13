# ml-docker-full-service
build docker container ml-model for EEG data, include training and prediction

The idea is to do a quick and easy build of a Docker container with a simple machine learning model and run it. In order to start building a Docker container for a machine learning model, let’s consider three files:
-	Dockerfile
-	train.py
-	inference.py

The train.py is  a python script that ingest and normalize EEG data in a csv file (train.csv) and train two models to classify the data (using scikit-learn). The script saves two models: Linear Discriminant Analysis (clf_lda) and Neural Networks multi-layer perceptron (clf_NN).

The inference.py will be called to perform batch inference by loading the two models that has been previously created. The application will normalize new EEG data coming from a csv file (test.csv), perform inference on the dataset and print the classification accuracy and predictions.

# packages

# build docker image

    FROM jupyter/scipy-notebook

    RUN mkdir my-model
    ENV MODEL_DIR=/home/jovyan/my-model
    ENV MODEL_FILE_LDA=clf_lda.joblib
    ENV MODEL_FILE_NN=clf_nn.joblib

    RUN pip install joblib

    COPY train.csv ./train.csv
    COPY test.csv ./test.csv

    COPY train.py ./train.py
    COPY inference.py ./inference.py

    RUN python3 train.py

# deploy docker

build docker image `$ sudo docker build -t <image_tag> -f <Dockerfile> .`

run docker image `$ sudo docker run <image_tag>`

run docker image with special command `$ sudo docker run <image_tag> python3 inference.py`

# references

[source](https://github.com/xaviervasques/EEG-letters)
