import json
import sys
import time
import requests

filename = "test/test_file.mp3"

def read_file(filename, chunk_size=524880):
    with open(filename, 'rb') as _file:
        while True:
            data = _file.read(chunk_size)
            if not data:
                break
            yield data
headers = {'authorization': "13808d2b862943ab89e2fdc3bdbb4274"}
response = requests.post('https://api.assemblyai.com/v2/upload',
                        headers=headers,
                        data=read_file(filename))

upload_response = response.json()
# audio_str = upload_response[16:-2]
audio_str = upload_response['upload_url']

endpoint = "https://api.assemblyai.com/v2/transcript"

json_url = {"audio_url": audio_str}

headers2 = {
    'authorization': "13808d2b862943ab89e2fdc3bdbb4274",
    'content-type': 'application/json'
}

response2 = requests.post(endpoint, json=json_url, headers=headers2)

upload_response2 = response2.json()

endpoint += '/' + upload_response2['id']
# print(endpoint)

response3 = requests.get(endpoint, headers=headers)

# print(response3.json())

while(response3.json()['status'] != "completed"):
    response3 = requests.get(endpoint, headers=headers)
    
final_text = response3.json()['text']
print(final_text)