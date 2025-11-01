<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','booking_code') || $check_field('add','booking_code') || $check_field('set','booking_code')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约编码" prop="booking_code">
												<el-input id="booking_code" v-model="form['booking_code']" placeholder="请输入预约编码"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','booking_code')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','booking_code'))" :disabled="true">
				  					</el-input>
					<div v-else-if="$check_field('get','booking_code')">
						{{form['booking_code']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_title') || $check_field('add','house_title') || $check_field('set','house_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋标题" prop="house_title">
												<el-input id="house_title" v-model="form['house_title']" placeholder="请输入房屋标题"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','house_title')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','house_title'))" :disabled="disabledObj['house_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_title')">
						{{form['house_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','area') || $check_field('add','area') || $check_field('set','area')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="所在区域" prop="area">
												<el-input id="area" v-model="form['area']" placeholder="请输入所在区域"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','area')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','area'))" :disabled="disabledObj['area_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','area')">
						{{form['area']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_type') || $check_field('add','house_type') || $check_field('set','house_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋户型" prop="house_type">
												<el-input id="house_type" v-model="form['house_type']" placeholder="请输入房屋户型"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','house_type')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','house_type'))" :disabled="disabledObj['house_type_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_type')">
						{{form['house_type']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_rent') || $check_field('add','housing_rent') || $check_field('set','housing_rent')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋租金" prop="housing_rent">
												<el-input id="housing_rent" v-model="form['housing_rent']" placeholder="请输入房屋租金"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','housing_rent')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','housing_rent'))" :disabled="disabledObj['housing_rent_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','housing_rent')">
						{{form['housing_rent']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_deposit') || $check_field('add','housing_deposit') || $check_field('set','housing_deposit')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋押金" prop="housing_deposit">
												<el-input id="housing_deposit" v-model="form['housing_deposit']" placeholder="请输入房屋押金"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','housing_deposit')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','housing_deposit'))" :disabled="disabledObj['housing_deposit_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','housing_deposit')">
						{{form['housing_deposit']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','price_description') || $check_field('add','price_description') || $check_field('set','price_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="价格说明" prop="price_description">
												<el-input id="price_description" v-model="form['price_description']" placeholder="请输入价格说明"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','price_description')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','price_description'))" :disabled="disabledObj['price_description_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','price_description')">
						{{form['price_description']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_address') || $check_field('add','house_address') || $check_field('set','house_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋地址" prop="house_address">
												<el-input id="house_address" v-model="form['house_address']" placeholder="请输入房屋地址"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','house_address')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','house_address'))" :disabled="disabledObj['house_address_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_address')">
						{{form['house_address']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房东用户" prop="landlord_user">
													<el-select v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','landlord_user')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
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
							<el-select v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','tenant_user')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','tenant_user'))" id="tenant_user" v-model="form['tenant_user']" :disabled="disabledObj['tenant_user_isDisabled']">
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
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','user_name')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','user_name')">
						{{form['user_name']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','mobile_phone_number') || $check_field('add','mobile_phone_number') || $check_field('set','mobile_phone_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="手机号码" prop="mobile_phone_number">
												<el-input id="mobile_phone_number" v-model="form['mobile_phone_number']" placeholder="请输入手机号码"
							  v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','mobile_phone_number')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','mobile_phone_number'))" :disabled="disabledObj['mobile_phone_number_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','mobile_phone_number')">
						{{form['mobile_phone_number']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','appointment_time') || $check_field('add','appointment_time') || $check_field('set','appointment_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约时间" prop="appointment_time">
								<el-date-picker :disabled="disabledObj['appointment_time_isDisabled']" v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','appointment_time')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','appointment_time'))" id="appointment_time"
						v-model="form['appointment_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','appointment_time')">{{form['appointment_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','appointment_remarks') || $check_field('add','appointment_remarks') || $check_field('set','appointment_remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约备注" prop="appointment_remarks">
								<el-input type="textarea" id="appointment_remarks" v-model="form['appointment_remarks']" placeholder="请输入预约备注"
						v-if="(form['appointment_to_see_the_room_id'] && $check_field('set','appointment_remarks')) || (!form['appointment_to_see_the_room_id'] && $check_field('add','appointment_remarks'))" :disabled="disabledObj['appointment_remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','appointment_remarks')">{{form['appointment_remarks']}}</div>
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
	
	
	
		
		
						<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 1 > 0">
			  <el-form-item label="租赁合同限次">
				<el-input id="limit_times" v-model="form['lease_contract_limit_times']" placeholder="租赁合同限制次数，0为不限"
						  v-if="$check_option('/appointment_to_see_the_room/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/appointment_to_see_the_room/view','get')" v-html="form['lease_contract_limit_times']"></div>
			  </el-form-item>
			</el-col>
			
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/appointment_to_see_the_room/view','set') || $check_action('/appointment_to_see_the_room/view','add')">
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
				field: "appointment_to_see_the_room_id",
				url_add: "~/api/appointment_to_see_the_room/add?",
				url_set: "~/api/appointment_to_see_the_room/set?",
				url_get_obj: "~/api/appointment_to_see_the_room/get_obj?",
				url_upload: "~/api/appointment_to_see_the_room/upload?",

				query: {
					"appointment_to_see_the_room_id": 0,
				},

				form: {
								"booking_code": this.$get_stamp(), // 预约编码
										"house_title":  '', // 房屋标题
										"area":  '', // 所在区域
										"house_type":  '', // 房屋户型
										"housing_rent":  '', // 房屋租金
										"housing_deposit":  '', // 房屋押金
										"price_description":  '', // 价格说明
										"house_address":  '', // 房屋地址
										"landlord_user": 0, // 房东用户
										"tenant_user": 0, // 租客用户
										"user_name":  '', // 用户姓名
										"mobile_phone_number":  '', // 手机号码
										"appointment_time":  '', // 预约时间
										"appointment_remarks":  '', // 预约备注
									"examine_state": "未审核",
							"examine_reply": "",
							"appointment_to_see_the_room_id": 0, // ID
													"lease_contract_limit_times": 1, // 租赁合同限制次数
										},
				disabledObj:{
								"booking_code_isDisabled": false,
										"house_title_isDisabled": false,
										"area_isDisabled": false,
										"house_type_isDisabled": false,
										"housing_rent_isDisabled": false,
										"housing_deposit_isDisabled": false,
										"price_description_isDisabled": false,
										"house_address_isDisabled": false,
										"landlord_user_isDisabled": false,
										"tenant_user_isDisabled": false,
										"user_name_isDisabled": false,
										"mobile_phone_number_isDisabled": false,
										"appointment_time_isDisabled": false,
										"appointment_remarks_isDisabled": false,
										},

																																																							// 用户列表
				list_user_landlord_user: [],
													// 用户列表
				list_user_tenant_user: [],
						// 用户组
				group_user_tenant_user: "",
																														
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
							this.form["tenant_user"] = this.$store.state.user.user_id;
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
																									        if (this.form["appointment_time"] && JSON.stringify(this.form["appointment_time"]).indexOf("-")===-1){
            this.form["appointment_time"] = this.$toTime(parseInt(this.form["appointment_time"]),"yyyy-MM-dd hh:mm:ss")
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

																																																																																									if(json.result.obj["appointment_time"]=="0000-00-00 00:00:00"){
				  json.result.obj["appointment_time"] = null;
				}
				if(parseInt(json.result.obj["appointment_time"]) > 9999){
					json.result.obj["appointment_time"] = this.$toTime(parseInt(json.result.obj["appointment_time"]),"yyyy-MM-dd hh:mm:ss")
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
																																																																																																																																															if (!param.appointment_time){
					return "预约时间不能为空";
				}
																											return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/appointment_to_see_the_room/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/appointment_to_see_the_room/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/appointment_to_see_the_room/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/appointment_to_see_the_room/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/appointment_to_see_the_room/view','get');
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
