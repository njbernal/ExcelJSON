FROM python:3.10-slim
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
RUN pip install pipenv
RUN pipenv install --deploy --system
CMD exec gunicorn --bind :$PORT --workers 1 --worker-class uvicorn.workers.UvicornWorker  --threads 8 server.main:server