from datetime import datetime

from . import create_app

flask_app = create_app()


@flask_app.route('/')
def hello() -> str:
    ''' Return a friendly HTTP greeting '''
    return f'Hello, World from flask app 2! Time is {datetime.now()}'


@flask_app.route('/return_message')
def get_message() -> str:
    ''' endpoint to test AWS ECS Service Connect functionality '''
    return 'here is a message from flask_app_2 (with a little mod)!'

# if __name__ == '__main__':
#     flask_app.run(host='0.0.0.0')
