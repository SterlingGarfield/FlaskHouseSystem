from flask import render_template, request
from core.middleware import middleware_response
from werkzeug.wrappers import Response
import json


# urlquery转为字典
def toQuery(str1):
    dt = {}
    arr = str1.split('&')
    for val in arr:
        ar = val.split('=')
        if len(ar) == 2:
            dt[ar[0]] = ar[1]
    return dt


class CTX:
    def __init__(self):
        self.query = request.values.to_dict()
        self.cookies = request.cookies
        self.request = request
        self.auth = ""
        self.status = 200
        headers = request.headers
        if ("Content-Type" in headers) and headers["Content-Type"]:
            if request.method == 'GET':
                self.body = {}
                print("get请求")
                print(request.values)
            else:
                if headers["Content-Type"] == "application/json":
                    self.body = request.json
                elif headers["Content-Type"] == "application/x-www-form-urlencoded":

                    self.body = request.form.to_dict()
                elif headers["Content-Type"] == "text/plain":
                    self.body = {}
                elif headers["Content-Type"] == 'multipart/form-data':
                    pass
                else:
                    self.body = request.get_data()

    def render(self, view, model):
        return render_template(view, model)


# #####加载路由
# 加载路由函数中使用，返回action(ctx)，actionFunc(ctx)是加载路由器urlpatterns时的某部分内容
# 判断是为了在不符合请求方法时候返回404
# actionFunc函数在传入router后得到了ctx参数
def router(method, actionFunc):
    def get():
        if request.method == "GET":
            ctx = CTX()
            body = actionFunc(ctx)
            if body and isinstance(body, Response) == False:
                if isinstance(body, dict):
                    body = json.dumps(body, ensure_ascii=False)
                    return middleware_response(body)
                else:
                    return middleware_response(body)
            else:
                return body

    def post():
        if request.method == "POST":
            ctx = CTX()
            body = actionFunc(ctx)
            if body and isinstance(body, Response) == False:
                if isinstance(body, dict):
                    body = json.dumps(body, ensure_ascii=False)
                    return middleware_response(body)
                else:
                    return middleware_response(body)
            else:
                return body

    def all_fun():
        ctx = CTX()
        body = actionFunc(ctx)
        # 判断是否为Response对象
        if body and isinstance(body, Response) == False:
            if isinstance(body, dict):
                body = json.dumps(body, ensure_ascii=False)
                return middleware_response(body)
            else:
                return middleware_response(body)
        else:
            return body

    if method == "get":
        return get
    elif method == "post":
        return post
    else:
        return all_fun
