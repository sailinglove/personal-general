import re
import requests

BASE_URL = r'	http://cebxol.apabiedu.com/api/getservice?orgid=pku&ObjId=ISBN7-81092-014-6.ft.CEBX.1&UserName=%E6%9D%A5%E8%87%AA%2B%E5%8C%97%E4%BA%AC%E5%A4%A7%E5%AD%A6%E5%9B%BE%E4%B9%A6%E9%A6%86%2B%E7%9A%84%E7%94%A8%E6%88%B7&MetaId=ISBN7-81092-014-6&cult=CN&dbsource=dlib&Time=2021/11/25 5:00:06&Sign=01D8BAB39F15A83362FB7831B48CEB66&Rights=1-0_00&width=2562&height=3537&page=1&ServiceType=imagepage';
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