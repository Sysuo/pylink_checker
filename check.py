import requests
from pprint import pprint

def readFile(file_name):
	data = ''
	try:
		file = open(file_name)
		data = file.readlines()
		print(data)
	except Exception as e:
		print("[Error](", readFile.__name__, ")", e)
	finally:
		if 'file' in locals():
			file.close()
	return data

def check(url):
	if url == "":
		return;
	print("[Checking...]", url)
	try:
		r = requests.get(url)
		if r.status_code != 200:
		  print("[Access Error][URL]", url, " [response code]", r.status_code)
	except Exception as e:
		print("[Error]", e)


# 読込むファイルのパス
file_name = "./links.txt"

list = readFile(file_name)

# for debug
#pprint(list)

for url in list:
	url = url.replace("\n", "")
	url = url.replace("\r", "")
	# コメント行は飛ばす
	if url.startswith('//') || url.startswith('#')':
		continue
	check(url)
