from flask import Flask
import time

app = Flask(__name__)

@app.route("/")
def getCurrentTime():
    currentTime = time.strptime("%Y-%m-%d %H:%M:%S", time.localtime())
    return f"The current time {currentTime}"

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=9001)