<template>
	<el-main class="bg table_wrap comtabel_t">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row class="rows row1">



							<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="房屋标题">
									<el-input v-model="query.house_title"></el-input>
								</el-form-item>
				</el-col>
									<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="所在区域">
									<el-select v-model="query.area">
											<el-option v-for="o in list_area" :key="o.area_type" :label="o.area_type"
								:value="o.area_type">
							</el-option>
										</el-select>
								</el-form-item>
				</el-col>
									<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="房屋户型">
									<el-select v-model="query.house_type">
											<el-option v-for="o in list_house_type" :key="o.type_of_house_type" :label="o.type_of_house_type"
								:value="o.type_of_house_type">
							</el-option>
										</el-select>
								</el-form-item>
				</el-col>
															<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="房屋状态">
									<el-select v-model="query.house_status">
				                            <el-option v-for="o in list_house_status" :key="o" :label="o"
                            	:value="o">
                            </el-option>
										</el-select>
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
										<el-button v-if="$check_action('/housing_information/table','del') || $check_action('/housing_information/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
								
				</el-col>
		</el-col>
	</el-row >

		</el-form>
				<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
					<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
				<el-table-column prop="house_title" @sort-change="$sortChange" label="房屋标题" 				v-if="$check_field('get','house_title')" min-width="200">
					</el-table-column>
					<el-table-column prop="area" @sort-change="$sortChange" label="所在区域" 				v-if="$check_field('get','area')" min-width="200">
					</el-table-column>
					<el-table-column prop="house_type" @sort-change="$sortChange" label="房屋户型" 				v-if="$check_field('get','house_type')" min-width="200">
					</el-table-column>
					<el-table-column prop="house_picture" @sort-change="$sortChange" label="房屋图片" 				v-if="$check_field('get','house_picture')" min-width="200">
						<template slot-scope="scope">
					<el-image style="width: 100px; height: 100px" :src="$fullUrl(scope.row['house_picture'])"
						:preview-src-list="[$fullUrl(scope.row['house_picture'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</template>
					</el-table-column>
					<el-table-column prop="house_video" @sort-change="$sortChange" label="房屋视频" 				v-if="$check_field('get','house_video')" min-width="200">
						<template slot-scope="scope">
					<a href="javascript:void(0)" @click="house_videoVideoPlay($fullUrl(scope.row['house_video']))" >点此播放</a>
				</template>
					</el-table-column>
					<el-table-column prop="house_status" @sort-change="$sortChange" label="房屋状态" 				v-if="$check_field('get','house_status')" min-width="200">
					</el-table-column>
					<el-table-column prop="building_area" @sort-change="$sortChange" label="建筑面积" 				v-if="$check_field('get','building_area')" min-width="200">
					</el-table-column>
					<el-table-column prop="housing_rent" @sort-change="$sortChange" label="房屋租金" 				v-if="$check_field('get','housing_rent')" min-width="200">
					</el-table-column>
					<el-table-column prop="housing_deposit" @sort-change="$sortChange" label="房屋押金" 				v-if="$check_field('get','housing_deposit')" min-width="200">
					</el-table-column>
					<el-table-column prop="price_description" @sort-change="$sortChange" label="价格说明" 				v-if="$check_field('get','price_description')" min-width="200">
					</el-table-column>
					<el-table-column prop="house_address" @sort-change="$sortChange" label="房屋地址" 				v-if="$check_field('get','house_address')" min-width="200">
					</el-table-column>
					<el-table-column prop="number_of_houses" @sort-change="$sortChange" label="房屋数量" 				v-if="$check_field('get','number_of_houses')" min-width="200">
					</el-table-column>
					<el-table-column prop="landlord_user" @sort-change="$sortChange" label="房东用户" 				v-if="$check_field('get','landlord_user')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_landlord_user(scope.row['landlord_user']) }}
				</template>
					</el-table-column>
					<el-table-column prop="name_of_landlord" @sort-change="$sortChange" label="房东姓名" 				v-if="$check_field('get','name_of_landlord')" min-width="200">
					</el-table-column>
					<el-table-column prop="supporting_facilities" @sort-change="$sortChange" label="配套设施" 				v-if="$check_field('get','supporting_facilities')" min-width="200">
					</el-table-column>
					<el-table-column prop="surrounding_environment" @sort-change="$sortChange" label="周边环境" 				v-if="$check_field('get','surrounding_environment')" min-width="200">
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







			<el-table-column fixed="right" label="操作" min-width="200" v-if="$check_action('/housing_information/table','set') || $check_action('/housing_information/view','set') || $check_action('/housing_information/view','get') 
						|| $check_action('/appointment_to_see_the_room/table','add') || $check_action('/appointment_to_see_the_room/view','add') 
						|| $check_action('/financial_statements/table','add') || $check_action('/financial_statements/view','add') 
						" >


				<template slot-scope="scope">
					<div class="view_a">
					<router-link class="e-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="$check_action('/housing_information/table','set') || $check_action('/housing_information/view','set') || $check_action('/housing_information/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
						<!--跨表按钮-->
										<el-button class="e-button el-button--small is-plain el-button--primary" style="margin: 5px !important;" size="small" @click="to_table(scope.row,'/appointment_to_see_the_room/view')" v-if="($check_action('/appointment_to_see_the_room/table','add') || $check_action('/appointment_to_see_the_room/view','add')) && scope.row['examine_state'] == '已通过' && !scope.row['appointment_to_see_the_room_limit']">
						<span>在线预约</span>
					</el-button>
													<el-button class="e-button el-button--small is-plain el-button--primary" style="margin: 5px !important;" size="small" @click="to_table(scope.row,'/financial_statements/view')" v-if="($check_action('/financial_statements/table','add') || $check_action('/financial_statements/view','add')) && scope.row['examine_state'] == '已通过' && !scope.row['financial_statements_limit']">
						<span>财务报表</span>
					</el-button>
												<router-link v-if="$check_comment('/housing_information/table')" class="e-button el-button--small is-plain el-button--primary"
								  :to="'../comment/table?size=10&page=1&source_table=housing_information&source_field=' + field + '&source_id=' + scope.row[field]" size="small">
						<span>查看评论</span>
					</router-link>
						<el-button class="e-button el-button--small is-plain el-button--primary" style="margin: 5px !important;" size="small" @click="changeSigning(scope.row, scope.$index)" v-if="$check_option('/housing_information/table', 'examine')">
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
								<el-dialog
					title="视频详情"
					:visible.sync="house_videoPlayerModalVisible"
					width="30%"
			>
				<video id="house_videoPlayer" :src="house_videoVideoUrl" autoplay="autoplay" width="100%" controls>
					您的浏览器不支持Video标签。
				</video>
				<span slot="footer" class="dialog-footer">
				<el-button @click="house_videoCancelModalVisible">取 消</el-button>
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
				url_get_list: "~/api/housing_information/get_list?like=0",
				url_del: "~/api/housing_information/del?",

				// 字段ID
				field: "housing_information_id",
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
								"house_title": "",
											"area": "",
											"house_type": "",
													"house_status": "",
																			"examine_state":"",
					"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},

				// 数据
				list: [],
				batchAllState: false,
				batchAllList: [],
									house_videoPlayerModalVisible:false,
				house_videoVideoUrl:"",
																				// 所在区域列表
				list_area: [""],
							// 房屋户型列表
				list_house_type: [""],
											// 房屋状态列表
				list_house_status: ['空闲中','租赁中','清洁中','维修中'],
																						// 用户列表
				list_user_landlord_user: [],
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
								let url = "~/api/housing_information/set?housing_information_id=" +  this.batchAllList[i]["housing_information_id"];
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
							var url = "~/api/housing_information/set?housing_information_id=" + this.verifyItem['housing_information_id']
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
						source_table: "housing_information",
						source_id: item.housing_information_id,
						source_user_id: _this.user.user_id
					};
					if(item.appointment_to_see_the_room_limit_times > 0){
						_this.$get("~/api/appointment_to_see_the_room/count?",param,(result)=>{
							if(result){
								if(result.result >= item.appointment_to_see_the_room_limit_times){
									_this.$set(item,'appointment_to_see_the_room_limit',true);
								}else{
									_this.$set(item,'appointment_to_see_the_room_limit',false);
								}
							}
						})
					}else{
						_this.$set(item,'appointment_to_see_the_room_limit',false);
					}
					Object.assign(item, param)
				})
								_this.list.map((item) => {
					let param = {
						source_table: "housing_information",
						source_id: item.housing_information_id,
						source_user_id: _this.user.user_id
					};
					if(item.financial_statements_limit_times > 0){
						_this.$get("~/api/financial_statements/count?",param,(result)=>{
							if(result){
								if(result.result >= item.financial_statements_limit_times){
									_this.$set(item,'financial_statements_limit',true);
								}else{
									_this.$set(item,'financial_statements_limit',false);
								}
							}
						})
					}else{
						_this.$set(item,'financial_statements_limit',false);
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
																														if (sqlwhere.length>1){
						sqlwhere = sqlwhere.substr(0,sqlwhere.length-4);
						sqlwhere += ")";
						param["sqlwhere"] = sqlwhere;
					}
					}
				return param;
			},

						/**
			 * 获取所在区域列表
			 */
			async get_list_area() {
				var json = await this.$get("~/api/regional_classification/get_list?");
				if(json.result){
					this.list_area = json.result.list;
				}else if (json.error){
					console.log(json.error);
				}
			},
						/**
			 * 获取房屋户型列表
			 */
			async get_list_house_type() {
				var json = await this.$get("~/api/huxing_classification/get_list?");
				if(json.result){
					this.list_house_type = json.result.list;
				}else if (json.error){
					console.log(json.error);
				}
			},
																														



													house_videoVideoPlay(v) {
				this.house_videoVideoUrl = v
				this.house_videoPlayerModalVisible = true
			},

			house_videoCancelModalVisible(){
				this.house_videoVideoUrl = ""
				this.house_videoPlayerModalVisible = false
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
												},
				created() {
						// 初始化所在区域列表
			this.get_list_area();
						// 初始化房屋户型列表
			this.get_list_house_type();
																											this.get_list_user_landlord_user();
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
