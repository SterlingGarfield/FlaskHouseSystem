<template>
	<div class="page_user" id="user_address">
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
							<!-- 户型分类 -->
							<div><span>户型分类</span></div>
							<table_huxing_classification v-if="$check_action('/huxing_classification/table','get')"></table_huxing_classification>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>


<script>
	import list_admin_menu_user from "@/components/diy/list_admin_menu_user.vue";
	import table_huxing_classification from "../../components/diy/table_huxing_classification.vue";
	export default {
		data() {
			return {
			};
		},
		mounted() {
		},
		methods: {
		},

		components: {
			list_admin_menu_user,
			table_huxing_classification,
		},
	};
</script>

<style scoped>
	.container {
		min-height: 800px;
	}
</style>
