<template>
	<el-main class="bg table_wrap comtabel_t">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row class="rows row1">



							<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="预约编码">
									<el-input v-model="query.booking_code"></el-input>
								</el-form-item>
				</el-col>
									<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="房屋标题">
									<el-input v-model="query.house_title"></el-input>
								</el-form-item>
				</el-col>
																																	<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="用户姓名">
									<el-input v-model="query.user_name"></el-input>
								</el-form-item>
				</el-col>
												<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="预约时间">
									<el-date-picker v-model="query.appointment_time" type="datetimerange" range-separator="至" start-placeholder="开始时间" end-placeholder="结束时间"></el-date-picker>
								</el-form-item>
				</el-col>
										<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="审核状态">
						<el-select v-model="query.examine_state">
							<el-option value="">全部</el-option>
							<el-option value="未审核">未审核</el-option>
							<el-option value="已通过">已通过</el-option>
							<el-option value="未通过">未通过</el-option>
						</el-select>
					</el-form-item>
				</el-col>
	</el-row>
	<el-row class="rows row2">

		<el-col :xs="24" :sm="24" :lg="24" class="search_btn_wrap search_btns">

				<el-col :xs="24" :sm="10" :lg="8" class="search_btn_1 search_btn_wrap_1 btns">

										<el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
						<el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
																		

										<el-button @click="batchInfo()" class="examine_btn_state">批量审核</el-button>
										<el-button v-if="$check_action('/appointment_to_see_the_room/table','del') || $check_action('/appointment_to_see_the_room/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
								
				</el-col>
		</el-col>
	</el-row >

		</el-form>
				<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
					<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
				<el-table-column prop="booking_code" @sort-change="$sortChange" label="预约编码" 				v-if="$check_field('get','booking_code')" min-width="200">
					</el-table-column>
					<el-table-column prop="house_title" @sort-change="$sortChange" label="房屋标题" 				v-if="$check_field('get','house_title')" min-width="200">
					</el-table-column>
					<el-table-column prop="area" @sort-change="$sortChange" label="所在区域" 				v-if="$check_field('get','area')" min-width="200">
					</el-table-column>
					<el-table-column prop="house_type" @sort-change="$sortChange" label="房屋户型" 				v-if="$check_field('get','house_type')" min-width="200">
					</el-table-column>
					<el-table-column prop="housing_rent" @sort-change="$sortChange" label="房屋租金" 				v-if="$check_field('get','housing_rent')" min-width="200">
					</el-table-column>
					<el-table-column prop="housing_deposit" @sort-change="$sortChange" label="房屋押金" 				v-if="$check_field('get','housing_deposit')" min-width="200">
					</el-table-column>
					<el-table-column prop="price_description" @sort-change="$sortChange" label="价格说明" 				v-if="$check_field('get','price_description')" min-width="200">
					</el-table-column>
					<el-table-column prop="house_address" @sort-change="$sortChange" label="房屋地址" 				v-if="$check_field('get','house_address')" min-width="200">
					</el-table-column>
					<el-table-column prop="landlord_user" @sort-change="$sortChange" label="房东用户" 				v-if="$check_field('get','landlord_user')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_landlord_user(scope.row['landlord_user']) }}
				</template>
					</el-table-column>
					<el-table-column prop="tenant_user" @sort-change="$sortChange" label="租客用户" 				v-if="$check_field('get','tenant_user')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_tenant_user(scope.row['tenant_user']) }}
				</template>
					</el-table-column>
					<el-table-column prop="user_name" @sort-change="$sortChange" label="用户姓名" 				v-if="$check_field('get','user_name')" min-width="200">
					</el-table-column>
					<el-table-column prop="mobile_phone_number" @sort-change="$sortChange" label="手机号码" 				v-if="$check_field('get','mobile_phone_number')" min-width="200">
					</el-table-column>
					<el-table-column prop="appointment_time" @sort-change="$sortChange" label="预约时间" 				v-if="$check_field('get','appointment_time')" min-width="200">
						<template slot-scope="scope">
					{{ $toTime(scope.row["appointment_time"],"yyyy-MM-dd hh:mm:ss") }}
				</template>
					</el-table-column>
					<el-table-column prop="appointment_remarks" @sort-change="$sortChange" label="预约备注" 				v-if="$check_field('get','appointment_remarks')" min-width="200">
					</el-table-column>
				<el-table-column label="审核状态" prop="examine_state" min-width="100">
			</el-table-column>

			<el-table-column label="审核回复" prop="examine_reply" min-width="200">
			</el-table-column>


            <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
            </el-table-column>

			<el-table-column sortable prop="update_time" label="更新时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
			</el-table-column>







			<el-table-column fixed="right" label="操作" min-width="200" v-if="$check_action('/appointment_to_see_the_room/table','set') || $check_action('/appointment_to_see_the_room/view','set') || $check_action('/appointment_to_see_the_room/view','get') 
						|| $check_action('/lease_contract/table','add') || $check_action('/lease_contract/view','add') 
						" >


				<template slot-scope="scope">
					<div class="view_a">
					<router-link class="e-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="$check_action('/appointment_to_see_the_room/table','set') || $check_action('/appointment_to_see_the_room/view','set') || $check_action('/appointment_to_see_the_room/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
						<!--跨表按钮-->
										<el-button class="e-button el-button--small is-plain el-button--primary" style="margin: 5px !important;" size="small" @click="to_table(scope.row,'/lease_contract/view')" v-if="($check_action('/lease_contract/table','add') || $check_action('/lease_contract/view','add')) && scope.row['examine_state'] == '已通过' && !scope.row['lease_contract_limit']">
						<span>租赁合同</span>
					</el-button>
											<el-button class="e-button el-button--small is-plain el-button--primary" style="margin: 5px !important;" size="small" @click="changeSigning(scope.row, scope.$index)" v-if="$check_option('/appointment_to_see_the_room/table', 'examine')">
						<span>审核</span>
					</el-button>
				</div>
				</template>
			</el-table-column>

		</el-table>

		<!-- 分页器 -->
		<div class="mt text_center">
			<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
				:current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
				layout="total, sizes, prev, pager, next, jumper" :total="count">
			</el-pagination>
		</div>
		<!-- /分页器 -->
		<el-dialog title="审核" :visible.sync="dialogVisible" width="30%" :show-close="true" :before-close="handleClose">
			<el-form ref="verifyForm" :rules="rules" :model="verifyItem">
				<el-form-item label="审核状态" prop="radio">
					<el-radio-group v-model="verifyItem.examine_state">
						<el-radio label="已通过" value="已通过"></el-radio>
						<el-radio label="未通过" value="已通过"></el-radio>
					</el-radio-group>
				</el-form-item>
								<el-form-item label="审核回复" prop="reply">
					<el-input type="textarea" placeholder="请填写审核回复" v-model="verifyItem.examine_reply"></el-input>
				</el-form-item>
							</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button @click="dialogVisible = false">取 消</el-button>
				<el-button type="primary" @click="assureVerify">确 定</el-button>
			</span>
		</el-dialog>
														
		<div class="modal_wrap" v-if="showModal">
			<div class="modal_box">
				<!-- <div class="modal_box_close" @click="closeModal">X</div> -->
				<p class="modal_box_title">重要提醒</p>
				<p class="modal_box_text">当前有数据达到预警值！</p>
				<p class="modal_box_text">{{ message }}</p>
				<div class="btn_box">
					<span @click="closeModal">取消</span>
					<span @click="closeModal">确定</span>
				</div>
			</div>
		</div>


	</el-main>
</template>
<script>
	import mixin from "@/mixins/page.js";
  	    	                    	      	    
	export default {
		mixins: [mixin],
		data() {
			return {
																														// 弹框
				showModal: false,
				// 获取数据地址
				url_get_list: "~/api/appointment_to_see_the_room/get_list?like=0",
				url_del: "~/api/appointment_to_see_the_room/del?",

				// 字段ID
				field: "appointment_to_see_the_room_id",
				dialogVisible: false,
				verifyIdx: 0,
				verifyItem: {},
				rules: {
				  "examine_state": [
				    { required: true, message: '请选择审核状态', trigger: 'change' },
				  ],
				},

				// 查询
				query: {
					"size": 7,
					"page": 1,
								"booking_code": "",
											"house_title": "",
																			"user_name": "",
												"appointment_time": "",
									"examine_state":"",
					"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},

				// 数据
				list: [],
				batchAllState: false,
				batchAllList: [],
																																						// 用户列表
				list_user_landlord_user: [],
									// 用户列表
				list_user_tenant_user: [],
													message: '',
			}
		},
		methods: {
																													// 关闭弹框
			closeModal(){
				this.showModal = false;
				},
			// 审核弹窗
			changeSigning(query, index) {
			  let beforeQuery=JSON.parse(JSON.stringify(query));
			  this.verifyIdx = index;
			  this.verifyItem = beforeQuery;
			  this.batchAllState = false;
			  this.batchAllList = [];
			  this.dialogVisible = true;
			},
			batchAll(list) {
				this.batchAllState = true;
				this.batchAllList = list;
				this.dialogVisible = true;
			},
			assureVerify() {
				//审核
				let _this = this;
				let examineForm = this.$refs["verifyForm"];
				examineForm.validate(async (valid) => {
					if (valid) {
						let apiState = true;
						if (this.batchAllState) {
							for (var i = 0; i < this.batchAllList.length; i++) {
								let url = "~/api/appointment_to_see_the_room/set?appointment_to_see_the_room_id=" +  this.batchAllList[i]["appointment_to_see_the_room_id"];
								let json = await _this.$post(url,{
									examine_state: _this.verifyItem.examine_state,
																		'examine_reply': _this.verifyItem.examine_reply
																	  }
								)
								if (json.error) {
									apiState = false;
									_this.$toast(json.error.message, "danger");
									break;
								}
							}
							if (apiState) {
							  _this.$toast("审核成功！", "success");
							  _this.dialogVisible = false;
							  _this.get_list();
							}
						}else{
							var url = "~/api/appointment_to_see_the_room/set?appointment_to_see_the_room_id=" + this.verifyItem['appointment_to_see_the_room_id']
							_this.$post(url, {
								'examine_state': _this.verifyItem.examine_state,
																'examine_reply': _this.verifyItem.examine_reply
															}, (json, status) => {
								if (json.result) {
									_this.$toast('审核成功！', 'success');
									_this.dialogVisible = false;
									_this.get_list();
								} else if (json.error) {
									_this.$toast(json.error.message, 'danger');
								}
							})
						}
						
					}
				})
			},
			/**
			 * @description 获取到列表事件
			 * @param {Object} res 响应结果
			 */
			get_list_after: function get_list_after(res, func, url) {
				let _this = this
													_this.list.map((item) => {
					let param = {
						source_table: "appointment_to_see_the_room",
						source_id: item.appointment_to_see_the_room_id,
						source_user_id: _this.user.user_id
					};
					if(item.lease_contract_limit_times > 0){
						_this.$get("~/api/lease_contract/count?",param,(result)=>{
							if(result){
								if(result.result >= item.lease_contract_limit_times){
									_this.$set(item,'lease_contract_limit',true);
								}else{
									_this.$set(item,'lease_contract_limit',false);
								}
							}
						})
					}else{
						_this.$set(item,'lease_contract_limit',false);
					}
					Object.assign(item, param)
				})
																																																																																				},
			get_list_before(param){
				var user_group = this.user.user_group;
				if(user_group != "管理员"){
						let sqlwhere = "(";
																																																		if(user_group=="房东用户"){
						sqlwhere+= "landlord_user = " + this.user.user_id + " or ";
					}
													if(user_group=="租客用户"){
						sqlwhere+= "tenant_user = " + this.user.user_id + " or ";
					}
																														if (sqlwhere.length>1){
						sqlwhere = sqlwhere.substr(0,sqlwhere.length-4);
						sqlwhere += ")";
						param["sqlwhere"] = sqlwhere;
					}
					}
				return param;
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
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
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
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
												},
				created() {
																							this.get_list_user_landlord_user();
								this.get_list_user_tenant_user();
											}
	}
</script>

<style type="text/css">
	.bg {
		background: white;
	}

	.form.p_4 {
		padding: 1rem;
	}

	.form .el-input {
		width: initial;
	}

	.mt {
		margin-top: 1rem;
	}

	.text_center {
		text-align: center;
	}

	.float-right {
		float: right;
	}


	.modal_wrap{
		width: 100vw;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999999999;
	}
	.modal_wrap .modal_box{
		width: 400px;
		height: auto;
		background: url("../../assets/modal_bg.jpg") no-repeat center;
		background-size: cover;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -200px;
		margin-top: -100px;
		border-radius: 10px;
		padding: 10px;
		}
	.modal_wrap .modal_box .modal_box_close{
		font-size: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
		}
	.modal_wrap .modal_box .modal_box_title{
	  text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
		}
	.modal_wrap .modal_box .modal_box_text{
		text-align: center;
		font-size: 14px;
		color: #fff;
		margin: 5px auto;
		width: 90%;
		}
	.modal_wrap .modal_box .btn_box{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-top: 42px;
		margin-bottom: 20px;
		}
			.modal_wrap .modal_box .btn_box span{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				border: 1px solid #ccc;
				font-size: 14px;
				cursor: pointer;
				color: #fff;
			}
	.modal_wrap .modal_box .btn_box span:nth-child(2){
		background: #409EFF;
		color: #fff;
		border-color: #409EFF;
		margin-left: 15px;
	}
	.el-date-editor .el-range-separator{
		width: 10% !important;
	}
	.num_range {
	  display: flex;
	  align-items: center;
	}
	
	.num_range_span {
	  font-size: 28px;
	}
</style>
