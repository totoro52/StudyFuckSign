# -*- coding: utf8 -*-
import os,requests,json


def main():
    url = "http://地址/api/getSignItem"
    postData = {
        'api_key': '通讯密钥'
    }
    webData = requests.post(url,postData)
    webData = json.loads(webData.text)
    if webData['code'] == 1:
        for data in webData['data']:
            uuid = data['uuid']
            cookie = data['cookie']
            #批量启动  这里部署的时候请修改下脚本的绝对路径
            os.system('python /root/study/study.py -c "' + cookie + '" -u "' + str(uuid) + '" >>/root/study/log/'+ str(uuid) +'.log &')
    print('任务全部启动完毕')


if __name__ == '__main__':
    main()
