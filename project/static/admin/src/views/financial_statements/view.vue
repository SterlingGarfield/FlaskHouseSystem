<template>
	<el-main class="bg edit_wrap comtable_e">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce"> 
							<el-col v-if="$check_field('get','report_title') || $check_field('add','report_title') || $check_field('set','report_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="报表标题" prop="report_title">
															<el-input id="report_title" v-model="form['report_title']" placeholder="请输入报表标题"
							  v-if="(form['financial_statements_id'] && $check_field('set','report_title')) || (!form['financial_statements_id'] && $check_field('add','report_title'))" :disabled="disabledObj['report_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','report_title')">
						{{form['report_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_title') || $check_field('add','house_title') || $check_field('set','house_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="房屋标题" prop="house_title">
															<el-input id="house_title" v-model="form['house_title']" placeholder="请输入房屋标题"
							  v-if="(form['financial_statements_id'] && $check_field('set','house_title')) || (!form['financial_statements_id'] && $check_field('add','house_title'))" :disabled="disabledObj['house_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_title')">
						{{form['house_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="房东用户" prop="landlord_user">
																					<div v-if="user_group !== '管理员'">
							{{ get_user_session_landlord_user(form['landlord_user']) }}
							<el-select v-if="(form['financial_statements_id'] && $check_field('set','landlord_user')) || (!form['financial_statements_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
								<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','landlord_user')" id="landlord_user" v-model="form['landlord_user']" :disabled="true">
								<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
							<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','statistical_time') || $check_field('add','statistical_time') || $check_field('set','statistical_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="统计时间" prop="statistical_time">
											<el-date-picker :disabled="disabledObj['statistical_time_isDisabled']" v-if="(form['financial_statements_id'] && $check_field('set','statistical_time')) || (!form['financial_statements_id'] && $check_field('add','statistical_time'))" id="statistical_time"
						v-model="form['statistical_time']" type="date" placeholder="选择日期" value-format="yyyy-MM-dd">
					</el-date-picker>
					<div v-else-if="$check_field('get','statistical_time')">{{form['statistical_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_rental_rate') || $check_field('add','housing_rental_rate') || $check_field('set','housing_rental_rate')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="出租率 %" prop="housing_rental_rate">
											<el-input-number id="housing_rental_rate" v-model.number="form['housing_rental_rate']"
						v-if="(form['financial_statements_id'] && $check_field('set','housing_rental_rate')) || (!form['financial_statements_id'] && $check_field('add','housing_rental_rate'))" :disabled="disabledObj['housing_rental_rate_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','housing_rental_rate')">{{form['housing_rental_rate']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','rental_income') || $check_field('add','rental_income') || $check_field('set','rental_income')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="租金收入" prop="rental_income">
											<el-input-number id="rental_income" v-model.number="form['rental_income']"
						v-if="(form['financial_statements_id'] && $check_field('set','rental_income')) || (!form['financial_statements_id'] && $check_field('add','rental_income'))" :disabled="disabledObj['rental_income_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','rental_income')">{{form['rental_income']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_activity') || $check_field('add','user_activity') || $check_field('set','user_activity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="用户活跃度" prop="user_activity">
											<el-input-number id="user_activity" v-model.number="form['user_activity']"
						v-if="(form['financial_statements_id'] && $check_field('set','user_activity')) || (!form['financial_statements_id'] && $check_field('add','user_activity'))" :disabled="disabledObj['user_activity_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','user_activity')">{{form['user_activity']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','statistical_content') || $check_field('add','statistical_content') || $check_field('set','statistical_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="统计内容" prop="statistical_content">
											<el-input type="textarea" id="statistical_content" v-model="form['statistical_content']" placeholder="请输入统计内容"
						v-if="(form['financial_statements_id'] && $check_field('set','statistical_content')) || (!form['financial_statements_id'] && $check_field('add','statistical_content'))" :disabled="disabledObj['statistical_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','statistical_content')">{{form['statistical_content']}}</div>
							</el-form-item>
			</el-col>
						
	
	
		
		
	
	
	
		
		
	
		</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/financial_statements/view','set') || $check_action('/financial_statements/view','add')">
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
				field: "financial_statements_id",
				url_add: "~/api/financial_statements/add?",
				url_set: "~/api/financial_statements/set?",
				url_get_obj: "~/api/financial_statements/get_obj?",
				url_upload: "~/api/financial_statements/upload?",

				query: {
					"financial_statements_id": 0,
				},

				form: {
								"report_title":  '', // 报表标题
										"house_title":  '', // 房屋标题
										"landlord_user": 0, // 房东用户
										"statistical_time":  '', // 统计时间
										"housing_rental_rate":  0, // 出租率 %
										"rental_income":  0, // 租金收入
										"user_activity":  0, // 用户活跃度
										"statistical_content":  '', // 统计内容
											"financial_statements_id": 0, // ID
															},
				disabledObj:{
								"report_title_isDisabled": false,
										"house_title_isDisabled": false,
										"landlord_user_isDisabled": false,
										"statistical_time_isDisabled": false,
					          			"housing_rental_rate_isDisabled": false,
					          			"rental_income_isDisabled": false,
					          			"user_activity_isDisabled": false,
										"statistical_content_isDisabled": false,
										},

																	// 用户列表
				list_user_landlord_user: [],
						// 用户组
				group_user_landlord_user: "",
																														
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
					/**
			 * 获取房东用户用户组
			 */
			async get_group_user_landlord_user() {
							this.form["landlord_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=房东用户");
				if(json.result && json.result.obj){
					this.group_user_landlord_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_landlord_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_landlord_user.source_table+"/get_obj?"
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
												_this.form["landlord_user"] = id
									_this.disabledObj['landlord_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "landlord_user") {
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
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
														// 获取缓存数据附加
				form = $.db.get("form");
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
				        if (this.form["statistical_time"] && JSON.stringify(this.form["statistical_time"]).indexOf("-")===-1){
          this.form["statistical_time"] = this.$toTime(parseInt(this.form["statistical_time"]),"yyyy-MM-dd")
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
																											if(this.form["statistical_time"]=="0000-00-00"){
				  this.form["statistical_time"] = null;
				}
				if(parseInt(this.form["statistical_time"]) > 9999){
					this.form["statistical_time"] = this.$toTime(parseInt(this.form["statistical_time"]),"yyyy-MM-dd")
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
					
																																								if (!param.statistical_time){
					return "统计时间不能为空";
				}
																																																												return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/financial_statements/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/financial_statements/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/financial_statements/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/financial_statements/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/financial_statements/view','get');
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
					this.get_group_user_landlord_user();
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
