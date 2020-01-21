FROM ubuntu
RUN apt-get update && apt-get install -y python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install flask==1.1.1

COPY app.py /opt/app.py
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0

