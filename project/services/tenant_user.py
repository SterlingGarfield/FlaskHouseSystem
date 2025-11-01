from core.mysql import Service


# 租客用户服务
class Tenant_user(Service):
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
                "table": "tenant_user",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Tenant_user , self).__init__(config_temp)
