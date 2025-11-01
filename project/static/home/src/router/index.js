import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue'
import login from '../views/account/login.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index
	},
	// 登录
	{
		path: '/account/login',
		name: 'login',
		component: login
	},
	// 忘记密码
	{
		path: '/account/forgot',
		name: 'forgot',
		component: () => import('../views/account/forgot.vue')
	},
	// 注册账号
	{
		path: '/account/register',
		name: 'register',
		component: () => import('../views/account/register.vue')
	},
		// 媒体图片
	{
		path: '/media/image',
		name: 'media_image',
		component: () => import('../views/media/image.vue')
	},

	// 音乐
	// {
	// 	path: '/media/music',
	// 	name: 'media_music',
	// 	component: () => import('../views/media/music.vue')
	// },
	// 媒体视频
	{
		path: '/media/video',
		name: 'media_video',
		component: () => import('../views/media/video.vue')
	},
	// 媒体视频
	{
		path: '/user_center/index',
		name: 'user_center_index',
		component: () => import('../views/user_center/index.vue')
	},
	// 浏览网站
	// 收藏路由
	{
		path: '/user/collect',
		name: 'collect_list',
		component: () => import('../views/user/collect.vue')
	},


	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue')
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue')
	},

	



	// 公告路由
	{
		path: '/notice/list',
		name: 'notice_list',
		component: () => import('../views/notice/list.vue')
	},
	{
		path: '/notice/details',
		name: 'notice_details',
		component: () => import('../views/notice/details.vue')
	},
	// 租客用户表格路由
	{
		path: '/tenant_user/table',
		name: '/tenant_user_table',
		component: () => import('../views/tenant_user/table.vue')
	},
	// 租客用户详情路由
	{
		path: '/tenant_user/view',
		name: '/tenant_user_view',
		component: () => import('../views/tenant_user/view.vue')
	},
	
	
		
		
		
	// 房东用户表格路由
	{
		path: '/landlord_user/table',
		name: '/landlord_user_table',
		component: () => import('../views/landlord_user/table.vue')
	},
	// 房东用户详情路由
	{
		path: '/landlord_user/view',
		name: '/landlord_user_view',
		component: () => import('../views/landlord_user/view.vue')
	},
	
	
		
		
		
	// 区域分类表格路由
	{
		path: '/regional_classification/table',
		name: '/regional_classification_table',
		component: () => import('../views/regional_classification/table.vue')
	},
	// 区域分类详情路由
	{
		path: '/regional_classification/view',
		name: '/regional_classification_view',
		component: () => import('../views/regional_classification/view.vue')
	},
	
	
		
		
		
	// 户型分类表格路由
	{
		path: '/huxing_classification/table',
		name: '/huxing_classification_table',
		component: () => import('../views/huxing_classification/table.vue')
	},
	// 户型分类详情路由
	{
		path: '/huxing_classification/view',
		name: '/huxing_classification_view',
		component: () => import('../views/huxing_classification/view.vue')
	},
	
	
		
		
		
	// 房屋信息表格路由
	{
		path: '/housing_information/table',
		name: '/housing_information_table',
		component: () => import('../views/housing_information/table.vue')
	},
	// 房屋信息详情路由
	{
		path: '/housing_information/view',
		name: '/housing_information_view',
		component: () => import('../views/housing_information/view.vue')
	},
	
		// 房屋信息列表路由
	{
		path: '/housing_information/list',
		name: '/housing_information_list',
		component: () => import('../views/housing_information/list.vue')
	},
	
		// 房屋信息详情路由
	{
		path: '/housing_information/details',
		name: '/housing_information_details',
		component: () => import('../views/housing_information/details.vue')
	},
		
		
		
	// 预约看房表格路由
	{
		path: '/appointment_to_see_the_room/table',
		name: '/appointment_to_see_the_room_table',
		component: () => import('../views/appointment_to_see_the_room/table.vue')
	},
	// 预约看房详情路由
	{
		path: '/appointment_to_see_the_room/view',
		name: '/appointment_to_see_the_room_view',
		component: () => import('../views/appointment_to_see_the_room/view.vue')
	},
		// 预约看房添加路由
	{
		path: '/appointment_to_see_the_room/edit',
		name: '/appointment_to_see_the_room_edit',
		component: () => import('../views/appointment_to_see_the_room/edit.vue')
	},
	
	
		
		
		
	// 租赁合同表格路由
	{
		path: '/lease_contract/table',
		name: '/lease_contract_table',
		component: () => import('../views/lease_contract/table.vue')
	},
	// 租赁合同详情路由
	{
		path: '/lease_contract/view',
		name: '/lease_contract_view',
		component: () => import('../views/lease_contract/view.vue')
	},
	
	
		
		
		
	// 维修记录表格路由
	{
		path: '/maintenance_records/table',
		name: '/maintenance_records_table',
		component: () => import('../views/maintenance_records/table.vue')
	},
	// 维修记录详情路由
	{
		path: '/maintenance_records/view',
		name: '/maintenance_records_view',
		component: () => import('../views/maintenance_records/view.vue')
	},
	
	
		
		
		
	// 投诉记录表格路由
	{
		path: '/complaint_records/table',
		name: '/complaint_records_table',
		component: () => import('../views/complaint_records/table.vue')
	},
	// 投诉记录详情路由
	{
		path: '/complaint_records/view',
		name: '/complaint_records_view',
		component: () => import('../views/complaint_records/view.vue')
	},
	
	
		
		
		
	// 财务报表表格路由
	{
		path: '/financial_statements/table',
		name: '/financial_statements_table',
		component: () => import('../views/financial_statements/table.vue')
	},
	// 财务报表详情路由
	{
		path: '/financial_statements/view',
		name: '/financial_statements_view',
		component: () => import('../views/financial_statements/view.vue')
	},
	
	
		
		
		
	// 新闻信息表格路由
	{
		path: '/news_information/table',
		name: '/news_information_table',
		component: () => import('../views/news_information/table.vue')
	},
	// 新闻信息详情路由
	{
		path: '/news_information/view',
		name: '/news_information_view',
		component: () => import('../views/news_information/view.vue')
	},
	
		// 新闻信息列表路由
	{
		path: '/news_information/list',
		name: '/news_information_list',
		component: () => import('../views/news_information/list.vue')
	},
	
		// 新闻信息详情路由
	{
		path: '/news_information/details',
		name: '/news_information_details',
		component: () => import('../views/news_information/details.vue')
	},
		
		
		

	// 用户路由
	{
		path: '/user/index',
		name: 'user_index',
		component: () => import('../views/user/index.vue')
	},
	// 基本信息
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue')
	},
	// 找回密码
	{
		path: '/user/password',
		name: 'user_password',
		component: () => import('../views/user/password.vue')
	},

	// 搜索
	{
		path: '/search',
		name: 'search',
		component: () => import('../views/search/index.vue')
	},
	// 局部搜索
	{
		path: '/search/details',
		name: 'search_details',
		component: () => import('../views/search/details.vue')
	}
]

const router = new VueRouter({
	mode: 'hash',
	base: process.env.BASE_URL,
	routes
})

router.afterEach((to, from, next) => {
	let title = "智能房屋租赁系统-home";
	document.title = title;
	document.logo = "智能房屋租赁系统"
})

router.beforeEach((to, from, next) => {
  window.scrollTo(0, 0);
  next();
});

export default router
