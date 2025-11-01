import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
import register from '../views/register.vue';
Vue.use(VueRouter)

const routes = [
    // 主页
    {
        path: '/',
        name: 'index',
        component: index,
        meta: {
            index: 0,
            title: '首页'
        }
    },

    // 登录
    {
        path: '/login',
        name: 'login',
        component: login,
        meta: {
            index: 0,
            title: '登录'
        }
    },

            // 注册
        {
            path: '/register',
            name: 'register',
            component: register,
            meta: {
                index: 0,
                title: '注册'
            }
        },
    
	    
    // 忘记密码
    {
        path: '/forgot',
        name: "forgot",
        component: forgot,
        meta: {
            index: 0,
            title: '忘记密码'
        }
    },

    // 修改密码
    {
        path: '/user/password',
        name: "password",
        component: () => import("../views/user/password.vue"),
        meta: {
            index: 0,
            title: '修改密码'
        }
    },

    // 视频播放页
    {
        path: "/media/video",
        name: "video",
        component: () => import('../views/media/video.vue'),
        meta: {
            index: 0,
            title: "视频"
        }
    },

    // 音频播放页
    {
        path: "/media/audio",
        name: "audio",
        component: () => import('../views/media/audio.vue'),
        meta: {
            index: 0,
            title: "音频"
        }
    },

            // 权限路由
        {
            path: '/auth/table',
            name: 'auth_table',
            component: () => import('../views/auth/table.vue'),
            meta: {
                index: 0,
                title: '权限列表'
            }
        },
        {
            path: '/auth/view',
            name: 'auth_view',
            component: () => import('../views/auth/view.vue'),
            meta: {
                index: 0,
                title: '权限详情'
            }
        },
    
    
                // 轮播图路由
        {
            path: '/slides/table',
            name: 'slides_table',
            component: () => import('../views/slides/table.vue'),
            meta: {
                index: 0,
                title: '轮播图列表'
            }
        },
        {
            path: '/slides/view',
            name: 'slides_view',
            component: () => import('../views/slides/view.vue'),
            meta: {
                index: 0,
                title: '轮播图详情'
            }
        },
                            
    
    
            // 公告路由
        {
            path: '/notice/table',
            name: 'notice_table',
            component: () => import('../views/notice/table.vue'),
            meta: {
                index: 0,
                title: '通知公告列表'
            }
        },
        {
            path: '/notice/view',
            name: 'notice_view',
            component: () => import('../views/notice/view.vue'),
            meta: {
                index: 0,
                title: '通知公告详情'
            }
        },
            	    
            // 评论路由
        {
            path: '/comment/table',
            name: 'comment_table',
            component: () => import('../views/comment/table.vue'),
            meta: {
                index: 0,
                title: '评论列表'
            }
        },
        {
            path: '/comment/view',
            name: 'comment_view',
            component: () => import('../views/comment/view.vue'),
            meta: {
                index: 0,
                title: '评论详情'
            }
        },
        	            // 租客用户路由
        {
            path: '/tenant_user/table',
            name: 'tenant_user_table',
            component: () => import('../views/tenant_user/table.vue'),
            meta: {
                index: 0,
                title: '租客用户列表'
            }
        },
        {
            path: '/tenant_user/view',
            name: 'tenant_user_view',
            component: () => import('../views/tenant_user/view.vue'),
            meta: {
                index: 0,
                title: '租客用户详情'
            }
        },
						            // 房东用户路由
        {
            path: '/landlord_user/table',
            name: 'landlord_user_table',
            component: () => import('../views/landlord_user/table.vue'),
            meta: {
                index: 0,
                title: '房东用户列表'
            }
        },
        {
            path: '/landlord_user/view',
            name: 'landlord_user_view',
            component: () => import('../views/landlord_user/view.vue'),
            meta: {
                index: 0,
                title: '房东用户详情'
            }
        },
						            // 区域分类路由
        {
            path: '/regional_classification/table',
            name: 'regional_classification_table',
            component: () => import('../views/regional_classification/table.vue'),
            meta: {
                index: 0,
                title: '区域分类列表'
            }
        },
        {
            path: '/regional_classification/view',
            name: 'regional_classification_view',
            component: () => import('../views/regional_classification/view.vue'),
            meta: {
                index: 0,
                title: '区域分类详情'
            }
        },
						            // 户型分类路由
        {
            path: '/huxing_classification/table',
            name: 'huxing_classification_table',
            component: () => import('../views/huxing_classification/table.vue'),
            meta: {
                index: 0,
                title: '户型分类列表'
            }
        },
        {
            path: '/huxing_classification/view',
            name: 'huxing_classification_view',
            component: () => import('../views/huxing_classification/view.vue'),
            meta: {
                index: 0,
                title: '户型分类详情'
            }
        },
						            // 房屋信息路由
        {
            path: '/housing_information/table',
            name: 'housing_information_table',
            component: () => import('../views/housing_information/table.vue'),
            meta: {
                index: 0,
                title: '房屋信息列表'
            }
        },
        {
            path: '/housing_information/view',
            name: 'housing_information_view',
            component: () => import('../views/housing_information/view.vue'),
            meta: {
                index: 0,
                title: '房屋信息详情'
            }
        },
						            // 预约看房路由
        {
            path: '/appointment_to_see_the_room/table',
            name: 'appointment_to_see_the_room_table',
            component: () => import('../views/appointment_to_see_the_room/table.vue'),
            meta: {
                index: 0,
                title: '预约看房列表'
            }
        },
        {
            path: '/appointment_to_see_the_room/view',
            name: 'appointment_to_see_the_room_view',
            component: () => import('../views/appointment_to_see_the_room/view.vue'),
            meta: {
                index: 0,
                title: '预约看房详情'
            }
        },
						            // 租赁合同路由
        {
            path: '/lease_contract/table',
            name: 'lease_contract_table',
            component: () => import('../views/lease_contract/table.vue'),
            meta: {
                index: 0,
                title: '租赁合同列表'
            }
        },
        {
            path: '/lease_contract/view',
            name: 'lease_contract_view',
            component: () => import('../views/lease_contract/view.vue'),
            meta: {
                index: 0,
                title: '租赁合同详情'
            }
        },
						            // 维修记录路由
        {
            path: '/maintenance_records/table',
            name: 'maintenance_records_table',
            component: () => import('../views/maintenance_records/table.vue'),
            meta: {
                index: 0,
                title: '维修记录列表'
            }
        },
        {
            path: '/maintenance_records/view',
            name: 'maintenance_records_view',
            component: () => import('../views/maintenance_records/view.vue'),
            meta: {
                index: 0,
                title: '维修记录详情'
            }
        },
						            // 投诉记录路由
        {
            path: '/complaint_records/table',
            name: 'complaint_records_table',
            component: () => import('../views/complaint_records/table.vue'),
            meta: {
                index: 0,
                title: '投诉记录列表'
            }
        },
        {
            path: '/complaint_records/view',
            name: 'complaint_records_view',
            component: () => import('../views/complaint_records/view.vue'),
            meta: {
                index: 0,
                title: '投诉记录详情'
            }
        },
						            // 财务报表路由
        {
            path: '/financial_statements/table',
            name: 'financial_statements_table',
            component: () => import('../views/financial_statements/table.vue'),
            meta: {
                index: 0,
                title: '财务报表列表'
            }
        },
        {
            path: '/financial_statements/view',
            name: 'financial_statements_view',
            component: () => import('../views/financial_statements/view.vue'),
            meta: {
                index: 0,
                title: '财务报表详情'
            }
        },
						            // 新闻信息路由
        {
            path: '/news_information/table',
            name: 'news_information_table',
            component: () => import('../views/news_information/table.vue'),
            meta: {
                index: 0,
                title: '新闻信息列表'
            }
        },
        {
            path: '/news_information/view',
            name: 'news_information_view',
            component: () => import('../views/news_information/view.vue'),
            meta: {
                index: 0,
                title: '新闻信息详情'
            }
        },
						    			// 操作日志路由
		{
		    path: '/operation_log/table',
		    name: 'operation_log_table',
		    component: () => import('../views/operation_log/table.vue'),
		    meta: {
		        index: 0,
		        title: '操作日志'
		    }
		},
	    // 用户路由
    {
        path: '/user/table',
        name: 'user_table',
        component: () => import('../views/user/table.vue'),
        meta: {
            index: 0,
            title: '用户列表'
        }
    },
    {
        path: '/user/view',
        name: 'user_view',
        component: () => import('../views/user/view.vue'),
        meta: {
            index: 0,
            title: '用户详情'
        }
    },
    {
        path: '/user/info',
        name: 'user_info',
        component: () => import('../views/user/info.vue'),
        meta: {
            index: 0,
            title: '个人信息'
        }
    },
    // 用户组路由
    {
        path: '/user_group/table',
        name: 'user_group_table',
        component: () => import('../views/user_group/table.vue'),
        meta: {
            index: 0,
            title: '用户组列表'
        }
    },
    {
        path: '/user_group/view',
        name: 'user_group_view',
        component: () => import('../views/user_group/view.vue'),
        meta: {
            index: 0,
            title: '用户组详情'
        }
    }
]

const router = new VueRouter({
    mode: 'hash',
    base: process.env.BASE_URL,
    routes
})

router.beforeEach((to, from, next) => {
    let token = to.query.token;
    if (token) {
        $.db.set("token", token, 120);
    }
    next();
})

router.afterEach((to, from, next) => {
    let title = "智能房屋租赁系统-admin";
    document.title = title;
})

export default router
