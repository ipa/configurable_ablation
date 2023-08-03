FROM python:3.11-slim-bullseye	

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y git 

RUN apt-get install -y libcairo2-dev

ADD requirements.txt .
RUN pip install -r requirements.txt

RUN useradd -ms /bin/bash -p "user" user
USER user

WORKDIR /home/user/src
RUN mkdir -p /home/user/src
CMD /bin/bash

