from core.mysql import Service


# 租赁合同服务
class Lease_contract(Service):
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
                "table": "lease_contract",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Lease_contract , self).__init__(config_temp)
