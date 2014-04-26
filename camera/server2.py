from geventwebsocket.handler import WebSocketHandler
from gevent.pywsgi import WSGIServer
from flask import Flask, request
from time import sleep
from cStringIO import StringIO

import pygame
pygame.init()

import SimpleCV as scv

app = Flask(__name__)
cam = scv.Camera(2)


@app.route('/camera2')
def camera():

    if request.environ.get('wsgi.websocket'):
        ws = request.environ['wsgi.websocket']

        while True:
            fp = StringIO()
            image = cam.getImage().flipHorizontal().getPIL()
            image.save(fp, 'JPEG')
            ws.send(fp.getvalue().encode("base64"))
            #fp.close() << benchmark and memory tests needed
            sleep(0.05)


if __name__ == '__main__':
    #put ROGR's ip address here
    http_server = WSGIServer(("10.201.24.53",5002), app, handler_class=WebSocketHandler)
    http_server.serve_forever()
