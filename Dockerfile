FROM python:3.9-slim-buster
 
# WORKDIR /python-docker
WORKDIR /app
 
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
# RUN /usr/local/bin/python -m pip install --upgrade pip && \
#     pip3 install -e .
 
COPY . .
EXPOSE 443
CMD [ "gunicorn", "--certfile=cert.pem", "--keyfile=key.pem", "--bind", "0.0.0.0:443", "app:app"]
 
