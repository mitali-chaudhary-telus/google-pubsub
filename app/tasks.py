from . import celery
import time

@celery.task
def process_device_data(device_id, payload):
    print(f"Processing data for device {device_id}: {payload}")
    time.sleep(3)
    return {"device_id": device_id, "status": "processed", "payload": payload}

@celery.task
def provision_vpn(user_id):
    print(f"Provisioning VPN for user {user_id}")
    time.sleep(5)
    return {"user_id": user_id, "vpn_status": "provisioned"}