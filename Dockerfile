FROM python:3.10-slim-buster

RUN mkdir /home/data-viz

WORKDIR /home/data-viz

COPY requirements.txt .

RUN pip install -r requirements.txt