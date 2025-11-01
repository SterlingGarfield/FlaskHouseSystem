from core.mysql import Service


# 维修记录服务
class Maintenance_records(Service):
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
                "table": "maintenance_records",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Maintenance_records , self).__init__(config_temp)
