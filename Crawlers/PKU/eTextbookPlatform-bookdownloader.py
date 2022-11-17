import re
import requests

BASE_URL = r'http://img.sslibrary.com/n/slib/book/slib/10508288/41715841ddda4eaea640ed73b5a33c56/ad08ab8575f1b46bbcf3c2347a30c8e8.shtml?dxbaoku=false&moocbaoku=false&deptid=487&fav=https%3A%2F%2Fwww.sslibrary.com%2Freader%2Fpdg%2Fpdgreader%3Fd%3D6c75aac2ced3f85220ed779fdcbe35da%26ssid%3D10508288&fenlei=0311050203&spage=1&t=5&username=115.27.202.60&view=-1';
PATTERN = re.compile(r'(?<=&page=)\d+(?=&)');

i = 1;
while True:
    r = requests.get(PATTERN.sub(str(i), BASE_URL));
    if r.ok and len(r.content) > 0:
        with open("%03d.png" % i, "wb") as f:
            f.write(r.content);
        print(i);
        i += 1;
    else:
        break;