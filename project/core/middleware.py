# -*- coding: utf-8 -*-
import datetime
import json

from flask import request, make_response, session,render_template

from core.auth import auth
from service import service_select

def toQuery(str1):
    dt = {}
    arr = str1.split('&')
    for val in arr:
        ar = val.split('=')
        if len(ar) == 2:
            dt[ar[0]] = ar[1]
    return dt
def middleware_options():
    if request.method == "Origin" or request.method == "OPTIONS":
        resp = make_response()
        resp.status_code = 204
        return resp


def middleware_response(body):
    resp = make_response(body)
    resp.headers['Content-Type'] = "text/html; charset=utf-8"
    resp.headers['Access-Control-Allow-Origin'] = "*"
    # 允许你携带Content-Type请求头
    # 允许自定义前端可以添加请求头 token 字段
    resp.headers['Access-Control-Allow-Headers'] = "Content-Type,Accept,Authorization,x-auth-token"
    # 资格证书
    resp.headers["Access-Control-Allow-Credentials"] = "true"
    # 允许你发送DELETE,PUT
    resp.headers['Access-Control-Allow-Methods'] = "*"
    # 最大有效周期
    resp.headers["Access-Control-Max-Age"] = "86400"
    resp.status_code = 200
    return resp


def middleware_check_permissions():
    path = request.path
    if ("x-auth-token" in request.headers) and request.headers["x-auth-token"]:
        user = None
        token = request.headers["x-auth-token"]
        # 根据token获取缓存用户ID
        user_id = session.get("token", None)

        # 根据token获取数据库用户ID
        if not user_id:
            if token:
                obj = service_select("access_token").Get_obj(
                    {"token": token}
                )
                if obj:
                    user_id = obj["user_id"]
                    # 判断是否登录
        if user_id:
            create_time = datetime.datetime.strptime(obj["create_time"], "%Y-%m-%d %H:%M:%S")
            now_time = datetime.datetime.now()
            create_stamp = create_time + datetime.timedelta(minutes=60 * obj["maxage"])
            if create_stamp > now_time:
                session[token] = user_id
                user = service_select("user").Get_obj(
                    {"user_id": user_id}
                )

        if path.find("/api") == 0:
            pass
            # arr = path.split("/")
            # method = arr[-1]
            # model_auth = ""
            # path = "/" + arr[2] + "/"
            # if not (method.find("get_list") == -1 and method.find("export") == -1):
            #     model_auth = auth.Check(user, path + "list", "get")
            #     if not model_auth:
            #         model_auth = auth.Check(user, path + "table", "get")
            # elif not method.find("get_obj") == -1:
            #     model_auth = auth.Check(user, path + "view", "get")
            #     if not model_auth:
            #         model_auth = auth.Check(user, path + "details", "get")
            # elif not method.find("import") == -1:
            #     model_auth = auth.Check(user, path + "view", "get")
            # else:
            #     model_auth = auth.Check(user, path, "get")
            #
            # if model_auth:
            #     request.auth = model_auth
            #     pass
            #
            # else:
            #     error = {"error": {"code": 403, "message": "没有访问权限"}}
            #     return middleware_response(json.dumps(error, ensure_ascii=False))
        else:
            model_auth = auth.Check(user, path, "get")
            if model_auth:
                request.auth = model_auth
                pass
            else:

                return render_template("403.html", {}, status=403)
