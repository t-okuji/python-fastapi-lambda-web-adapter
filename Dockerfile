# Development
FROM public.ecr.aws/lambda/python:3.12 AS dev
WORKDIR /app
COPY ./requirements.txt /app/
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
ENTRYPOINT [ "fastapi" ]
CMD [ "dev", "main.py", "--host", "0.0.0.0" ]

# Production for lambda
FROM public.ecr.aws/lambda/python:3.12 AS prod
# change lambda-web-adapter listen port (default port 8080)
ENV PORT 8000
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.8.3 /lambda-adapter /opt/extensions/lambda-adapter
WORKDIR /app
COPY ./requirements.txt /app/
COPY ./app/. /app/
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

ENTRYPOINT [ "fastapi" ]
CMD [ "run", "main.py" ]