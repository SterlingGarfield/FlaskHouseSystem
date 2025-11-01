from core import controller

controllerClass = getattr(controller, "Controller")


# 售后
class Operation_log(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./operation_log/",
            # 选择的服务
            "services": "operation_log",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Operation_log, self).__init__(config_temp)
