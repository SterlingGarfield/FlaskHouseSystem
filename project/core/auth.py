# -*- coding: utf-8 -*-
import datetime
import json
from service import service_select

dict_auth = {}


class Auth:
    def Check(self, user, path, method="get"):
        auth = self.Get_dict()
        model_auth = {
            "auth_id": 0,
            "user_group": "访客",
            "mod_name": "",
            "table_name": "",
            "page_title": "",
            "path": "",
            "add": 0,
            "del": 0,
            "set": 0,
            "get": 1,
            "field_add": "",
            "field_set": "",
            "field_get": "",
            "table_nav_name": "",
            "table_nav": 0,
            "option": {
                "examine": False,
                "can_show_comment": False,
                "can_comment": False,
                "can_show_score": False,
                "can_score": False,
            },
        }
        user_group = "游客"
        if user:
            user_group = user["user_group"]

        if (path in auth) and auth[path] and (user_group in auth[path]) and auth[path][user_group]:
            model_auth = auth[path][user_group]
        else:
            if user_group == "管理员":
                model_auth = {
                    "auth_id": 0,
                    "user_group": "管理员",
                    "mod_name": "",
                    "table_name": "",
                    "page_title": "",
                    "path": "",
                    "add": 1,
                    "del": 1,
                    "set": 1,
                    "get": 1,
                    "field_add": "",
                    "field_set": "",
                    "field_get": "",
                    "table_nav_name": "",
                    "table_nav": 1,
                    "option": {
                        "examine": True,
                        "can_show_comment": True,
                        "can_comment": True,
                        "can_show_score": True,
                        "can_score": True,
                    },
                }
        if model_auth[method]:
            return model_auth
        return ""

    def Get_dict(self):
        if len(dict_auth.keys()) == 0:
            service = service_select("auth")
            lst = service.Get_list({}, {"page": 0})
            for o in lst:
                if "option" in o and o["option"]:
                    o["option"] = json.loads(o["option"])
                else:
                    o["option"] = {}
                path = o["path"]
                if path not in dict_auth:
                    dict_auth[path] = {}
                dict_auth[path][o["user_group"]] = o
        return dict_auth


auth = Auth()
