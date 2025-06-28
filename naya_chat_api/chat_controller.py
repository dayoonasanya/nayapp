from flask import Blueprint, request, jsonify
from pymongo import MongoClient
from datetime import datetime
import os
from dotenv import load_dotenv

load_dotenv()
mongo_uri = os.getenv("MONGODB_URI")
client = MongoClient(mongo_uri)
db = client.get_default_database()
chat_logs = db.chat_logs

chat_api = Blueprint('chat_api', __name__)

@chat_api.route('/api/save-chat', methods=['POST'])
def save_chat():
    try:
        data = request.json
        data['timestamp'] = datetime.utcnow()
        chat_logs.insert_one(data)
        return jsonify({"status": "saved"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
