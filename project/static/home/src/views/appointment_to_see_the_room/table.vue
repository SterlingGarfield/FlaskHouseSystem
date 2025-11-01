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
							<!-- 预约看房 -->
							<div><span>预约看房</span></div>
							<table_appointment_to_see_the_room v-if="$check_action('/appointment_to_see_the_room/table','get')"></table_appointment_to_see_the_room>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>


<script>
	import list_admin_menu_user from "@/components/diy/list_admin_menu_user.vue";
	import table_appointment_to_see_the_room from "../../components/diy/table_appointment_to_see_the_room.vue";
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
			table_appointment_to_see_the_room,
		},
	};
</script>

<style scoped>
	.container {
		min-height: 800px;
	}
</style>
