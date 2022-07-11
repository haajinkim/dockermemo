FROM python:3.9-slim AS builder

ADD requirements.txt requirements.txt

RUN pip install -r requirements.txt

FROM python:3.9-slim-buster
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

ADD templates templates

ADD app.py .

CMD ["python", "app.py"]

