FROM python:3.9-slim

WORKDIR /stocks
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
COPY app.py ./
RUN chmod 777 ./app.py

ENV HOST="0.0.0.0"
ENV PORT="8000"
ENV FLASK_ENV="production"

ENTRYPOINT /usr/local/bin/gunicorn -b ${HOST}:${PORT} --preload app:app
