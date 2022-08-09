from flask import Flask, request

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST', 'PATCH', 'DELETE', 'OPTIONS'])
def index():
    print(f'{request.remote_addr=}')
    print(f'{request.host=}')
    print(f'{request.host_url=}')
    print(f'{request.user_agent.string=}')
    print(f'{request.method=}')
    print(f'{request.headers=}')
    print(f'{request.args=}')
    print(f'{request.data=}')
    return request.data or 'nothing received.'
