<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','house_title') || $check_field('add','house_title') || $check_field('set','house_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋标题" prop="house_title">
												<el-input id="house_title" v-model="form['house_title']" placeholder="请输入房屋标题"
							  v-if="(form['housing_information_id'] && $check_field('set','house_title')) || (!form['housing_information_id'] && $check_field('add','house_title'))" :disabled="disabledObj['house_title_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_title')">
						{{form['house_title']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','area') || $check_field('add','area') || $check_field('set','area')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="所在区域" prop="area">
								<el-select id="area" v-model="form['area']" filterable 						v-if="(form['housing_information_id'] && $check_field('set','area')) || (!form['housing_information_id'] && $check_field('add','area'))">
						<el-option v-for="o in list_area" :key="o['area_type']" :label="o['area_type']"
							:value="o['area_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','area')">{{form['area']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_type') || $check_field('add','house_type') || $check_field('set','house_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋户型" prop="house_type">
								<el-select id="house_type" v-model="form['house_type']" filterable 						v-if="(form['housing_information_id'] && $check_field('set','house_type')) || (!form['housing_information_id'] && $check_field('add','house_type'))">
						<el-option v-for="o in list_house_type" :key="o['type_of_house_type']" :label="o['type_of_house_type']"
							:value="o['type_of_house_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','house_type')">{{form['house_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_picture') || $check_field('add','house_picture') || $check_field('set','house_picture')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋图片" prop="house_picture">
								<el-upload :disabled="disabledObj['house_picture_isDisabled']" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_house_picture"
						:show-file-list="false" v-if="(form['housing_information_id'] && $check_field('set','house_picture')) || (!form['housing_information_id'] && $check_field('add','house_picture'))">
						<img id="house_picture" v-if="form['house_picture']" :src="$fullUrl(form['house_picture'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','house_picture')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['house_picture'])" :preview-src-list="[$fullUrl(form['house_picture'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_video') || $check_field('add','house_video') || $check_field('set','house_video')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋视频" prop="house_video">
												<el-upload v-if="(form['housing_information_id'] && $check_field('set','house_video')) || (!form['housing_information_id'] && $check_field('add','house_video'))" class="upload-demo" :file-list="house_video_FileList" :on-preview="openPreview" :on-remove="house_videoRemove" drag
						action="" style="max-width: 300px;width: 100%;" :http-request="upload_house_video" :limit="1" accept="video/ogg,video/mp4,video/webm">
						<i class="el-icon-upload"></i>
						<div class="el-upload__text">将视频拖到此处，或<em>点击上传</em></div>
					</el-upload>
					<div v-else-if="$check_field('get','house_video')">
						<el-button type="primary" @click="$download($fullUrl(form['house_video']),form['house_video'])">下载<i
								class="el-icon-download el-icon--right"></i></el-button>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_status') || $check_field('add','house_status') || $check_field('set','house_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋状态" prop="house_status">
								<el-select id="house_status" v-model="form['house_status']"
						v-if="(form['housing_information_id'] && $check_field('set','house_status')) || (!form['housing_information_id'] && $check_field('add','house_status'))">
						<el-option v-for="o in list_house_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','house_status')">{{form['house_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','building_area') || $check_field('add','building_area') || $check_field('set','building_area')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="建筑面积" prop="building_area">
												<el-input id="building_area" v-model="form['building_area']" placeholder="请输入建筑面积"
							  v-if="(form['housing_information_id'] && $check_field('set','building_area')) || (!form['housing_information_id'] && $check_field('add','building_area'))" :disabled="disabledObj['building_area_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','building_area')">
						{{form['building_area']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_rent') || $check_field('add','housing_rent') || $check_field('set','housing_rent')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋租金" prop="housing_rent">
								<el-input-number id="housing_rent" v-model.number="form['housing_rent']"
						v-if="(form['housing_information_id'] && $check_field('set','housing_rent')) || (!form['housing_information_id'] && $check_field('add','housing_rent'))" :disabled="disabledObj['housing_rent_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','housing_rent')">{{form['housing_rent']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','housing_deposit') || $check_field('add','housing_deposit') || $check_field('set','housing_deposit')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋押金" prop="housing_deposit">
												<el-input id="housing_deposit" v-model="form['housing_deposit']" placeholder="请输入房屋押金"
							  v-if="(form['housing_information_id'] && $check_field('set','housing_deposit')) || (!form['housing_information_id'] && $check_field('add','housing_deposit'))" :disabled="disabledObj['housing_deposit_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','housing_deposit')">
						{{form['housing_deposit']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','price_description') || $check_field('add','price_description') || $check_field('set','price_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="价格说明" prop="price_description">
												<el-input id="price_description" v-model="form['price_description']" placeholder="请输入价格说明"
							  v-if="(form['housing_information_id'] && $check_field('set','price_description')) || (!form['housing_information_id'] && $check_field('add','price_description'))" :disabled="disabledObj['price_description_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','price_description')">
						{{form['price_description']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_address') || $check_field('add','house_address') || $check_field('set','house_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋地址" prop="house_address">
												<el-input id="house_address" v-model="form['house_address']" placeholder="请输入房屋地址"
							  v-if="(form['housing_information_id'] && $check_field('set','house_address')) || (!form['housing_information_id'] && $check_field('add','house_address'))" :disabled="disabledObj['house_address_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','house_address')">
						{{form['house_address']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','number_of_houses') || $check_field('add','number_of_houses') || $check_field('set','number_of_houses')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房屋数量" prop="number_of_houses">
								<el-select id="number_of_houses" v-model="form['number_of_houses']"
						v-if="(form['housing_information_id'] && $check_field('set','number_of_houses')) || (!form['housing_information_id'] && $check_field('add','number_of_houses'))">
						<el-option v-for="o in list_number_of_houses" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','number_of_houses')">{{form['number_of_houses']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房东用户" prop="landlord_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_landlord_user(form['landlord_user']) }}
							<el-select v-if="(form['housing_information_id'] && $check_field('set','landlord_user')) || (!form['housing_information_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
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
								<el-col v-if="$check_field('get','name_of_landlord') || $check_field('add','name_of_landlord') || $check_field('set','name_of_landlord')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房东姓名" prop="name_of_landlord">
												<el-input id="name_of_landlord" v-model="form['name_of_landlord']" placeholder="请输入房东姓名"
							  v-if="(form['housing_information_id'] && $check_field('set','name_of_landlord')) || (!form['housing_information_id'] && $check_field('add','name_of_landlord'))" :disabled="disabledObj['name_of_landlord_isDisabled']">
				  					</el-input>
					<div v-else-if="$check_field('get','name_of_landlord')">
						{{form['name_of_landlord']}}
				  					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','supporting_facilities') || $check_field('add','supporting_facilities') || $check_field('set','supporting_facilities')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="配套设施" prop="supporting_facilities">
								<el-input type="textarea" id="supporting_facilities" v-model="form['supporting_facilities']" placeholder="请输入配套设施"
						v-if="(form['housing_information_id'] && $check_field('set','supporting_facilities')) || (!form['housing_information_id'] && $check_field('add','supporting_facilities'))" :disabled="disabledObj['supporting_facilities_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','supporting_facilities')">{{form['supporting_facilities']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','surrounding_environment') || $check_field('add','surrounding_environment') || $check_field('set','surrounding_environment')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="周边环境" prop="surrounding_environment">
								<el-input type="textarea" id="surrounding_environment" v-model="form['surrounding_environment']" placeholder="请输入周边环境"
						v-if="(form['housing_information_id'] && $check_field('set','surrounding_environment')) || (!form['housing_information_id'] && $check_field('add','surrounding_environment'))" :disabled="disabledObj['surrounding_environment_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','surrounding_environment')">{{form['surrounding_environment']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','house_introduction') || $check_field('add','house_introduction') || $check_field('set','house_introduction')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="房屋介绍" prop="house_introduction">
					<quill-editor v-model.number="form['house_introduction']"
						v-if="(form['housing_information_id'] && $check_field('set','house_introduction')) || (!form['housing_information_id'] && $check_field('add','house_introduction')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','house_introduction')" v-html="form['house_introduction']"></div>
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
	
	
	
		
		
						<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="在线预约限次">
				<el-input id="limit_times" v-model="form['appointment_to_see_the_room_limit_times']" placeholder="在线预约限制次数，0为不限"
						  v-if="$check_option('/housing_information/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/housing_information/view','get')" v-html="form['appointment_to_see_the_room_limit_times']"></div>
			  </el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="财务报表限次">
				<el-input id="limit_times" v-model="form['financial_statements_limit_times']" placeholder="财务报表限制次数，0为不限"
						  v-if="$check_option('/housing_information/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/housing_information/view','get')" v-html="form['financial_statements_limit_times']"></div>
			  </el-form-item>
			</el-col>
			
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/housing_information/view','set') || $check_action('/housing_information/view','add')">
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
				field: "housing_information_id",
				url_add: "~/api/housing_information/add?",
				url_set: "~/api/housing_information/set?",
				url_get_obj: "~/api/housing_information/get_obj?",
				url_upload: "~/api/housing_information/upload?",

				query: {
					"housing_information_id": 0,
				},

				form: {
								"house_title":  '', // 房屋标题
										"area":  '', // 所在区域
										"house_type":  '', // 房屋户型
										"house_picture":  '', // 房屋图片
										"house_video":  '', // 房屋视频
										"house_status":  '', // 房屋状态
										"building_area":  '', // 建筑面积
										"housing_rent":  0, // 房屋租金
										"housing_deposit":  '', // 房屋押金
										"price_description":  '', // 价格说明
										"house_address":  '', // 房屋地址
										"number_of_houses":  '', // 房屋数量
										"landlord_user": 0, // 房东用户
										"name_of_landlord":  '', // 房东姓名
										"supporting_facilities":  '', // 配套设施
										"surrounding_environment":  '', // 周边环境
										"house_introduction":  '', // 房屋介绍
									"examine_state": "未审核",
							"examine_reply": "",
							"housing_information_id": 0, // ID
													"appointment_to_see_the_room_limit_times": 0, // 在线预约限制次数
							"financial_statements_limit_times": 0, // 财务报表限制次数
										},
				disabledObj:{
								"house_title_isDisabled": false,
										"area_isDisabled": false,
										"house_type_isDisabled": false,
										"house_picture_isDisabled": false,
										"house_video_isDisabled": false,
										"house_status_isDisabled": false,
										"building_area_isDisabled": false,
					          			"housing_rent_isDisabled": false,
										"housing_deposit_isDisabled": false,
										"price_description_isDisabled": false,
										"house_address_isDisabled": false,
										"number_of_houses_isDisabled": false,
										"landlord_user_isDisabled": false,
										"name_of_landlord_isDisabled": false,
										"supporting_facilities_isDisabled": false,
										"surrounding_environment_isDisabled": false,
										"house_introduction_isDisabled": false,
										},

													// 所在区域选项列表
				list_area: [""],
													// 房屋户型选项列表
				list_house_type: [""],
																		house_video_FileList: [],
												// 房屋状态选项列表
				list_house_status: ['空闲中','租赁中','清洁中','维修中'],
																																											// 房屋数量选项列表
				list_number_of_houses: ['1'],
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
			 * 获取所在区域列表
			 */
			async get_list_area() {
				var json = await this.$get("~/api/regional_classification/get_list?");
				if(json.result && json.result.list){
					this.list_area = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					
				
				/**
			 * 获取房屋户型列表
			 */
			async get_list_house_type() {
				var json = await this.$get("~/api/huxing_classification/get_list?");
				if(json.result && json.result.list){
					this.list_house_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					
						/**
			 * 上传房屋图片
			 * @param {Object} param 图片参数
			 */
			upload_house_picture(param){
									this.uploadFile(param.file, "house_picture");
								},
		
	
						/**
			 * 上传房屋视频
			 * @param {Object} param 视频参数
			 */
			upload_house_video(param){
									this.uploadFile(param.file, "house_video");
								},
					house_videoRemove() {
			  this.house_video_FileList = []
			  this.form.house_video = ""
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
																																						$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){

																																				this.house_video_FileList = []
				if (json.result.obj["house_video"]) {
				    this.house_video_FileList = [
				        {
				            url: this.$fullUrl(json.result.obj['house_video']),
				            name: json.result.obj['house_video'],
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
																																																																																																																																																																																																					return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/housing_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/housing_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/housing_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/housing_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/housing_information/view','get');
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
						this.get_list_area();
						this.get_list_house_type();
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
