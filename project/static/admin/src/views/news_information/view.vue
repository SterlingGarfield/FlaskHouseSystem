<template>
	<el-main class="bg edit_wrap comtable_e">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce"> 
							<el-col v-if="$check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="房东用户" prop="landlord_user">
																					<div v-if="user_group !== '管理员'">
							{{ get_user_session_landlord_user(form['landlord_user']) }}
							<el-select v-if="(form['news_information_id'] && $check_field('set','landlord_user')) || (!form['news_information_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
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
								<el-col v-if="$check_field('get','news_name') || $check_field('add','news_name') || $check_field('set','news_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item prop="news_name">
					<div slot="label">
						<i style="color: red;">*</i>
						新闻名称
					</div>
															<el-input id="news_name" v-model="form['news_name']" placeholder="请输入新闻名称"
							  v-if="(form['news_information_id'] && $check_field('set','news_name')) || (!form['news_information_id'] && $check_field('add','news_name'))" :disabled="disabledObj['news_name_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','news_name')">
						{{form['news_name']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','news_type') || $check_field('add','news_type') || $check_field('set','news_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="新闻类型" prop="news_type">
															<el-input id="news_type" v-model="form['news_type']" placeholder="请输入新闻类型"
							  v-if="(form['news_information_id'] && $check_field('set','news_type')) || (!form['news_information_id'] && $check_field('add','news_type'))" :disabled="disabledObj['news_type_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','news_type')">
						{{form['news_type']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','news_pictures') || $check_field('add','news_pictures') || $check_field('set','news_pictures')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="新闻图片" prop="news_pictures">
											<el-upload :disabled="disabledObj['news_pictures_isDisabled']" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_news_pictures"
						:show-file-list="false" v-if="(form['news_information_id'] && $check_field('set','news_pictures')) || (!form['news_information_id'] && $check_field('add','news_pictures'))">
						<img id="news_pictures" v-if="form['news_pictures']" :src="$fullUrl(form['news_pictures'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','news_pictures')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['news_pictures'])" :preview-src-list="[$fullUrl(form['news_pictures'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','release_date') || $check_field('add','release_date') || $check_field('set','release_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="发布日期" prop="release_date">
											<el-date-picker :disabled="disabledObj['release_date_isDisabled']" v-if="(form['news_information_id'] && $check_field('set','release_date')) || (!form['news_information_id'] && $check_field('add','release_date'))" id="release_date"
						v-model="form['release_date']" type="date" placeholder="选择日期" value-format="yyyy-MM-dd">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_date')">{{form['release_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','news_brief') || $check_field('add','news_brief') || $check_field('set','news_brief')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="新闻简介" prop="news_brief">
											<el-input type="textarea" id="news_brief" v-model="form['news_brief']" placeholder="请输入新闻简介"
						v-if="(form['news_information_id'] && $check_field('set','news_brief')) || (!form['news_information_id'] && $check_field('add','news_brief'))" :disabled="disabledObj['news_brief_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','news_brief')">{{form['news_brief']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','news_details') || $check_field('add','news_details') || $check_field('set','news_details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
							<el-form-item label="新闻详情" prop="news_details">
								<quill-editor v-model.number="form['news_details']"
						v-if="(form['news_information_id'] && $check_field('set','news_details')) || (!form['news_information_id'] && $check_field('add','news_details')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','news_details')" v-html="form['news_details']"></div>
				</el-form-item>
			</el-col>
						
	
	
		
		
	
	
	
		
		
	
		</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/news_information/view','set') || $check_action('/news_information/view','add')">
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
				field: "news_information_id",
				url_add: "~/api/news_information/add?",
				url_set: "~/api/news_information/set?",
				url_get_obj: "~/api/news_information/get_obj?",
				url_upload: "~/api/news_information/upload?",

				query: {
					"news_information_id": 0,
				},

				form: {
								"landlord_user": 0, // 房东用户
										"news_name": null, // 新闻名称
										"news_type":  '', // 新闻类型
										"news_pictures":  '', // 新闻图片
										"release_date":  '', // 发布日期
										"news_brief":  '', // 新闻简介
										"news_details":  '', // 新闻详情
											"news_information_id": 0, // ID
															},
				disabledObj:{
								"landlord_user_isDisabled": false,
										"news_name_isDisabled": false,
										"news_type_isDisabled": false,
										"news_pictures_isDisabled": false,
										"release_date_isDisabled": false,
										"news_brief_isDisabled": false,
										"news_details_isDisabled": false,
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
			 * 上传新闻图片
			 * @param {Object} param 图片参数
			 */
			upload_news_pictures(param){
									this.uploadFile(param.file, "news_pictures");
								},
		
	
				
	
				
	
				
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																										
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
					        if (this.form["release_date"] && JSON.stringify(this.form["release_date"]).indexOf("-")===-1){
          this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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
																																		if(this.form["release_date"]=="0000-00-00"){
				  this.form["release_date"] = null;
				}
				if(parseInt(this.form["release_date"]) > 9999){
					this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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
					
																		if (!param.news_name){
					return "新闻名称不能为空";
				}
																																							if (!param.release_date){
					return "发布日期不能为空";
				}
																																						return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/news_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/news_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/news_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/news_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/news_information/view','get');
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
