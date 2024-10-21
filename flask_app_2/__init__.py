import os

from flask import Flask

from .config import config


def create_app(config_name: str = '') -> Flask:
    ''' create the app with mail extension '''
    if not config_name:
        config_name = os.environ.get('FLASK_CONFIG', 'development')

    app = Flask(__name__)
    app.config.from_object(config[config_name])

    return app
