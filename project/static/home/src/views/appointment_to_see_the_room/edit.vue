<template>
	<div class="diy_edit page_appointment_to_see_the_room" id="appointment_to_see_the_room_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','booking_code') || $check_field('add','booking_code') || $check_field('get','booking_code')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								预约编码:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_booking_code" v-model="form['booking_code']" placeholder="请输入预约编码" v-if="(form['booking_code'] && $check_field('set','booking_code')) || (!form['booking_code'] && $check_field('add','booking_code'))" :disabled="true"/>
							<span v-else-if="$check_field('get','booking_code')">{{ form['booking_code'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','house_title') || $check_field('add','house_title') || $check_field('get','house_title')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋标题:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_house_title" v-model="form['house_title']" placeholder="请输入房屋标题" v-if="(form['house_title'] && $check_field('set','house_title')) || (!form['house_title'] && $check_field('add','house_title'))"  :disabled="disabledObj['house_title_isDisabled']"/>
							<span v-else-if="$check_field('get','house_title')">{{ form['house_title'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','area') || $check_field('add','area') || $check_field('get','area')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								所在区域:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_area" v-model="form['area']" placeholder="请输入所在区域" v-if="(form['area'] && $check_field('set','area')) || (!form['area'] && $check_field('add','area'))"  :disabled="disabledObj['area_isDisabled']"/>
							<span v-else-if="$check_field('get','area')">{{ form['area'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','house_type') || $check_field('add','house_type') || $check_field('get','house_type')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋户型:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_house_type" v-model="form['house_type']" placeholder="请输入房屋户型" v-if="(form['house_type'] && $check_field('set','house_type')) || (!form['house_type'] && $check_field('add','house_type'))"  :disabled="disabledObj['house_type_isDisabled']"/>
							<span v-else-if="$check_field('get','house_type')">{{ form['house_type'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','housing_rent') || $check_field('add','housing_rent') || $check_field('get','housing_rent')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋租金:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_housing_rent" v-model="form['housing_rent']" placeholder="请输入房屋租金" v-if="(form['housing_rent'] && $check_field('set','housing_rent')) || (!form['housing_rent'] && $check_field('add','housing_rent'))"  :disabled="disabledObj['housing_rent_isDisabled']"/>
							<span v-else-if="$check_field('get','housing_rent')">{{ form['housing_rent'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','housing_deposit') || $check_field('add','housing_deposit') || $check_field('get','housing_deposit')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋押金:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_housing_deposit" v-model="form['housing_deposit']" placeholder="请输入房屋押金" v-if="(form['housing_deposit'] && $check_field('set','housing_deposit')) || (!form['housing_deposit'] && $check_field('add','housing_deposit'))"  :disabled="disabledObj['housing_deposit_isDisabled']"/>
							<span v-else-if="$check_field('get','housing_deposit')">{{ form['housing_deposit'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','price_description') || $check_field('add','price_description') || $check_field('get','price_description')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								价格说明:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_price_description" v-model="form['price_description']" placeholder="请输入价格说明" v-if="(form['price_description'] && $check_field('set','price_description')) || (!form['price_description'] && $check_field('add','price_description'))"  :disabled="disabledObj['price_description_isDisabled']"/>
							<span v-else-if="$check_field('get','price_description')">{{ form['price_description'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','house_address') || $check_field('add','house_address') || $check_field('get','house_address')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋地址:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_house_address" v-model="form['house_address']" placeholder="请输入房屋地址" v-if="(form['house_address'] && $check_field('set','house_address')) || (!form['house_address'] && $check_field('add','house_address'))"  :disabled="disabledObj['house_address_isDisabled']"/>
							<span v-else-if="$check_field('get','house_address')">{{ form['house_address'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','landlord_user') || $check_field('add','landlord_user') || $check_field('get','landlord_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房东用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_landlord_user" :disabled="disabledObj['landlord_user_isDisabled']" v-model="form['landlord_user']" v-if="(form['landlord_user'] && $check_field('set','landlord_user')) || (!form['landlord_user'] && $check_field('add','landlord_user'))" >
								<option v-for="o in list_user_landlord_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','landlord_user')">{{ get_user_info("landlord_user", form['landlord_user']) }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','tenant_user') || $check_field('add','tenant_user') || $check_field('get','tenant_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								租客用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_tenant_user" :disabled="disabledObj['tenant_user_isDisabled']" v-model="form['tenant_user']" v-if="(form['tenant_user'] && $check_field('set','tenant_user')) || (!form['tenant_user'] && $check_field('add','tenant_user'))" >
								<option v-for="o in list_user_tenant_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','tenant_user')">{{ get_user_info("tenant_user", form['tenant_user']) }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_name" v-model="form['user_name']" placeholder="请输入用户姓名" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))"  :disabled="disabledObj['user_name_isDisabled']"/>
							<span v-else-if="$check_field('get','user_name')">{{ form['user_name'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','mobile_phone_number') || $check_field('add','mobile_phone_number') || $check_field('get','mobile_phone_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								手机号码:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_mobile_phone_number" v-model="form['mobile_phone_number']" placeholder="请输入手机号码" v-if="(form['mobile_phone_number'] && $check_field('set','mobile_phone_number')) || (!form['mobile_phone_number'] && $check_field('add','mobile_phone_number'))"  :disabled="disabledObj['mobile_phone_number_isDisabled']"/>
							<span v-else-if="$check_field('get','mobile_phone_number')">{{ form['mobile_phone_number'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','appointment_time') || $check_field('add','appointment_time') || $check_field('get','appointment_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								预约时间:
							</span>
						</div>
								<!-- 日长 -->
						<div class="diy_field diy_datetime">
							<input type="datetime-local" :disabled="disabledObj['appointment_time_isDisabled']" id="form_appointment_time" v-model="form['appointment_time']" placeholder="请输入预约时间" v-if="(form['appointment_time'] && $check_field('set','appointment_time')) || (!form['appointment_time'] && $check_field('add','appointment_time'))" />
							<span v-else-if="$check_field('get','appointment_time')">{{ form['appointment_time'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','appointment_remarks') || $check_field('add','appointment_remarks') || $check_field('get','appointment_remarks')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								预约备注:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_appointment_remarks" v-model="form['appointment_remarks']" v-if="(form['appointment_remarks'] && $check_field('set','appointment_remarks')) || (!form['appointment_remarks'] && $check_field('add','appointment_remarks'))" :disabled="disabledObj['appointment_remarks_isDisabled']" />
							<span v-else-if="$check_field('get','appointment_remarks')">{{ form['appointment_remarks'] }}</span>
						</div>
							</div>
	


					<div v-if="$check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/appointment_to_see_the_room/edit','examine')">
							<!--<span> {{ form['examine_state'] }} </span>-->
							<select v-model="form['examine_state']">
								<option value="未审核">
									未审核
								</option>
								<option value="已通过">
									已通过
								</option>
								<option value="未通过">
									未通过
								</option>
							</select>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_state'] }}
							</span>
						</div>
					</div>
					<div v-if="$check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核回复:
							</span>
						</div>
						<div class="diy_field diy_desc" v-if="$check_action('/appointment_to_see_the_room/edit','examine')">
							<textarea v-model="form['examine_reply']"></textarea>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_reply'] }}
							</span>
						</div>
					</div>


				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
                            	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/appointment_to_see_the_room/get_obj?",
				url_add: "~/api/appointment_to_see_the_room/add?",
				url_set: "~/api/appointment_to_see_the_room/set?",
																		// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"booking_code": "",
							"house_title": "",
							"area": "",
							"house_type": "",
							"housing_rent": "",
							"housing_deposit": "",
							"price_description": "",
							"house_address": "",
							"landlord_user": 0,
							"tenant_user": 0,
							"user_name": "",
							"mobile_phone_number": "",
							"appointment_time": "",
							"appointment_remarks": "",
						"appointment_to_see_the_room_id": 0,
				},

				obj: {
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
							"appointment_time": new Date().getTime(),
							"appointment_remarks":  '', // 预约备注
						"examine_state": "未审核",
					"examine_reply": "",
					"appointment_to_see_the_room_id": 0,
				},

				// 表单字段
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
							"appointment_time": new Date().getTime(),
							"appointment_remarks":  '', // 预约备注
						"examine_state": "未审核",
					"examine_reply": "",
					"appointment_to_see_the_room_id": 0,
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
														
				// ID字段
				field: "appointment_to_see_the_room_id",

			}
		},
		methods: {
																																																																																																																																				formatDateValue(value) {
		  const date = new Date(value);
		  return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
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
					async get_user_session_tenant_user(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=租客用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["tenant_user"] = user_id
								_this.disabledObj['tenant_user' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "tenant_user") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
				
				
		  		get_user_info(name,id){
				var obj = null;
                  				  if (name == 'landlord_user'){
					  obj = this.list_user_landlord_user.getObj({"user_id":id});
				  }
    				  if (name == 'tenant_user'){
					  obj = this.list_user_tenant_user.getObj({"user_id":id});
				  }
          				var ret = "";
				if(obj){
				  ret = obj.nickname+"-"+obj.username;
				}
				return ret;
			},
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/appointment_to_see_the_room/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},
			
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file_multiple(files, str) {
				let _this = this;
				var form = new FormData();
				for (var i = 0; i < files.length; i++) {
					form.set("file", files[i]);
					_this.$post("~/api/appointment_to_see_the_room/upload?", form, (res) => {
						if (res.result) {
							if (_this.form[str].length > 0) {
								_this.form[str].push(res.result.url);
							} else {
								_this.form[str] = [res.result.url];
							}
						} else if (res.error) {
							_this.$toast(res.error.message);
						}
					});
				}
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
			  if(arr[i] === "source_table"){
			  	this.form['source_table'] = form[arr[i]]
			  }
			  if(arr[i] === "source_id"){
			  	this.form['source_id'] = form[arr[i]]
			  }
			  if(arr[i] === "source_user_id"){
			  	this.form['source_user_id'] = form[arr[i]]
			  }
            }
          }
        }
																																					        if (this.form["appointment_time"] && JSON.stringify(this.form["appointment_time"]).indexOf("-")===-1) {
          this.form["appointment_time"] = this.$toTime(parseInt(this.form["appointment_time"]), "yyyy-MM-ddThh:mm")
        }
						
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }

				if(func){
					func(json);
				}
			},

		},
		created() {
																																						this.get_list_user_landlord_user();
							this.get_user_session_tenant_user();
					this.get_list_user_tenant_user();
																				},
	}
</script>

<style>
	.diy_compute{
		line-height: 40px;
	}
	.diy_field.diy_img_multiple{
		margin: 0;
	}
	.diy_field.diy_img_multiple div{
		float: left;
		position: relative;
		margin: 0 10px 10px 0;
	}
	.diy_field.diy_img_multiple img{
		height: 100px;
		width: auto;
	}
	.diy_field.diy_img_multiple span{
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
