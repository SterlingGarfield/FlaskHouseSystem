from core import controller
from flask import make_response
controllerClass = getattr(controller, "Controller")


# 下载
class Download(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./download/",
            # 选择的服务
            "services": "upload",
        }
        config_temp = {}
        config_temp.update(config)
        config_temp.update(config_init)
        super(Download, self).__init__(config_temp)

    # 下载文件
    def Index(self, ctx):
        src = ctx.query["src"]
        name = src.split("/")[-1]
        filename = open("static" + src, "rb")
        response = make_response(filename)
        response.headers["Content-Type"] = "application/octet-stream"
        response.headers["Content-Disposition"] = "attachment; filename*=utf-8''{}".format(src.encode().decode('latin-1'))
        return response
