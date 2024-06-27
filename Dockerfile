FROM public.ecr.aws/lambda/python:3.12
WORKDIR /app
COPY ./requirements.txt /app/
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
ENTRYPOINT [ "fastapi" ]
CMD [ "dev", "--host", "0.0.0.0" ]