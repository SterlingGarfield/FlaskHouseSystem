<template>
  <el-main class="bg table_wrap">
    <el-form label-position="right" :model="query" class="form p_4" label-width="120">
      <el-row class="rows row1">

          
                                                              <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="合同编码">
                                                      <el-input v-model="query.contract_code"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="房屋标题">
                                                      <el-input v-model="query.house_title"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                                                                                                                                                                                                                                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="合同名称">
                                                      <el-input v-model="query.contract_name"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="签订时间">
                          							<el-date-picker v-model="query.signing_time" type="daterange" range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期"></el-date-picker>
						                        </el-form-item>
                    </el-col>
                                                                                                                                    <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
            <el-form-item label="支付状态">
              <el-select v-model="query.pay_state">
                <el-option value="">全部</el-option>
                <el-option value="未支付">未支付</el-option>
                <el-option value="已支付">已支付</el-option>
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
            <el-button v-if="$check_action('/lease_contract/table','del') || $check_action('/lease_contract/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
                        </el-col>
       
        </el-col>
      </el-row>
    </el-form>
	    <el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
	                <el-table-column fixed type="selection" tooltip-effect="dark" width="55">
            </el-table-column>
                                                  <el-table-column prop="contract_code" @sort-change="$sortChange" label="合同编码"                                v-if="$check_field('get','contract_code')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="booking_code" @sort-change="$sortChange" label="预约编码"                                v-if="$check_field('get','booking_code')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="house_title" @sort-change="$sortChange" label="房屋标题"                                v-if="$check_field('get','house_title')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="area" @sort-change="$sortChange" label="所在区域"                                v-if="$check_field('get','area')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="house_type" @sort-change="$sortChange" label="房屋户型"                                v-if="$check_field('get','house_type')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="housing_rent" @sort-change="$sortChange" label="房屋租金"                                v-if="$check_field('get','housing_rent')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="housing_deposit" @sort-change="$sortChange" label="房屋押金"                                v-if="$check_field('get','housing_deposit')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="landlord_user" @sort-change="$sortChange" label="房东用户"                                v-if="$check_field('get','landlord_user')" min-width="200">
                                      <template slot-scope="scope">
                      {{ get_user_landlord_user(scope.row['landlord_user']) }}
                    </template>
                                </el-table-column>
                                              <el-table-column prop="tenant_user" @sort-change="$sortChange" label="租客用户"                                v-if="$check_field('get','tenant_user')" min-width="200">
                                      <template slot-scope="scope">
                      {{ get_user_tenant_user(scope.row['tenant_user']) }}
                    </template>
                                </el-table-column>
                                              <el-table-column prop="lease_months" @sort-change="$sortChange" label="租赁月数"                                v-if="$check_field('get','lease_months')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="total_amount" @sort-change="$sortChange" label="合计金额"                                v-if="$check_field('get','total_amount')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="contract_name" @sort-change="$sortChange" label="合同名称"                                v-if="$check_field('get','contract_name')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="signing_time" @sort-change="$sortChange" label="签订时间"                                v-if="$check_field('get','signing_time')" min-width="200">
                                      <template slot-scope="scope">
                      {{ $toTime(scope.row["signing_time"],"yyyy-MM-dd") }}
                    </template>
                                </el-table-column>
                                              <el-table-column prop="contract_documents" @sort-change="$sortChange" label="合同文件"                                v-if="$check_field('get','contract_documents')" min-width="200">
                                      <template slot-scope="scope">
                      <a :href="$fullUrl(scope.row['contract_documents'])" target="_blank" style="color: rgb(64, 158, 255);">点击下载</a>
                    </template>
                                </el-table-column>
                                              <el-table-column prop="terms_of_lease" @sort-change="$sortChange" label="租赁条款"                                v-if="$check_field('get','terms_of_lease')" min-width="200">
                                </el-table-column>
                    				        
        
                  <el-table-column label="支付状态" prop="pay_state">
          </el-table-column>

          <el-table-column label="支付类型" prop="pay_type">
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

        
        
        
        
        

                <el-table-column fixed="right" label="操作" min-width="120" v-if="$check_action('/lease_contract/table','set') || $check_action('/lease_contract/view','set') || $check_action('/lease_contract/view','get')
												|| $check_action('/maintenance_records/table','add') || $check_action('/maintenance_records/view','add')
						|| $check_action('/complaint_records/table','add') || $check_action('/complaint_records/view','add')
											 ">
        

      <template slot-scope="scope">
        <router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
                     v-if="$check_action('/lease_contract/table','set') || $check_action('/lease_contract/view','set') || $check_action('/lease_contract/view','get')"
                                 :to="'./view?' + field + '=' + scope.row[field]"
                                 size="small">
          <span>详情</span>
        </router-link>
                                        <!--跨表按钮-->
                  					                    <el-button class="el-button el-button--small is-plain el-button--default" style="margin: 5px !important;" size="small"  @click="to_table(scope.row,'/maintenance_records/view')" v-if="($check_action('/maintenance_records/table','add') || $check_action('/maintenance_records/view','add')) && !scope.row['maintenance_records_limit']">
                      <span>维修申请</span>
                    </el-button>
					                  					                    <el-button class="el-button el-button--small is-plain el-button--default" style="margin: 5px !important;" size="small"  @click="to_table(scope.row,'/complaint_records/view')" v-if="($check_action('/complaint_records/table','add') || $check_action('/complaint_records/view','add')) && !scope.row['complaint_records_limit']">
                      <span>在线投诉</span>
                    </el-button>
					                                                                              <el-button class="el-button el-button--small is-plain el-button--default" style="margin: 5px !important;" size="small" @click="openPayModal(scope.row)" v-if="scope.row.pay_state==='未支付' && ($check_pay('/lease_contract/table'))">
              <span>支付</span>
            </el-button>
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
                                                                                                                                                                                                                                                                    <el-dialog
            title="支付"
            :visible.sync="payModalVisible"
            width="500px"
        >
          <el-tabs v-model="pay_obj.payActiveName" :stretch="true">
            <el-tab-pane label="微信" name="微信">
              <div style="width: 80%;margin: 0 auto;">
                <div style="width: 60%;margin: 30px auto;">
                  <el-image style="width: 100%;" :src="require('../../../public/wx.png')"
                            :preview-src-list="[require('../../../public/wx.png')]">
                    <div slot="error" class="image-slot">
                      <img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
                    </div>
                  </el-image>
                </div>
                <div style="width: 80%;margin: 0 auto;">
                  <div style="width: 100%;background-color: #409EFF;color: white;font-size: 14px;text-align: center;line-height: 40px;cursor: pointer" @click="submitPay()">确认支付</div>
                </div>
              </div>
            </el-tab-pane>
            <el-tab-pane label="支付宝" name="支付宝">
              <div style="width: 80%;margin: 0 auto;">
                <div style="width: 60%;margin: 30px auto;">
                  <el-image style="width: 100%;" :src="require('../../../public/alipay.png')"
                            :preview-src-list="[require('../../../public/alipay.png')]">
                    <div slot="error" class="image-slot">
                      <img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
                    </div>
                  </el-image>
                </div>
                <div style="width: 80%;margin: 0 auto;">
                  <div style="width: 100%;background-color: #409EFF;color: white;font-size: 14px;text-align: center;line-height: 40px;cursor: pointer" @click="submitPay()">确认支付</div>
                </div>
              </div>
            </el-tab-pane>
            <el-tab-pane label="网银" name="网银">
              <div style="width: 80%;margin: 0 auto;margin-top: 30px;">
                <div style="width: 80%;margin: 0 auto;">
                  <div style="line-height: 40px">请输入网银账号：</div>
                </div>
                <div style="width: 80%;margin: 0 auto;">
                  <el-input v-model="pay_obj.account" placeholder="请输入网银账号"></el-input>
                </div>
              </div>
              <div style="width: 80%;margin: 0 auto;margin-top: 20px;">
                <div style="width: 80%;margin: 0 auto;">
                  <div style="line-height: 40px">请输入支付密码，6位数字：</div>
                </div>
                <div style="width: 80%;margin: 0 auto;">
                  <el-input placeholder="请输入密码" v-model="pay_obj.password" show-password maxlength="6"></el-input>
                </div>
              </div>
              <div style="width: 80%;margin: 0 auto;margin-top: 40px;">
                <div style="width: 100%;background-color: #409EFF;color: white;font-size: 14px;text-align: center;line-height: 40px;cursor: pointer" @click="submitPay()">确认支付</div>
              </div>
            </el-tab-pane>
          </el-tabs>
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
        url_get_list: "~/api/lease_contract/get_list?like=0",
        url_del: "~/api/lease_contract/del?",

        // 字段ID
        field: "lease_contract_id",
        // 查询
        query: {
          "size": 7,
          "page": 1,
                                                                      "contract_code": "",
                                                                                                                                      "house_title": "",
                                                                                                                                                                                                                                                                                                                                          "contract_name": "",
                                                                                                          "signing_time": "",
                                                                                                                                      "pay_state":"",
                                "login_time": "",
          "create_time": "",
          "orderby": `create_time desc`
        },

                  // 数据
        list: [],
                      payModalVisible:false,
            pay_obj:{
              payActiveName:"微信",
              account:"",
              password:"",
              id:""
            },
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  // 用户列表
                list_user_landlord_user: [],
                                                                                      // 用户列表
                list_user_tenant_user: [],
                                                                                                                                                                                                                                                            		  		  message: '',
		      }
    },
    methods: {
  	      	                    	    	            // 关闭弹框
      closeModal(){
        this.showModal = false;
      },
        		  /**
		   * @description 获取到列表事件
		   * @param {Object} res 响应结果
		   */
		  get_list_after: function get_list_after(res, func, url) {
		  	let _this = this
					  			  	_this.list.map((item) => {
		  		let param = {
		  			source_table: "lease_contract",
		  			source_id: item.lease_contract_id,
		  			source_user_id: _this.user.user_id
		  		};
		  		if(item.maintenance_records_limit_times > 0){
		  			_this.$get("~/api/maintenance_records/count?",param,(result)=>{
		  				if(result){
		  					if(result.result >= item.maintenance_records_limit_times){
		  						_this.$set(item,'maintenance_records_limit',true);
		  					}else{
		  						_this.$set(item,'maintenance_records_limit',false);
		  					}
		  				}
		  			})
		  		}else{
		  			_this.$set(item,'maintenance_records_limit',false);
		  		}
		  		Object.assign(item, param)
		  	})
		  			  	_this.list.map((item) => {
		  		let param = {
		  			source_table: "lease_contract",
		  			source_id: item.lease_contract_id,
		  			source_user_id: _this.user.user_id
		  		};
		  		if(item.complaint_records_limit_times > 0){
		  			_this.$get("~/api/complaint_records/count?",param,(result)=>{
		  				if(result){
		  					if(result.result >= item.complaint_records_limit_times){
		  						_this.$set(item,'complaint_records_limit',true);
		  					}else{
		  						_this.$set(item,'complaint_records_limit',false);
		  					}
		  				}
		  			})
		  		}else{
		  			_this.$set(item,'complaint_records_limit',false);
		  		}
		  		Object.assign(item, param)
		  	})
		  																																																				  },
        
                  get_list_before(param){
            var user_group = this.$store.state.user.user_group;
            if(user_group != "管理员"){
                                  let sqlwhere = "(";
                                                                                                                                                                                                                                                                                                                                                                                          if(user_group=="房东用户"){
                            sqlwhere+= "landlord_user = " + this.$store.state.user.user_id + " or ";
                          }
                                                                                              if(user_group=="租客用户"){
                            sqlwhere+= "tenant_user = " + this.$store.state.user.user_id + " or ";
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
                                                          /**
               * 获取租客用户用户列表
               */
              async get_list_user_tenant_user() {
                var json = await this.$get("~/api/user/get_list?user_group=租客用户");
                if(json.result && json.result.list){
                  this.list_user_tenant_user = json.result.list;
                }
                else if(json.error){
                  console.error(json.error);
                }
              },

              get_user_tenant_user(id){
                var obj = this.list_user_tenant_user.getObj({"user_id":id});
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
                                                                                                                                                                                                                                                  openPayModal(v){
            this.pay_obj.id = v.lease_contract_id
            this.payModalVisible = true
          },
          submitPay(){
            let _this = this;
			if(_this.pay_obj.payActiveName == "网银"){
				if(_this.pay_obj.account == ""){
					_this.$toast("请输入网银账号", 'danger');
					return false
				}
				if(_this.pay_obj.password.length < 6){
					_this.$toast("请输入6位数的支付密码", 'danger');
					return false
				}
			}
            let url = this.$toUrl(this.query, "~/api/lease_contract/set?lease_contract_id="+this.pay_obj.id);
            let param = {"pay_state":"已支付","pay_type":this.pay_obj.payActiveName}
            this.$post(url, param, function(json, status) {
              console.log("提交结果：" ,json);
              if (json.result) {
                _this.$toast('支付成功！', 'success');
                _this.payModalVisible = false;
                _this.get_list();
              } else if (json.error) {
                _this.$toast(json.error.message, 'danger');
              }
            });
          },
                        		      deleteRow(index, rows) {
        rows.splice(index, 1);
      },

    },
	    created() {
                                                                                                                                                                                                                                                                                                      this.get_list_user_landlord_user();
                                                                          this.get_list_user_tenant_user();
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
