FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY req.txt req.txt
RUN pip install -r req.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]