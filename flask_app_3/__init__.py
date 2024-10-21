import os

from flask import Flask

from .config import config


def create_app(config_name: str = '') -> Flask:
    ''' create the app with mail extension '''
    if not config_name:
        config_name = os.environ.get('FLASK_CONFIG', 'development')

    # uncomment to print config
    # print(f'config_name: {config_name}')

    # instantiate the app
    app = Flask(__name__)

    # set config
    app.config.from_object(config[config_name])

    return app
