# Python + FastAPI + aws-lambda-web-adapter
This project is lambda function in Python.

## Getting started local
```
docker compose up --build
http://localhost:8080
```

## Build image
```
docker build --target prod -t python-lambda . --platform linux/amd64
```

`--platform linux/amd64` option is for Mac with Apple sillicon.

## Push ECR
```
docker tag python-lambda:latest xxxxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/python-lambda:latest
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin xxxxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com
docker push xxxxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/python-lambda:latest
```