<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','contract_code') || $check_field('add','contract_code') || $check_field('set','contract_code')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="合同编码" prop="contract_code">
												<el-input id="contract_code" v-model="form['contract_code']" placeholder="请输入合同编码"
							  v-if="(form['lease_contract_id'] && $check_field('set','contract_code')) || (!form['lease_contract_id'] && $check_field('add','contract_code'))" :disabled="true">
				  					</el-input>
					<div v-else-if="$check_field('get','contract_code')">
						{{form['contract_code']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','booking_code') || $check_field('add','booking_code') || $check_field('set','booking_code')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预约编码" prop="booking_code">
												<el-input id="booking_code" v-model="form['booking_code']" placeholder="请输入预约编码"
							  v-if="(form['lease_contract_id'] && $check_field('set','booking_code')) || (!form['lease_contract_id'] && $check_field('add','booking_code'))" :disabled="disabledObj['booking_code_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','booking_code')">
						{{form['booking_code']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_title') || $check_field('add','house_title') || $check_field('set','house_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋标题" prop="house_title">
												<el-input id="house_title" v-model="form['house_title']" placeholder="请输入房屋标题"
							  v-if="(form['lease_contract_id'] && $check_field('set','house_title')) || (!form['lease_contract_id'] && $check_field('add','house_title'))" :disabled="disabledObj['house_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_title')">
						{{form['house_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','area') || $check_field('add','area') || $check_field('set','area')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="所在区域" prop="area">
												<el-input id="area" v-model="form['area']" placeholder="请输入所在区域"
							  v-if="(form['lease_contract_id'] && $check_field('set','area')) || (!form['lease_contract_id'] && $check_field('add','area'))" :disabled="disabledObj['area_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','area')">
						{{form['area']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_type') || $check_field('add','house_type') || $check_field('set','house_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋户型" prop="house_type">
												<el-input id="house_type" v-model="form['house_type']" placeholder="请输入房屋户型"
							  v-if="(form['lease_contract_id'] && $check_field('set','house_type')) || (!form['lease_contract_id'] && $check_field('add','house_type'))" :disabled="disabledObj['house_type_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_type')">
						{{form['house_type']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_rent') || $check_field('add','housing_rent') || $check_field('set','housing_rent')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋租金" prop="housing_rent">
												<el-input id="housing_rent" v-model="form['housing_rent']" placeholder="请输入房屋租金"
							  v-if="(form['lease_contract_id'] && $check_field('set','housing_rent')) || (!form['lease_contract_id'] && $check_field('add','housing_rent'))" :disabled="disabledObj['housing_rent_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','housing_rent')">
						{{form['housing_rent']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_deposit') || $check_field('add','housing_deposit') || $check_field('set','housing_deposit')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋押金" prop="housing_deposit">
												<el-input id="housing_deposit" v-model="form['housing_deposit']" placeholder="请输入房屋押金"
							  v-if="(form['lease_contract_id'] && $check_field('set','housing_deposit')) || (!form['lease_contract_id'] && $check_field('add','housing_deposit'))" :disabled="disabledObj['housing_deposit_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','housing_deposit')">
						{{form['housing_deposit']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房东用户" prop="landlord_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_landlord_user(form['landlord_user']) }}
							<el-select v-if="(form['lease_contract_id'] && $check_field('set','landlord_user')) || (!form['lease_contract_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
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
								<el-col v-if="$check_field('get','tenant_user') || $check_field('add','tenant_user') || $check_field('set','tenant_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租客用户" prop="tenant_user">
													<el-select v-if="(form['lease_contract_id'] && $check_field('set','tenant_user')) || (!form['lease_contract_id'] && $check_field('add','tenant_user'))" id="tenant_user" v-model="form['tenant_user']" :disabled="disabledObj['tenant_user_isDisabled']">
							<el-option v-for="o in list_user_tenant_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','tenant_user')" id="tenant_user" v-model="form['tenant_user']" :disabled="true">
							<el-option v-for="o in list_user_tenant_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','lease_months') || $check_field('add','lease_months') || $check_field('set','lease_months')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁月数" prop="lease_months">
								<el-input-number id="lease_months" v-model.number="form['lease_months']"
						v-if="(form['lease_contract_id'] && $check_field('set','lease_months')) || (!form['lease_contract_id'] && $check_field('add','lease_months'))" :disabled="disabledObj['lease_months_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','lease_months')">{{form['lease_months']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','total_amount') || $check_field('add','total_amount') || $check_field('set','total_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="合计金额" prop="total_amount">
												<el-input id="total_amount" v-model="form['total_amount']" placeholder="请输入合计金额"
							  v-if="(form['lease_contract_id'] && $check_field('set','total_amount')) || (!form['lease_contract_id'] && $check_field('add','total_amount'))"  @focus="set_total_amount()" :disabled="disabledObj['total_amount_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','total_amount')">
						{{form['total_amount']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','contract_name') || $check_field('add','contract_name') || $check_field('set','contract_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="合同名称" prop="contract_name">
												<el-input id="contract_name" v-model="form['contract_name']" placeholder="请输入合同名称"
							  v-if="(form['lease_contract_id'] && $check_field('set','contract_name')) || (!form['lease_contract_id'] && $check_field('add','contract_name'))" :disabled="disabledObj['contract_name_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','contract_name')">
						{{form['contract_name']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','signing_time') || $check_field('add','signing_time') || $check_field('set','signing_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="签订时间" prop="signing_time">
								<el-date-picker :disabled="disabledObj['signing_time_isDisabled']" v-if="(form['lease_contract_id'] && $check_field('set','signing_time')) || (!form['lease_contract_id'] && $check_field('add','signing_time'))" id="signing_time"
						v-model="form['signing_time']" type="date" placeholder="选择日期" value-format="yyyy-MM-dd">
					</el-date-picker>
					<div v-else-if="$check_field('get','signing_time')">{{form['signing_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','contract_documents') || $check_field('add','contract_documents') || $check_field('set','contract_documents')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="合同文件" prop="contract_documents">
												<div v-if="disabledObj['contract_documents_isDisabled']">
						<div v-if="$check_field('get','contract_documents')">
							<el-button type="primary" @click="$download($fullUrl(form['contract_documents']),form['contract_documents'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="(form['lease_contract_id'] && $check_field('set','contract_documents')) || (!form['lease_contract_id'] && $check_field('add','contract_documents'))" class="upload-demo" :file-list="contract_documents_FileList" :on-preview="openPreview" :on-remove="contract_documentsRemove" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_contract_documents" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','contract_documents')">
							<el-button type="primary" @click="$download($fullUrl(form['contract_documents']),form['contract_documents'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','terms_of_lease') || $check_field('add','terms_of_lease') || $check_field('set','terms_of_lease')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁条款" prop="terms_of_lease">
								<el-input type="textarea" id="terms_of_lease" v-model="form['terms_of_lease']" placeholder="请输入租赁条款"
						v-if="(form['lease_contract_id'] && $check_field('set','terms_of_lease')) || (!form['lease_contract_id'] && $check_field('add','terms_of_lease'))" :disabled="disabledObj['terms_of_lease_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','terms_of_lease')">{{form['terms_of_lease']}}</div>
							</el-form-item>
			</el-col>
						
	
	
		
		
						<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="维修申请限次">
				<el-input id="limit_times" v-model="form['maintenance_records_limit_times']" placeholder="维修申请限制次数，0为不限"
						  v-if="$check_option('/lease_contract/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/lease_contract/view','get')" v-html="form['maintenance_records_limit_times']"></div>
			  </el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="在线投诉限次">
				<el-input id="limit_times" v-model="form['complaint_records_limit_times']" placeholder="在线投诉限制次数，0为不限"
						  v-if="$check_option('/lease_contract/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/lease_contract/view','get')" v-html="form['complaint_records_limit_times']"></div>
			  </el-form-item>
			</el-col>
			
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/lease_contract/view','set') || $check_action('/lease_contract/view','add')">
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
				field: "lease_contract_id",
				url_add: "~/api/lease_contract/add?",
				url_set: "~/api/lease_contract/set?",
				url_get_obj: "~/api/lease_contract/get_obj?",
				url_upload: "~/api/lease_contract/upload?",

				query: {
					"lease_contract_id": 0,
				},

				form: {
								"contract_code": this.$get_stamp(), // 合同编码
										"booking_code":  '', // 预约编码
										"house_title":  '', // 房屋标题
										"area":  '', // 所在区域
										"house_type":  '', // 房屋户型
										"housing_rent":  '', // 房屋租金
										"housing_deposit":  '', // 房屋押金
										"landlord_user": 0, // 房东用户
										"tenant_user": 0, // 租客用户
										"lease_months":  0, // 租赁月数
										"total_amount":  '', // 合计金额
										"contract_name":  '', // 合同名称
										"signing_time":  '', // 签订时间
										"contract_documents":  '', // 合同文件
										"terms_of_lease":  '', // 租赁条款
											"lease_contract_id": 0, // ID
													"maintenance_records_limit_times": 0, // 维修申请限制次数
							"complaint_records_limit_times": 0, // 在线投诉限制次数
										},
				disabledObj:{
								"contract_code_isDisabled": false,
										"booking_code_isDisabled": false,
										"house_title_isDisabled": false,
										"area_isDisabled": false,
										"house_type_isDisabled": false,
										"housing_rent_isDisabled": false,
										"housing_deposit_isDisabled": false,
										"landlord_user_isDisabled": false,
										"tenant_user_isDisabled": false,
					          			"lease_months_isDisabled": false,
										"total_amount_isDisabled": false,
										"contract_name_isDisabled": false,
										"signing_time_isDisabled": false,
										"contract_documents_isDisabled": false,
										"terms_of_lease_isDisabled": false,
										},

																																																	// 用户列表
				list_user_landlord_user: [],
						// 用户组
				group_user_landlord_user: "",
													// 用户列表
				list_user_tenant_user: [],
																																				contract_documents_FileList: [],
											
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
							this.form["landlord_user"] = this.$store.state.user.user_id;
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
				
	
				
	
										set_total_amount(){
				this.form.total_amount = parseFloat(this.form.housing_rent) * parseFloat(this.form.lease_months) + parseFloat(this.form.housing_deposit)
			},
							// 自动计算精度处理
		toFixed: function(num){
			if (!isNaN(num)) {
				return ((num + '').indexOf('.') == -1) ? num : num.toFixed(2);
			}
		},
			
	
				
	
						/**
			 * 上传合同文件
			 * @param {Object} param 文件参数
			 */
			upload_contract_documents(param){
									this.uploadFile(param.file, "contract_documents");
								},
					contract_documentsRemove() {
			  this.contract_documents_FileList = []
			  this.form.contract_documents = ""
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
																										        if (this.form["signing_time"] && JSON.stringify(this.form["signing_time"]).indexOf("-")===-1){
          this.form["signing_time"] = this.$toTime(parseInt(this.form["signing_time"]),"yyyy-MM-dd")
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

																																																																																										if(json.result.obj["signing_time"]=="0000-00-00"){
				  json.result.obj["signing_time"] = null;
				}
				if(parseInt(json.result.obj["signing_time"]) > 9999){
					json.result.obj["signing_time"] = this.$toTime(parseInt(json.result.obj["signing_time"]),"yyyy-MM-dd")
				}
														this.contract_documents_FileList = []
				if (json.result.obj["contract_documents"]) {
				    this.contract_documents_FileList = [
				        {
				            url: this.$fullUrl(json.result.obj['contract_documents']),
				            name: json.result.obj['contract_documents'],
				        },
				    ];
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
																																																																																																																																															if (!param.signing_time){
					return "签订时间不能为空";
				}
																																						return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/lease_contract/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_contract/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_contract/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_contract/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_contract/view','get');
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
								this.get_list_user_tenant_user();
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
