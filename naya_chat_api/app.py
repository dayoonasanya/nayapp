from flask import Flask
from chat_controller import chat_api

app = Flask(__name__)
app.register_blueprint(chat_api)

@app.route('/')
def index():
    return 'NayaChat API is running.'

if __name__ == '__main__':
    app.run(debug=True)

