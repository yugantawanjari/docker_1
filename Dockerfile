FROM python:3.9-slim-buster
 
# WORKDIR /python-docker
WORKDIR /app
 
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
# RUN /usr/local/bin/python -m pip install --upgrade pip && \
#     pip3 install -e .
 
COPY . .
EXPOSE 443
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0","--port=443"]
