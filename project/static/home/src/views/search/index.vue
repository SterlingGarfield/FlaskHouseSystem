<template>
  <div class="page_search search_index">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>



						  <list_result_search
				v-if="$check_action('/tenant_user/list', 'get')"
				:list="result_tenant_user_user_name"
				title="租客用户用户姓名"
				source_table="tenant_user"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/tenant_user/list', 'get')"
				:list="result_tenant_user_mobile_phone_number"
				title="租客用户手机号码"
				source_table="tenant_user"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/landlord_user/list', 'get')"
				:list="result_landlord_user_name_of_landlord"
				title="房东用户房东姓名"
				source_table="landlord_user"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/landlord_user/list', 'get')"
				:list="result_landlord_user_contact_number"
				title="房东用户联系号码"
				source_table="landlord_user"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/regional_classification/list', 'get')"
				:list="result_regional_classification_area_type"
				title="区域分类区域类型"
				source_table="regional_classification"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/huxing_classification/list', 'get')"
				:list="result_huxing_classification_type_of_house_type"
				title="户型分类户型类型"
				source_table="huxing_classification"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/housing_information/list', 'get')"
				:list="result_housing_information_house_title"
				title="房屋信息房屋标题"
				source_table="housing_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/housing_information/list', 'get')"
				:list="result_housing_information_area"
				title="房屋信息所在区域"
				source_table="housing_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/housing_information/list', 'get')"
				:list="result_housing_information_house_type"
				title="房屋信息房屋户型"
				source_table="housing_information"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/housing_information/list', 'get')"
				:list="result_housing_information_house_status"
				title="房屋信息房屋状态"
				source_table="housing_information"
			  ></list_result_search>
																																										  <list_result_search
				v-if="$check_action('/appointment_to_see_the_room/list', 'get')"
				:list="result_appointment_to_see_the_room_booking_code"
				title="预约看房预约编码"
				source_table="appointment_to_see_the_room"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/appointment_to_see_the_room/list', 'get')"
				:list="result_appointment_to_see_the_room_house_title"
				title="预约看房房屋标题"
				source_table="appointment_to_see_the_room"
			  ></list_result_search>
																																  <list_result_search
				v-if="$check_action('/appointment_to_see_the_room/list', 'get')"
				:list="result_appointment_to_see_the_room_user_name"
				title="预约看房用户姓名"
				source_table="appointment_to_see_the_room"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/appointment_to_see_the_room/list', 'get')"
				:list="result_appointment_to_see_the_room_appointment_time"
				title="预约看房预约时间"
				source_table="appointment_to_see_the_room"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/lease_contract/list', 'get')"
				:list="result_lease_contract_contract_code"
				title="租赁合同合同编码"
				source_table="lease_contract"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/lease_contract/list', 'get')"
				:list="result_lease_contract_house_title"
				title="租赁合同房屋标题"
				source_table="lease_contract"
			  ></list_result_search>
																																  <list_result_search
				v-if="$check_action('/lease_contract/list', 'get')"
				:list="result_lease_contract_contract_name"
				title="租赁合同合同名称"
				source_table="lease_contract"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/lease_contract/list', 'get')"
				:list="result_lease_contract_signing_time"
				title="租赁合同签订时间"
				source_table="lease_contract"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/maintenance_records/list', 'get')"
				:list="result_maintenance_records_contract_code"
				title="维修记录合同编码"
				source_table="maintenance_records"
			  ></list_result_search>
																				  <list_result_search
				v-if="$check_action('/maintenance_records/list', 'get')"
				:list="result_maintenance_records_repair_title"
				title="维修记录报修标题"
				source_table="maintenance_records"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/maintenance_records/list', 'get')"
				:list="result_maintenance_records_maintenance_status"
				title="维修记录维修状态"
				source_table="maintenance_records"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/complaint_records/list', 'get')"
				:list="result_complaint_records_contract_code"
				title="投诉记录合同编码"
				source_table="complaint_records"
			  ></list_result_search>
																				  <list_result_search
				v-if="$check_action('/complaint_records/list', 'get')"
				:list="result_complaint_records_complaint_title"
				title="投诉记录投诉标题"
				source_table="complaint_records"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/financial_statements/list', 'get')"
				:list="result_financial_statements_report_title"
				title="财务报表报表标题"
				source_table="financial_statements"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/financial_statements/list', 'get')"
				:list="result_financial_statements_statistical_time"
				title="财务报表统计时间"
				source_table="financial_statements"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/news_information/list', 'get')"
				:list="result_news_information_news_name"
				title="新闻信息新闻名称"
				source_table="news_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/news_information/list', 'get')"
				:list="result_news_information_news_type"
				title="新闻信息新闻类型"
				source_table="news_information"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/news_information/list', 'get')"
				:list="result_news_information_release_date"
				title="新闻信息发布日期"
				source_table="news_information"
			  ></list_result_search>
												</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
						"result_tenant_user_user_name":[],
											"result_tenant_user_mobile_phone_number":[],
									"result_landlord_user_name_of_landlord":[],
											"result_landlord_user_contact_number":[],
									"result_regional_classification_area_type":[],
									"result_huxing_classification_type_of_house_type":[],
									"result_housing_information_house_title":[],
								"result_housing_information_area":[],
								"result_housing_information_house_type":[],
														"result_housing_information_house_status":[],
																																										"result_appointment_to_see_the_room_booking_code":[],
								"result_appointment_to_see_the_room_house_title":[],
																																"result_appointment_to_see_the_room_user_name":[],
											"result_appointment_to_see_the_room_appointment_time":[],
												"result_lease_contract_contract_code":[],
											"result_lease_contract_house_title":[],
																																"result_lease_contract_contract_name":[],
								"result_lease_contract_signing_time":[],
															"result_maintenance_records_contract_code":[],
																				"result_maintenance_records_repair_title":[],
														"result_maintenance_records_maintenance_status":[],
												"result_complaint_records_contract_code":[],
																				"result_complaint_records_complaint_title":[],
															"result_financial_statements_report_title":[],
														"result_financial_statements_statistical_time":[],
																								"result_news_information_news_name":[],
								"result_news_information_news_type":[],
											"result_news_information_release_date":[],
										};
  },
  methods: {

				/**
	 * 获取user_name
	 */
	get_tenant_user_user_name(){
		let url = "~/api/tenant_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_tenant_user_user_name = json.result.list;
			result_tenant_user_user_name.map(o => o.title = o['user_name'])
	  			this.result_tenant_user_user_name = result_tenant_user_user_name
		 	}
		});
	},
									/**
	 * 获取mobile_phone_number
	 */
	get_tenant_user_mobile_phone_number(){
		let url = "~/api/tenant_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "mobile_phone_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_tenant_user_mobile_phone_number = json.result.list;
			result_tenant_user_mobile_phone_number.map(o => o.title = o['mobile_phone_number'])
	  			this.result_tenant_user_mobile_phone_number = result_tenant_user_mobile_phone_number
		 	}
		});
	},
							/**
	 * 获取name_of_landlord
	 */
	get_landlord_user_name_of_landlord(){
		let url = "~/api/landlord_user/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "name_of_landlord": this.query.word }, (json) => {
		  if (json.result) {
			var result_landlord_user_name_of_landlord = json.result.list;
			result_landlord_user_name_of_landlord.map(o => o.title = o['name_of_landlord'])
	  			this.result_landlord_user_name_of_landlord = result_landlord_user_name_of_landlord
		 	}
		});
	},
									/**
	 * 获取contact_number
	 */
	get_landlord_user_contact_number(){
		let url = "~/api/landlord_user/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "contact_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_landlord_user_contact_number = json.result.list;
			result_landlord_user_contact_number.map(o => o.title = o['contact_number'])
	  			this.result_landlord_user_contact_number = result_landlord_user_contact_number
		 	}
		});
	},
							/**
	 * 获取area_type
	 */
	get_regional_classification_area_type(){
		let url = "~/api/regional_classification/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "area_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_regional_classification_area_type = json.result.list;
			result_regional_classification_area_type.map(o => o.title = o['area_type'])
	  			this.result_regional_classification_area_type = result_regional_classification_area_type
		 	}
		});
	},
							/**
	 * 获取type_of_house_type
	 */
	get_huxing_classification_type_of_house_type(){
		let url = "~/api/huxing_classification/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "type_of_house_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_huxing_classification_type_of_house_type = json.result.list;
			result_huxing_classification_type_of_house_type.map(o => o.title = o['type_of_house_type'])
	  			this.result_huxing_classification_type_of_house_type = result_huxing_classification_type_of_house_type
		 	}
		});
	},
							/**
	 * 获取house_title
	 */
	get_housing_information_house_title(){
		let url = "~/api/housing_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_information_house_title = json.result.list;
			result_housing_information_house_title.map(o => o.title = o['house_title'])
	  			this.result_housing_information_house_title = result_housing_information_house_title
		 	}
		});
	},
						/**
	 * 获取area
	 */
	get_housing_information_area(){
		let url = "~/api/housing_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "area": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_information_area = json.result.list;
			result_housing_information_area.map(o => o.title = o['area'])
	  			this.result_housing_information_area = result_housing_information_area
		 	}
		});
	},
						/**
	 * 获取house_type
	 */
	get_housing_information_house_type(){
		let url = "~/api/housing_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_information_house_type = json.result.list;
			result_housing_information_house_type.map(o => o.title = o['house_type'])
	  			this.result_housing_information_house_type = result_housing_information_house_type
		 	}
		});
	},
												/**
	 * 获取house_status
	 */
	get_housing_information_house_status(){
		let url = "~/api/housing_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_status": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_information_house_status = json.result.list;
			result_housing_information_house_status.map(o => o.title = o['house_status'])
	  			this.result_housing_information_house_status = result_housing_information_house_status
		 	}
		});
	},
																																								/**
	 * 获取booking_code
	 */
	get_appointment_to_see_the_room_booking_code(){
		let url = "~/api/appointment_to_see_the_room/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "booking_code": this.query.word }, (json) => {
		  if (json.result) {
			var result_appointment_to_see_the_room_booking_code = json.result.list;
			result_appointment_to_see_the_room_booking_code.map(o => o.title = o['booking_code'])
	  			this.result_appointment_to_see_the_room_booking_code = result_appointment_to_see_the_room_booking_code
		 	}
		});
	},
						/**
	 * 获取house_title
	 */
	get_appointment_to_see_the_room_house_title(){
		let url = "~/api/appointment_to_see_the_room/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_appointment_to_see_the_room_house_title = json.result.list;
			result_appointment_to_see_the_room_house_title.map(o => o.title = o['house_title'])
	  			this.result_appointment_to_see_the_room_house_title = result_appointment_to_see_the_room_house_title
		 	}
		});
	},
																														/**
	 * 获取user_name
	 */
	get_appointment_to_see_the_room_user_name(){
		let url = "~/api/appointment_to_see_the_room/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_appointment_to_see_the_room_user_name = json.result.list;
			result_appointment_to_see_the_room_user_name.map(o => o.title = o['user_name'])
	  			this.result_appointment_to_see_the_room_user_name = result_appointment_to_see_the_room_user_name
		 	}
		});
	},
									/**
	 * 获取appointment_time
	 */
	get_appointment_to_see_the_room_appointment_time(){
		let url = "~/api/appointment_to_see_the_room/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "appointment_time": this.query.word }, (json) => {
		  if (json.result) {
			var result_appointment_to_see_the_room_appointment_time = json.result.list;
			result_appointment_to_see_the_room_appointment_time.map(o => o.title = o['appointment_time'])
	  			this.result_appointment_to_see_the_room_appointment_time = result_appointment_to_see_the_room_appointment_time
		 	}
		});
	},
										/**
	 * 获取contract_code
	 */
	get_lease_contract_contract_code(){
		let url = "~/api/lease_contract/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "contract_code": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_contract_contract_code = json.result.list;
			result_lease_contract_contract_code.map(o => o.title = o['contract_code'])
	  			this.result_lease_contract_contract_code = result_lease_contract_contract_code
		 	}
		});
	},
									/**
	 * 获取house_title
	 */
	get_lease_contract_house_title(){
		let url = "~/api/lease_contract/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "house_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_contract_house_title = json.result.list;
			result_lease_contract_house_title.map(o => o.title = o['house_title'])
	  			this.result_lease_contract_house_title = result_lease_contract_house_title
		 	}
		});
	},
																														/**
	 * 获取contract_name
	 */
	get_lease_contract_contract_name(){
		let url = "~/api/lease_contract/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "contract_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_contract_contract_name = json.result.list;
			result_lease_contract_contract_name.map(o => o.title = o['contract_name'])
	  			this.result_lease_contract_contract_name = result_lease_contract_contract_name
		 	}
		});
	},
						/**
	 * 获取signing_time
	 */
	get_lease_contract_signing_time(){
		let url = "~/api/lease_contract/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "signing_time": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_contract_signing_time = json.result.list;
			result_lease_contract_signing_time.map(o => o.title = o['signing_time'])
	  			this.result_lease_contract_signing_time = result_lease_contract_signing_time
		 	}
		});
	},
													/**
	 * 获取contract_code
	 */
	get_maintenance_records_contract_code(){
		let url = "~/api/maintenance_records/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "contract_code": this.query.word }, (json) => {
		  if (json.result) {
			var result_maintenance_records_contract_code = json.result.list;
			result_maintenance_records_contract_code.map(o => o.title = o['contract_code'])
	  			this.result_maintenance_records_contract_code = result_maintenance_records_contract_code
		 	}
		});
	},
																		/**
	 * 获取repair_title
	 */
	get_maintenance_records_repair_title(){
		let url = "~/api/maintenance_records/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "repair_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_maintenance_records_repair_title = json.result.list;
			result_maintenance_records_repair_title.map(o => o.title = o['repair_title'])
	  			this.result_maintenance_records_repair_title = result_maintenance_records_repair_title
		 	}
		});
	},
												/**
	 * 获取maintenance_status
	 */
	get_maintenance_records_maintenance_status(){
		let url = "~/api/maintenance_records/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "maintenance_status": this.query.word }, (json) => {
		  if (json.result) {
			var result_maintenance_records_maintenance_status = json.result.list;
			result_maintenance_records_maintenance_status.map(o => o.title = o['maintenance_status'])
	  			this.result_maintenance_records_maintenance_status = result_maintenance_records_maintenance_status
		 	}
		});
	},
										/**
	 * 获取contract_code
	 */
	get_complaint_records_contract_code(){
		let url = "~/api/complaint_records/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "contract_code": this.query.word }, (json) => {
		  if (json.result) {
			var result_complaint_records_contract_code = json.result.list;
			result_complaint_records_contract_code.map(o => o.title = o['contract_code'])
	  			this.result_complaint_records_contract_code = result_complaint_records_contract_code
		 	}
		});
	},
																		/**
	 * 获取complaint_title
	 */
	get_complaint_records_complaint_title(){
		let url = "~/api/complaint_records/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "complaint_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_complaint_records_complaint_title = json.result.list;
			result_complaint_records_complaint_title.map(o => o.title = o['complaint_title'])
	  			this.result_complaint_records_complaint_title = result_complaint_records_complaint_title
		 	}
		});
	},
													/**
	 * 获取report_title
	 */
	get_financial_statements_report_title(){
		let url = "~/api/financial_statements/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "report_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_financial_statements_report_title = json.result.list;
			result_financial_statements_report_title.map(o => o.title = o['report_title'])
	  			this.result_financial_statements_report_title = result_financial_statements_report_title
		 	}
		});
	},
												/**
	 * 获取statistical_time
	 */
	get_financial_statements_statistical_time(){
		let url = "~/api/financial_statements/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "statistical_time": this.query.word }, (json) => {
		  if (json.result) {
			var result_financial_statements_statistical_time = json.result.list;
			result_financial_statements_statistical_time.map(o => o.title = o['statistical_time'])
	  			this.result_financial_statements_statistical_time = result_financial_statements_statistical_time
		 	}
		});
	},
																						/**
	 * 获取news_name
	 */
	get_news_information_news_name(){
		let url = "~/api/news_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "news_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_news_information_news_name = json.result.list;
			result_news_information_news_name.map(o => o.title = o['news_name'])
	  			this.result_news_information_news_name = result_news_information_news_name
		 	}
		});
	},
						/**
	 * 获取news_type
	 */
	get_news_information_news_type(){
		let url = "~/api/news_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "news_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_news_information_news_type = json.result.list;
			result_news_information_news_type.map(o => o.title = o['news_type'])
	  			this.result_news_information_news_type = result_news_information_news_type
		 	}
		});
	},
									/**
	 * 获取release_date
	 */
	get_news_information_release_date(){
		let url = "~/api/news_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "release_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_news_information_release_date = json.result.list;
			result_news_information_release_date.map(o => o.title = o['release_date'])
	  			this.result_news_information_release_date = result_news_information_release_date
		 	}
		});
	},
									
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
					this.get_tenant_user_user_name();
										this.get_tenant_user_mobile_phone_number();
								this.get_landlord_user_name_of_landlord();
										this.get_landlord_user_contact_number();
								this.get_regional_classification_area_type();
								this.get_huxing_classification_type_of_house_type();
								this.get_housing_information_house_title();
							this.get_housing_information_area();
							this.get_housing_information_house_type();
													this.get_housing_information_house_status();
																																									this.get_appointment_to_see_the_room_booking_code();
							this.get_appointment_to_see_the_room_house_title();
																															this.get_appointment_to_see_the_room_user_name();
										this.get_appointment_to_see_the_room_appointment_time();
											this.get_lease_contract_contract_code();
										this.get_lease_contract_house_title();
																															this.get_lease_contract_contract_name();
							this.get_lease_contract_signing_time();
														this.get_maintenance_records_contract_code();
																			this.get_maintenance_records_repair_title();
													this.get_maintenance_records_maintenance_status();
											this.get_complaint_records_contract_code();
																			this.get_complaint_records_complaint_title();
														this.get_financial_statements_report_title();
													this.get_financial_statements_statistical_time();
																							this.get_news_information_news_name();
							this.get_news_information_news_type();
										this.get_news_information_release_date();
									  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
				  this.get_tenant_user_user_name();
									  this.get_tenant_user_mobile_phone_number();
							  this.get_landlord_user_name_of_landlord();
									  this.get_landlord_user_contact_number();
							  this.get_regional_classification_area_type();
							  this.get_huxing_classification_type_of_house_type();
							  this.get_housing_information_house_title();
						  this.get_housing_information_area();
						  this.get_housing_information_house_type();
												  this.get_housing_information_house_status();
																																								  this.get_appointment_to_see_the_room_booking_code();
						  this.get_appointment_to_see_the_room_house_title();
																														  this.get_appointment_to_see_the_room_user_name();
									  this.get_appointment_to_see_the_room_appointment_time();
										  this.get_lease_contract_contract_code();
									  this.get_lease_contract_house_title();
																														  this.get_lease_contract_contract_name();
						  this.get_lease_contract_signing_time();
													  this.get_maintenance_records_contract_code();
																		  this.get_maintenance_records_repair_title();
												  this.get_maintenance_records_maintenance_status();
										  this.get_complaint_records_contract_code();
																		  this.get_complaint_records_complaint_title();
													  this.get_financial_statements_report_title();
												  this.get_financial_statements_statistical_time();
																						  this.get_news_information_news_name();
						  this.get_news_information_news_type();
									  this.get_news_information_release_date();
										},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
