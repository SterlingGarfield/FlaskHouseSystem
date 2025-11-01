from core.mysql import Service


# 区域分类服务
class Regional_classification(Service):
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
                "table": "regional_classification",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Regional_classification , self).__init__(config_temp)
