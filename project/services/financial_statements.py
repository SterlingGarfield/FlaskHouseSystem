from core.mysql import Service


# 财务报表服务
class Financial_statements(Service):
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
                "table": "financial_statements",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Financial_statements , self).__init__(config_temp)
