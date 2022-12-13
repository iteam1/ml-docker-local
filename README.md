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

    FROM ubuntu:latest
    WORKDIR /app
    RUN apt-get update -y
    RUN apt-get install -y python3-pip python3-dev build-essential hdf5-tools libgl1 libgtk2.0-dev
    COPY . /app
    RUN pip3 install -r setup.txt
    EXPOSE 8080
    CMD ["python3", "my_api.py"]

# deploy docker

# references

[source](https://github.com/xaviervasques/EEG-letters)
