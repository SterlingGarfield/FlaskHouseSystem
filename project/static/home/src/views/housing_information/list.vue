<template>
	<div class="diy_list page_housing_information" id="housing_information_list">
		<div class="warp">
			<div class="container diy_list_container">
				<div class="diy_list_title">
					<div class="col">
						<span class="title">房屋信息列表</span>
					</div>
				</div>
				<div class="leis_box"> 
				<div class="iudis_box">
			
				<div class="row diy_list_search">
					<div class="col">
						<!-- 搜索栏 -->
						<div class="view Search">
							<span class="diy_list_search_title">关键字搜索：</span>
																															<b-form-input size="sm" class="mr-sm-2" placeholder="房屋标题搜索" v-model="query['house_title']" />
																																														<b-form-input size="sm" class="mr-sm-2" placeholder="所在区域搜索" v-model="query['area']" />
																																														<b-form-input size="sm" class="mr-sm-2" placeholder="房屋户型搜索" v-model="query['house_type']" />
																																																																								<b-form-input size="sm" class="mr-sm-2" placeholder="房屋状态搜索" v-model="query['house_status']" />
																																																																																																																																																																																	<b-button size="sm" @click="search()" >
								<b-icon icon="search"/>
							</b-button>
						</div>
						<!-- /搜索栏 -->
					</div>
				</div>
				<div class="diy_list_select_box">
					<span class="diy_list_select_title">下拉搜索：</span>
						<div class="diy_list_dropdown_box">
						<div class="col">
							<!-- 筛选 -->
							<div class="view sift">
															<b-dropdown text="所在区域" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','area')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o, i) in list_area" :key="i" @click="filter_set(o['area_type'],'area')" >
												{{ o['area_type'] }}
										</b-dropdown-item>
								</b-dropdown>
														<b-dropdown text="房屋户型" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','house_type')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o, i) in list_house_type" :key="i" @click="filter_set(o['type_of_house_type'],'house_type')" >
												{{ o['type_of_house_type'] }}
										</b-dropdown-item>
								</b-dropdown>
																<b-dropdown text="房屋状态" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','house_status')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o,i) in list_house_status" @click="filter_set(o,'house_status')" >
										{{ o }}
										</b-dropdown-item>
								</b-dropdown>
																						<!-- 排序 -->
							
								<b-dropdown text="排序" variant="outline-dark" left>
										<b-dropdown-item v-for="(o, i) in list_sort" :key="i" @click="set_sort(o)" >
												{{ o.name }}
										</b-dropdown-item>
								</b-dropdown>
						
							<!--/排序 -->
							</div>
							<!-- /筛选 -->
						</div>
					</div>
				
				</div>
							</div>
				<div class="row diy_list_box">
					<div class="col">
						<!-- 列表 -->
												<list_housing_information :list="list" />
												<!-- /列表 -->
					</div>
				</div>
	</div>
	<!-- 大盒子结尾 -->
				<div class="row diy_list_page_box">
					<div class="col overflow-auto flex_cc">
						<!-- 分页器 -->
<!--						<diy_pager v-model="query['page']" :size="query['size']" :count="count" v-on:toPage="toPage" v-on:toSize="toSize" ></diy_pager>-->
            <b-pagination
                v-model="query.page"
                :total-rows="count"
                :per-page="query.size"
                @change="goToPage"
            />
						<!-- /分页器 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import list_housing_information from "@/components/diy/list_housing_information.vue";
	import diy_pager from "@/components/diy/diy_pager";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			diy_pager,
			list_housing_information,
		},
		data() {
			return {
				url_get_list: "~/api/housing_information/get_list?like=0",

				// 查询条件
				query: {
					keyword: "",
					page: 1,
					size: 12,
								"house_title": "", // 房屋标题
											"area": "", // 所在区域
											"house_type": "", // 房屋户型
													"house_status": "", // 房屋状态
																			"examine_state": "已通过", // 审核状态
				},
				// 排序内容
				list_sort: [{
						name: "创建时间从高到低",
						value: "create_time desc",
					},
					{
						name: "创建时间从低到高",
						value: "create_time asc",
					},
					{
						name: "更新时间从高到低",
						value: "update_time desc",
					},
					{
						name: "更新时间从低到高",
						value: "update_time asc",
					},
																					],

							// 所在区域列表
				"list_area": [""],
							// 房屋户型列表
				"list_house_type": [""],
											// 房屋状态列表
				"list_house_status": ['空闲中','租赁中','清洁中','维修中'],
																								
			}
		},
		methods: {
      get_list_before(param) {
      },
			/**
			 * 筛选选择
			 */
			filter_set(o,key) {
			    if (o == "全部") {
			        this.query[key] = "";
			    } else {
			        this.query[key] = o;
			    }
			    this.search();
			},

			/**
			 * 排序
			 */
			set_sort(o) {
			    this.query.orderby = o.value;
			    this.search();
			},
					/**
			 * 获取所在区域列表
			 */
			async get_list_area() {
				var json = await this.$get("~/api/regional_classification/get_list?");
				if (json.result) {
					this.list_area = json.result.list;
				} else if (json.error) {
					console.log(json.error);
				}
			},
					/**
			 * 获取房屋户型列表
			 */
			async get_list_house_type() {
				var json = await this.$get("~/api/huxing_classification/get_list?");
				if (json.result) {
					this.list_house_type = json.result.list;
				} else if (json.error) {
					console.log(json.error);
				}
			},
																		/**
			 * 筛选
			 */
												filter_area(o) {
				if (o == "全部") {
					this.query["area"] = "";
				} else {
					this.query["area"] = o;
				}
				this.search();
			},
											filter_house_type(o) {
				if (o == "全部") {
					this.query["house_type"] = "";
				} else {
					this.query["house_type"] = o;
				}
				this.search();
			},
																											/**
			 * 重置
			 */
			reset() {
							this.query.house_title = ""
										this.query.area = ""
										this.query.house_type = ""
												this.query.house_status = ""
																		this.search();
			},

			// 返回条数
			toSize(i){
				this.query.size = i;
				this.first();
			},

			// 返回页数
			toPage(i){
				this.query.page = i;
				this.first();
			},

      goToPage(v){
        this.query.page = v;
        this.goToNew(v)
      },

		},
		computed: {
		},
		created() {
						/**
			 * 获取所在区域列表
			 */
			this.get_list_area();
						/**
			 * 获取房屋户型列表
			 */
			this.get_list_house_type();
																																}
	}
</script>

<style>
.el-date-editor--datetimerange.el-input, .el-date-editor--datetimerange.el-input__inner,.el-date-editor--daterange.el-input, .el-date-editor--daterange.el-input__inner, .el-date-editor--timerange.el-input, .el-date-editor--timerange.el-input__inner{
	width: 100%;
}
.el-date-editor .el-range-separator{
	width: 11% !important;
}
.num_range {
  display: flex;
  align-items: center;
}

.num_range_span {
  font-size: 28px;
}
</style>
