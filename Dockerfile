FROM python:3.12.0a3-bullseye
#RUN apk add build-base=0.5-r2 python3-dev=3.8.10-r0 postgresql-dev=12.8-r0 --no-cache
#RUN apk add python3-dev postgresql-dev --no-cache

WORKDIR /app
COPY requirements.txt .

# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app/src
COPY src .

ARG COMMIT=local
ENV COMMIT=${COMMIT}

#EXPOSE 8000

#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
CMD ["python", "./main.py"]