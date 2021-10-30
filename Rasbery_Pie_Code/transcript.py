import sys
import time
import requests

filename = "/test/test_file.m4a"

def read_file(filename, chunk_size=524880):
    with open(filename, 'rb') as _file:
        while True:
            data = _file.read(chunk_size)
            if not data:
                break
            yield data
headers = {'authorization': "13808d2b862943ab89e2fdc3bdbb4274"}
response = request.post('https://api.assemblyai.com/v2/upload',
                        headers=headers,
                         data=read_file(filename))