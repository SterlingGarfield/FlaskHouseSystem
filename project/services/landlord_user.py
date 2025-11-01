from core.mysql import Service


# 房东用户服务
class Landlord_user(Service):
    def __init__(self, *config):
        """
        构造函数
        @param {Object} config 配置参数
        """
        if config:
            config_temp = config[0]
        else:
            config_temp = {
                # 操作的表
                "table": "landlord_user",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Landlord_user , self).__init__(config_temp)
