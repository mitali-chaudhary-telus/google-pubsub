from flask import Flask, request, jsonify
from .tasks import process_device_data, provision_vpn

app = Flask(__name__)

@app.route('/submit-device-task', methods=['POST'])
def submit_device_task():
    content = request.json
    task = process_device_data.delay(content['device_id'], content['payload'])
    return jsonify({"task_id": task.id}), 202

@app.route('/submit-vpn-task', methods=['POST'])
def submit_vpn_task():
    content = request.json
    task = provision_vpn.delay(content['user_id'])
    return jsonify({"task_id": task.id}), 202

@app.route('/task-status/<task_id>')
def task_status(task_id):
    from . import celery
    result = celery.AsyncResult(task_id)
    return jsonify({"task_id": task_id, "status": result.status, "result": str(result.result)})