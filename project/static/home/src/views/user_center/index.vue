<template>
	<div class="page_user my_home" id="user_address">
		<div class="warp">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-12 col-md-3">
						<div class="card_menu">
							<!-- 左侧边栏 -->
							<list_admin_menu_user></list_admin_menu_user>
						</div>
					</div>
					<div class="col-12 col-md-9">
						<div class="card_addres pl-2">
							<div class="warp">
								<div class="container-fluid">
									<el-row>
										<div>欢迎来到个人中心</div>
									</el-row>
									<el-row>
											<el-col v-if="$check_figure('/tenant_user/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/landlord_user/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/regional_classification/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/huxing_classification/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/housing_information/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/appointment_to_see_the_room/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/lease_contract/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/maintenance_records/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/complaint_records/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/financial_statements/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
												<el-col v-if="$check_figure('/news_information/table')" :span="8">
											<div class="card chart">
													</div>
										</el-col>
										</el-row>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import list_admin_menu_user from "@/components/diy/list_admin_menu_user.vue";
	export default {
		data() {
			return {
																									};
		},
		mounted() {
		},
		methods: {
			async get_nickname(list,flag){
				if (flag) {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i],
								null,
								(json) => {
									if (json.result) {
										list[i] = json.result.obj.nickname;
									}
								});
					}
				}else {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i].name,
								null,
								(json) => {
									if (json.result) {
										list[i].name = json.result.obj.nickname;
									}
								});
					}
				}
			},
				// 获取租客用户统计图数据
			get_list_tenant_user() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_tenant_user_sub(this.list_tenant_user, i);
				}
			},
																						// 获取房东用户统计图数据
			get_list_landlord_user() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_landlord_user_sub(this.list_landlord_user, i);
				}
			},
																						// 获取区域分类统计图数据
			get_list_regional_classification() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_regional_classification_sub(this.list_regional_classification, i);
				}
			},
												// 获取户型分类统计图数据
			get_list_huxing_classification() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_huxing_classification_sub(this.list_huxing_classification, i);
				}
			},
												// 获取房屋信息统计图数据
			get_list_housing_information() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_housing_information_sub(this.list_housing_information, i);
				}
			},
																																																																																												// 获取预约看房统计图数据
			get_list_appointment_to_see_the_room() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_appointment_to_see_the_room_sub(this.list_appointment_to_see_the_room, i);
				}
			},
																																																																													// 获取租赁合同统计图数据
			get_list_lease_contract() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_lease_contract_sub(this.list_lease_contract, i);
				}
			},
																																																																																		// 获取维修记录统计图数据
			get_list_maintenance_records() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_maintenance_records_sub(this.list_maintenance_records, i);
				}
			},
																																																									// 获取投诉记录统计图数据
			get_list_complaint_records() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_complaint_records_sub(this.list_complaint_records, i);
				}
			},
																																															// 获取财务报表统计图数据
			get_list_financial_statements() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_financial_statements_sub(this.list_financial_statements, i);
				}
			},
																																															// 获取新闻信息统计图数据
			get_list_news_information() {
				for (var i = 6; i >= 0; i--) {
					this.get_list_news_information_sub(this.list_news_information, i);
				}
			},
																																								},
		created() {
			setTimeout(() => {
				// 执行租客用户数据获取
			this.get_list_tenant_user();
					// 执行房东用户数据获取
			this.get_list_landlord_user();
					// 执行区域分类数据获取
			this.get_list_regional_classification();
					// 执行户型分类数据获取
			this.get_list_huxing_classification();
					// 执行房屋信息数据获取
			this.get_list_housing_information();
					// 执行预约看房数据获取
			this.get_list_appointment_to_see_the_room();
					// 执行租赁合同数据获取
			this.get_list_lease_contract();
					// 执行维修记录数据获取
			this.get_list_maintenance_records();
					// 执行投诉记录数据获取
			this.get_list_complaint_records();
					// 执行财务报表数据获取
			this.get_list_financial_statements();
					// 执行新闻信息数据获取
			this.get_list_news_information();
				}, 1000);
		},
		components: {
			list_admin_menu_user
		},
	};
</script>

<style scoped>
	.container {
		min-height: 800px;
	}
</style>
