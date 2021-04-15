import re
import requests

BASE_URL = r'http://apabi.lib.pku.edu.cn/OnLineReader/command/imagepage.ashx?objID=isbn7-301-05397-5/21101003103.ft.cebx.1&metaId=ISBN7-301-05397-5/21101003103&OrgId=pku&Ip=undefined&scale=1&width=1920&height=2757&pageid=1&ServiceType=Imagepage&scaleType=1&OrWidth=1920&OrHeight=2757testres=&debug=&SessionId=43996F3B4D7E7F8C&UserName=%E6%9D%A5%E8%87%AA%2010.0.26.71%20%E7%9A%84%E7%94%A8%E6%88%B7&cult=CN&rights=1-0_00&time=2021-03-22 02:59:00&sign=6555F2913729DA00D845F28C00F03DD4';
PATTERN = re.compile(r'(?<=&pageid=)\d+(?=&)');

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