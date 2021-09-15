import re
import requests

BASE_URL = r'http://162.105.138.126/OnLineReader/command/imagepage.ashx?objID=obj201311277qul6pld3rihackc0000054767&metaId=u.meta20131101utk07qul6pld0000056185&OrgId=apabi_usp&Ip=undefined&scale=4.182993668076062&width=3562&height=4537&pageid=1&ServiceType=Imagepage&scaleType=1&OrWidth=612.480009126663&OrHeight=845.760012602806&testres=&debug=&SessionId=4B90CECAC476BD93&UserName=%E5%90%91%E4%B8%80%E5%B8%86&cult=CN&rights=1-0_00&time=2021-09-15%2013:39:08&sign=18F5BF20F7B9C0665E9C5DF7E287C9D2';
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