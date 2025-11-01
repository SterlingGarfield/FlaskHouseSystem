from core import controller
from service import service_select
controllerClass = getattr(controller, "Controller")

# 租客用户
class Tenant_user(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./tenant_user/",
            # 选择的服务
            "services": "tenant_user",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Tenant_user , self).__init__(config_temp)

    # 添加数据成功后
    def Add_before(self, ctx):
        """
		添加数据前
		@param {Object} ctx http请求上下文
		@return {Object} 返回json-rpc格式结果
		"""
        body = ctx.body
        service = self.service
        exist_obj = self.service.Get_obj({"mobile_phone_number":body['mobile_phone_number']})
        if exist_obj:
            return {"error": {"code": 10000, "message": "字段手机号码内容不能重复"}}
        return {"code": 0}




