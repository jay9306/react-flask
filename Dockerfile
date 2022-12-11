FROM python:3.6.5-alpine3.7
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN apk update RUN apk add nodejs
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm 
EXPOSE 5000
CMD bash -i /bin/run.sh
CMD [ "python", "./app.py" ]
