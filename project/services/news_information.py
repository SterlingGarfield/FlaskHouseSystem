from core.mysql import Service


# 新闻信息服务
class News_information(Service):
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
                "table": "news_information",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(News_information , self).__init__(config_temp)
