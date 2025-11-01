from core.mysql import Service


# 预约看房服务
class Appointment_to_see_the_room(Service):
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
                "table": "appointment_to_see_the_room",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Appointment_to_see_the_room , self).__init__(config_temp)
