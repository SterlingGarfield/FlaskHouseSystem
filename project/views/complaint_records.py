from core import controller
from service import service_select
controllerClass = getattr(controller, "Controller")

# 投诉记录
class Complaint_records(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./complaint_records/",
            # 选择的服务
            "services": "complaint_records",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Complaint_records , self).__init__(config_temp)

    # 添加数据成功后
    def Add_before(self, ctx):
        """
		添加数据前
		@param {Object} ctx http请求上下文
		@return {Object} 返回json-rpc格式结果
		"""
        body = ctx.body
        service = self.service
        return {"code": 0}




