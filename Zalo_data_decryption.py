#!/usr/bin/env python3
rom hashlib import md5
from base64 import b64decode
from base64 import b64encode
import binascii
from Crypto.Cipher import AES
import sys

def decrypt(secretkey, ciphertext):
    key = binascii.a2b_base64(secretkey)
    raw = b64decode(ciphertext)
    plaintext = AES.new(key, AES.MODE_CBC, raw[:AES.block_size])
    return plaintext.decrypt(raw[AES.block_size:])

if __name__=="__main__":
  zpw_enk = "Enter your secret key"
  if (len(sys.argv) >= 1):
      cipher_text = sys.argv[1]
  else:
      cipher_text = input("Enter data: ")
  print("\nMessage= ", decrypt(zpw_enk, cipher_text).decode('utf-8'))
