import re
import requests

BASE_URL = r'http://162.105.138.126/OnLineReader/command/imagepage.ashx?objID=obj20110624it2tm52zdo3moyai0000084376&metaId=meta20110301it2tm52z0000086759&OrgId=apabi_usp&Ip=undefined&scale=1&width=1080&height=1576&pageid=1&ServiceType=Imagepage&scaleType=1&OrWidth=1459.20002174377&OrHeight=2133.33319714347&testres=&debug=&SessionId=9B4FF1F41C02265F&UserName=%E5%90%91%E4%B8%80%E5%B8%86&cult=CN&rights=1-0_00&time=2021-03-18 09:20:48&sign=47592CEEE7FCC3AFA1179FA9CD840224';
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