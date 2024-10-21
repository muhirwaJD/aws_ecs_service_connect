import os
from pathlib import Path


class BaseConfig:
    ''' Base Config '''
    BASE_DIR = Path(__file__).parent.parent

    TESTING = False


class DevelopmentConfig(BaseConfig):
    ''' Development Config '''
    DEBUG = True


class ProductionConfig(BaseConfig):
    ''' Production Config - can send emails '''
    DEBUG = False


config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
}
