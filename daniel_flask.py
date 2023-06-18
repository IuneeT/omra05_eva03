from flask import Flask
from flask import request

sample = Flask(__name__)

@sample .route ("/")
def main():
	return "me estas llamando desde " + request.remote_addr + "\ n Daniel ortiz"

if __name__ == "__main__":
	sample.run (host="0.0.0.0", port=8000)

print ("Daniel Ortiz")


