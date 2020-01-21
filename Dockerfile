FROM ubuntu
RUN apt-get update
RUN apt-get install -y python=2.7.17 python-pip=9.0.1
RUN pip install flask=1.1.1

COPY app.py /opt/app.py
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
