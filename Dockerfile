FROM python:3.14-slim

WORKDIR /app

COPY app.py .

RUN pip install flask

EXPOSE 9001

CMD ["python", "app.py"]
