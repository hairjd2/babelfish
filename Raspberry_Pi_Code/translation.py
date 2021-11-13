from deep_translator import MyMemoryTranslator
import sys
import time
import requests

def read_file(filename, chunk_size=524880):
    # Reads the file to send to the servers (don't really understand it)
    with open(filename, 'rb') as _file:
        while True:
            data = _file.read(chunk_size)
            if not data:
                break
            yield data

def transcript(filename):
# Beginning request
# Posts audio file stored locally to generate transcript
    headers = {'authorization': "API_ID"}
    response = requests.post('https://api.assemblyai.com/v2/upload',
                            headers=headers,
                            data=read_file(filename))

    upload_response = response.json()
    audio_str = upload_response['upload_url']

# Initial request for the transcript
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
# While loop that runs until the status returned is set to complete
# Once it is complete, it returns the value from the key 'text'
    while(response3.json()['status'] != "completed"):
        response3 = requests.get(endpoint, headers=headers)
        
    final_text = response3.json()['text']
    return final_text

def translation(text):
# Runs the all supported languages and translates the inputted text
    # langs_list = MyMemoryTranslator.get_supported_languages(as_dict=True)
    # for key, value in langs_list.items():
    #     if(value != 'en'):
    #         print(key)

    translated = MyMemoryTranslator(source='english', target='chinese').translate(text=text)
    print("Chinese: " + translated)

if __name__ == "__main__":
    final_text = transcript("test/test_file3.mp3")
    print(final_text)
    translation(final_text)
