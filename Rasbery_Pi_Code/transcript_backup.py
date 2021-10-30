import sys
import time
import requests

# Test file used to get the text from the speech
# Will change to be the file recorded from the phone
filename = "test/test_file2.mp3"

# Reads the 
def read_file(filename, chunk_size=524880):
    with open(filename, 'rb') as _file:
        while True:
            data = _file.read(chunk_size)
            if not data:
                break
            yield data
headers = {'authorization': "API_ID"}
response = requests.post('https://api.assemblyai.com/v2/upload',
                        headers=headers,
                        data=read_file(filename))

upload_response = response.json()
audio_str = upload_response['upload_url']

endpoint = "https://api.assemblyai.com/v2/transcript"
json_url = {"audio_url": audio_str}
headers2 = {
    'authorization': "API_ID",
    'content-type': 'application/json'
}

response2 = requests.post(endpoint, json=json_url, headers=headers2)
upload_response2 = response2.json()

endpoint += '/' + upload_response2['id']
response3 = requests.get(endpoint, headers=headers)

while(response3.json()['status'] != "completed"):
    response3 = requests.get(endpoint, headers=headers)
    
final_text = response3.json()['text']
print(final_text)