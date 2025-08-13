import os
from celery import Celery
from dotenv import load_dotenv

load_dotenv()

def make_celery():
    celery = Celery(
        'celery-pubsub-demo',
        broker=os.getenv('CELERY_BROKER_URL'),
    )
    celery.conf.update(
        broker_transport_options={
            'project_id': os.getenv('GOOGLE_CLOUD_PROJECT'),
            'topic': os.getenv('PUBSUB_TOPIC'),
        }
    )
    return celery

celery = make_celery()