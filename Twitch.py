#!/usr/bin/env python
# coding: utf-8

# In[3]:


import urllib.request
import requests
import json

CLIENT_ID     = "to8ow3xtzqkxp60zfhlhgvysnkpyok"
CLIENT_SECRET = "parnseb575pbwbg0bw16ci0pdezjvt"

def make_request(URL):
    header    = {"Client-ID": CLIENT_ID, "Authorization": f"Bearer {get_access_token()}" }

    req  = urllib.request.Request(URL, headers=header)
    recv = urllib.request.urlopen(req)
    
    return json.loads(recv.read().decode("utf-8"))

def get_access_token():
    x = requests.post(f"https://id.twitch.tv/oauth2/token?client_id={CLIENT_ID}&client_secret={CLIENT_SECRET}&grant_type=client_credentials")

    return json.loads(x.text)["access_token"]

    
def get_current_online_streams():
    streamer  = [
        "h0llylp", 
        "lookslikelinklive", 
        "Quis_der_Barde",
        "nilaus", 
        "linkus7", 
        "gymnast86", 
        "javidx9", 
        "marmeladenoma",
        "hashinshin",
        "lessqqll",
        "Jukeyz"
    ]

    URL            = "https://api.twitch.tv/helix/streams?user_login="
    resps          = []
    online_streams = []

    for name in streamer:
        resps.append(make_request(URL + name))

    GAME_URL = "https://api.twitch.tv/helix/games?id="
    for i, r in enumerate(resps, 0):
        if r["data"]:
            game_id   = r["data"][0]["game_id"]
            game_resp = make_request(GAME_URL + game_id) 
            game_name = game_resp["data"][0]["name"]
            online_streams.append((streamer[i], game_name))
    
    return online_streams

def main():
    print(get_current_online_streams())



if __name__ == "__main__":
    main()


# In[ ]:




