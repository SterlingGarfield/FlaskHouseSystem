<template>
	<div>
			<el-form-item v-if="$check_register_field('add','name_of_landlord','/landlord_user/view')" label="房东姓名" prop="name_of_landlord">
				<el-input id="name_of_landlord" v-model="form['name_of_landlord']" placeholder="请输入房东姓名" ></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','landlord_gender','/landlord_user/view')" label="房东性别" prop="landlord_gender">
				<el-select id="landlord_gender" v-model="form['landlord_gender']">
			<el-option v-for="o in list_landlord_gender" :key="o" :label="o" :value="o">
			</el-option>
		</el-select>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','contact_number','/landlord_user/view')" label="联系号码" prop="contact_number">
				<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系号码" type="tel">
		</el-input>
				</el-form-item>
	
	</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		props:{

			form:{
				type: Object,
				default: function(){
					return {
							"name_of_landlord":  '' ,
								"landlord_gender":  '' ,
								"contact_number":  '' ,
						}
				}
			},

		},
		data() {
			return {
				field: "landlord_user_id",
				url_add: "~/api/landlord_user/add?",
				url_set: "~/api/landlord_user/set?",
				url_upload: "~/api/landlord_user/upload?",

									list_landlord_gender: ['男','女'],
								rules: {
					"name_of_landlord": [    {required: true,message: '房东姓名不能为空'},  ],
					"landlord_gender": [    {required: true,message: '房东性别不能为空'},  ],
					"contact_number": [   {validator: this.$is_phone,trigger: 'blur'},   {required: true,message: '联系号码不能为空'},  ],
				}

			}
		},
		methods: {
	
	
		
	
		
	
			},
		created() {
								}
	}
</script>
