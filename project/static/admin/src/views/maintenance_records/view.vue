<template>
	<el-main class="bg edit_wrap comtable_e">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce"> 
							<el-col v-if="$check_field('get','contract_code') || $check_field('add','contract_code') || $check_field('set','contract_code')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="合同编码" prop="contract_code">
															<el-input id="contract_code" v-model="form['contract_code']" placeholder="请输入合同编码"
							  v-if="(form['maintenance_records_id'] && $check_field('set','contract_code')) || (!form['maintenance_records_id'] && $check_field('add','contract_code'))" :disabled="disabledObj['contract_code_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','contract_code')">
						{{form['contract_code']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_title') || $check_field('add','house_title') || $check_field('set','house_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="房屋标题" prop="house_title">
															<el-input id="house_title" v-model="form['house_title']" placeholder="请输入房屋标题"
							  v-if="(form['maintenance_records_id'] && $check_field('set','house_title')) || (!form['maintenance_records_id'] && $check_field('add','house_title'))" :disabled="disabledObj['house_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_title')">
						{{form['house_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="房东用户" prop="landlord_user">
																<el-select v-if="(form['maintenance_records_id'] && $check_field('set','landlord_user')) || (!form['maintenance_records_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
							<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','landlord_user')" id="landlord_user" v-model="form['landlord_user']" :disabled="true">
							<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','tenant_user') || $check_field('add','tenant_user') || $check_field('set','tenant_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="租客用户" prop="tenant_user">
																					<div v-if="user_group !== '管理员'">
							{{ get_user_session_tenant_user(form['tenant_user']) }}
							<el-select v-if="(form['maintenance_records_id'] && $check_field('set','tenant_user')) || (!form['maintenance_records_id'] && $check_field('add','tenant_user'))" id="tenant_user" v-model="form['tenant_user']" :disabled="disabledObj['tenant_user_isDisabled']">
								<el-option v-for="o in list_user_tenant_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','tenant_user')" id="tenant_user" v-model="form['tenant_user']" :disabled="true">
								<el-option v-for="o in list_user_tenant_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="tenant_user" v-model="form['tenant_user']" :disabled="disabledObj['tenant_user_isDisabled']">
							<el-option v-for="o in list_user_tenant_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="用户姓名" prop="user_name">
															<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="(form['maintenance_records_id'] && $check_field('set','user_name')) || (!form['maintenance_records_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','user_name')">
						{{form['user_name']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','repair_title') || $check_field('add','repair_title') || $check_field('set','repair_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="报修标题" prop="repair_title">
															<el-input id="repair_title" v-model="form['repair_title']" placeholder="请输入报修标题"
							  v-if="(form['maintenance_records_id'] && $check_field('set','repair_title')) || (!form['maintenance_records_id'] && $check_field('add','repair_title'))" :disabled="disabledObj['repair_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','repair_title')">
						{{form['repair_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','repair_date') || $check_field('add','repair_date') || $check_field('set','repair_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="报修日期" prop="repair_date">
											<el-date-picker :disabled="disabledObj['repair_date_isDisabled']" v-if="(form['maintenance_records_id'] && $check_field('set','repair_date')) || (!form['maintenance_records_id'] && $check_field('add','repair_date'))" id="repair_date"
						v-model="form['repair_date']" type="date" placeholder="选择日期" value-format="yyyy-MM-dd">
					</el-date-picker>
					<div v-else-if="$check_field('get','repair_date')">{{form['repair_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','contents_of_repair_report') || $check_field('add','contents_of_repair_report') || $check_field('set','contents_of_repair_report')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="报修内容" prop="contents_of_repair_report">
											<el-input type="textarea" id="contents_of_repair_report" v-model="form['contents_of_repair_report']" placeholder="请输入报修内容"
						v-if="(form['maintenance_records_id'] && $check_field('set','contents_of_repair_report')) || (!form['maintenance_records_id'] && $check_field('add','contents_of_repair_report'))" :disabled="disabledObj['contents_of_repair_report_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contents_of_repair_report')">{{form['contents_of_repair_report']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','maintenance_status') || $check_field('add','maintenance_status') || $check_field('set','maintenance_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="维修状态" prop="maintenance_status">
											<el-select id="maintenance_status" v-model="form['maintenance_status']"
						v-if="(form['maintenance_records_id'] && $check_field('set','maintenance_status')) || (!form['maintenance_records_id'] && $check_field('add','maintenance_status'))">
						<el-option v-for="o in list_maintenance_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','maintenance_status')">{{form['maintenance_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','maintenance') || $check_field('add','maintenance') || $check_field('set','maintenance')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="维修情况" prop="maintenance">
											<el-input type="textarea" id="maintenance" v-model="form['maintenance']" placeholder="请输入维修情况"
						v-if="(form['maintenance_records_id'] && $check_field('set','maintenance')) || (!form['maintenance_records_id'] && $check_field('add','maintenance'))" :disabled="disabledObj['maintenance_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','maintenance')">{{form['maintenance']}}</div>
							</el-form-item>
			</el-col>
								<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="(form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())" :disabled="true">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="(form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" :disabled="true"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
		
		
	
	
	
		
		
	
		</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/maintenance_records/view','set') || $check_action('/maintenance_records/view','add')">
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
				<el-form-item v-else>
					<el-button @click="cancel()">返回</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";
                    	export default {
		mixins: [mixin],
		data() {
			return {
				field: "maintenance_records_id",
				url_add: "~/api/maintenance_records/add?",
				url_set: "~/api/maintenance_records/set?",
				url_get_obj: "~/api/maintenance_records/get_obj?",
				url_upload: "~/api/maintenance_records/upload?",

				query: {
					"maintenance_records_id": 0,
				},

				form: {
								"contract_code":  '', // 合同编码
										"house_title":  '', // 房屋标题
										"landlord_user": 0, // 房东用户
										"tenant_user": 0, // 租客用户
										"user_name":  '', // 用户姓名
										"repair_title":  '', // 报修标题
										"repair_date":  '', // 报修日期
										"contents_of_repair_report":  '', // 报修内容
										"maintenance_status":  '', // 维修状态
										"maintenance":  '', // 维修情况
									"examine_state": "未审核",
							"examine_reply": "",
							"maintenance_records_id": 0, // ID
															},
				disabledObj:{
								"contract_code_isDisabled": false,
										"house_title_isDisabled": false,
										"landlord_user_isDisabled": false,
										"tenant_user_isDisabled": false,
										"user_name_isDisabled": false,
										"repair_title_isDisabled": false,
										"repair_date_isDisabled": false,
										"contents_of_repair_report_isDisabled": false,
										"maintenance_status_isDisabled": false,
										"maintenance_isDisabled": false,
										},

																	// 用户列表
				list_user_landlord_user: [],
												// 用户列表
				list_user_tenant_user: [],
						// 用户组
				group_user_tenant_user: "",
																																// 维修状态选项列表
				list_maintenance_status: ['待处理','处理中','已完成'],
										
			}
		},
		methods: {
													openPreview(file) {
			    window.open(file.url)
			},
		
	
				
	
				
	
				/**
			 * 获取房东用户用户列表
			 */
			async get_list_user_landlord_user() {
                var json = await this.$get("~/api/user/get_list?user_group=房东用户");
                if(json.result && json.result.list){
                    this.list_user_landlord_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_landlord_user(id){
				var obj = this.list_user_landlord_user.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
				
	
				/**
			 * 获取租客用户用户列表
			 */
			async get_list_user_tenant_user() {
                var json = await this.$get("~/api/user/get_list?user_group=租客用户");
                if(json.result && json.result.list){
                    this.list_user_tenant_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取租客用户用户组
			 */
			async get_group_user_tenant_user() {
							this.form["tenant_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=租客用户");
				if(json.result && json.result.obj){
					this.group_user_tenant_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_tenant_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_tenant_user.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["tenant_user"] = id
									_this.disabledObj['tenant_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "tenant_user") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_tenant_user(id){
				var obj = this.list_user_tenant_user.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
				
	
				
	
				
	
				
	
				
	
				
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																						// 获取缓存数据附加
				form = $.db.get("form");
						if(form != null){
					if("examine_state" in form){
						delete form.examine_state
					}
								if("examine_reply" in form){
						delete form.examine_reply
					}
							}
									$.push(this.form ,form);
													
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
								this.form[key] = form[dbKey]
							}
							if(dbKey === "source_table"){
								this.form['source_table'] = form[dbKey];
							}
							if(dbKey === "source_id"){
								this.form['source_id'] = form[dbKey];
							}
							if(dbKey === "source_user_id"){
								this.form['source_user_id'] = form[dbKey];
							}
						})
					})
				}
							        if (this.form["repair_date"] && JSON.stringify(this.form["repair_date"]).indexOf("-")===-1){
          this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
        }
								$.db.del("form");

				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
																																																if(this.form["repair_date"]=="0000-00-00"){
				  this.form["repair_date"] = null;
				}
				if(parseInt(this.form["repair_date"]) > 9999){
					this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
				}
																											

			},

																																																																																		async submit(param, func){
				if (!param) {
					param = this.form;
				}
						
				var pm = this.events("submit_before", Object.assign({}, param)) || param;
				var msg = await this.events("submit_check", pm);
				var ret;
				if (msg) {
					this.$toast(msg, 'danger');
				} else {
																																																																																	ret = this.events("submit_main", pm, func);
				}
				return ret;
			},
			
			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
						submit_check(param) {
					
																																																																									if (!param.repair_date){
					return "报修日期不能为空";
				}
																																																	return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/maintenance_records/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/maintenance_records/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/maintenance_records/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/maintenance_records/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/maintenance_records/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
									this.get_list_user_landlord_user();
								this.get_list_user_tenant_user();
					this.get_group_user_tenant_user();
																	},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
	
	.img_multiple{
		overflow: hidden;
	}
	.img_multiple .img_block{
		float: left;
		margin-right: 5px;
		margin-bottom: 5px;
		position: relative;
	}
	.img_multiple .img_block img{
		height: 100px;
		width: auto;
	}
	.img_multiple .img_del{
		position: absolute;
		top: 5px;
		right: 5px;
		width: 20px;
		height: 20px;
		background: #0000008a;
		color: #fff;
		line-height: 20px;
		text-align: center;
		border-radius: 100%;
		cursor: pointer;
	}




	
</style>
