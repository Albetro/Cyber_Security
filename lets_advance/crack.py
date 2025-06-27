import hashlib
import sys
from itertools import product
import string

target = sys.argv[1]
charset = string.ascii_lowercase + string.digits

for length in range(1, 5):  # Adjust range for difficulty
    for guess in product(charset, repeat=length):
        attempt = ''.join(guess)
        if hashlib.md5(attempt.encode()).hexdigest() == target:
            print(f"[+] Match found: {attempt}")
            exit()
print("[-] No match found.")
