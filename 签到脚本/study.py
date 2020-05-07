# -*- coding: utf8 -*-
import sys, requests, json, datetime, time, threading, Queue,base64
from optparse import OptionParser

class Sign:
    cookie = ""  # 用户Cookie
    userUid = ""  # 用户唯一UID
    headers = {
        'User-Agent': 'Mozilla/5.0 (iPad; CPU OS 13_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 ChaoXingStudy/ChaoXingStudy_3_4.3.2_ios_phone_201911291130_27'
    }

    def __init__(self, userUid, cookie):
        self.cookie = cookie
        self.userUid = userUid
        self.headers.update({'cookie': cookie})

    def getCourseItem(self):
        courseList = []
        url = "http://mooc1-api.chaoxing.com/mycourse/backclazzdata?view=json"
        webData = requests.get(url, headers=self.headers)
        # print(webData.text)
        jsonData = json.loads(webData.text)
        if jsonData['result'] == 1:
            for item in jsonData['channelList']:
                courseName = item['content']['course']['data'][0]['name']
                courseId = item['content']['course']['data'][0]['id']
                classId = item['content']['id']
                # 追加数组
                courseList.append({'courseName': courseName, 'courseId': courseId, 'classId': classId})
            return courseList
        else:
            return False

    def getCourseActItem(self, classId, courseId):
        #  获取每一个课程的所有未完成签到活动
        actList = []
        classId = str(classId)
        uid = str(self.userUid)
        courseId = str(courseId)
        url = "https://mobilelearn.chaoxing.com/ppt/activeAPI/taskactivelist?courseId=" + courseId + "&classId=" + classId + "&uid=" + uid + ""
        webData = requests.get(url, headers=self.headers)
        jsonData = json.loads(webData.text)
        for item in jsonData['activeList']:
            if item['status'] == 1 and item['activeType'] == 2:
                actId = item['id']
                activeType = item['activeType']
                nameOne = item['nameOne']
                status = item['status']
                actList.append({'actId': actId, 'activeType': activeType, 'name': nameOne, 'status': status})
        return actList

    def doSign(self, actId):
        url = "https://mobilelearn.chaoxing.com/pptSign/stuSignajax?activeId=" + actId + "&uid=" + self.userUid + "&clientip=&latitude=-1&longitude=-1&appType=15&fid=0"
        webData = requests.get(url, headers=self.headers)
        if webData.text == 'success':
            return True
        else:
            return False


def goSign(classId, courseId, sign):
    actItem = []
    sucNum = 0
    errNum = 0
    ActList = sign.getCourseActItem(classId, courseId)
    for act in ActList:
        actItem.append({'actId': act['actId'], 'name': act['name']})
    for item1 in actItem:
        signMsg = sign.doSign(str(item1['actId']))
        if signMsg:
            sucNum = sucNum + 1
        else:
            errNum = errNum + 1
    scuSign.append({'courseId':courseId,'sucNum':sucNum,'errNum':errNum})


def main():
    global scuSign
    scuSign = []
    uuid = ''
    cookie = ''
    parser = OptionParser('python study.py -u <UUID from User> [-c <cookie Form User>]')
    parser.add_option('-u', '--uuid', dest='uuid', type='string', help='UUID from User')
    parser.add_option('-c', '--cookie', dest='cookie', type='string', help='cookie Form User')
    (options, args) = parser.parse_args()
    if options.uuid:
        uuid = options.uuid
        cookie = base64.b64decode(options.cookie)
    else:
        parser.print_help()
        sys.exit(1)
    print("----------STARTID:"+uuid+"----------")
    sign = Sign(uuid,cookie)
    start = datetime.datetime.now()
    courseItem = sign.getCourseItem()
    queue = Queue.Queue()
    threads = []
    if not courseItem:
        print("data error")
        return
    for item in courseItem:
        courseId = item['courseId']
        classId = item['classId']
        queue.put({'courseId': courseId, 'classId': classId})
    while not queue.empty():
        signData = queue.get()
        t = threading.Thread(target=goSign, args=(signData['classId'], signData['courseId'], sign))
        threads.append(t)
    for t in threads:
        t.start()
    end = datetime.datetime.now()
    execTime = end - start
    for t in threads:
        t.join()
    # 等待线程执行完毕才能往下走
    for data in scuSign:
        print("courId:" + str(data['courseId']) + " success:" + str(data['sucNum']) + " error:" + str(data['errNum']))
    print("execTime:" + str(execTime))
    print("---------------------")

if __name__ == '__main__':
    main()
