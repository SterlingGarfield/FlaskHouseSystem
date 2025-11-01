<template>
  <div class="list_menu diy_menu">
    <router-link
            to="/user_center/index"
            class="menu_item"
            :class="{ selected: this.$route.path=== '/user_center/index'}"
     >
      <span class="left_span">个人首页</span>
      <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
    </router-link>
          <router-link
          to="/tenant_user/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/tenant_user/table'}"
          v-if="$check_action('/tenant_user/table','get')">
        <span class="left_span">{{ $page_title("/tenant_user/table") || 租客用户 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/landlord_user/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/landlord_user/table'}"
          v-if="$check_action('/landlord_user/table','get')">
        <span class="left_span">{{ $page_title("/landlord_user/table") || 房东用户 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/regional_classification/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/regional_classification/table'}"
          v-if="$check_action('/regional_classification/table','get')">
        <span class="left_span">{{ $page_title("/regional_classification/table") || 区域分类 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/huxing_classification/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/huxing_classification/table'}"
          v-if="$check_action('/huxing_classification/table','get')">
        <span class="left_span">{{ $page_title("/huxing_classification/table") || 户型分类 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/housing_information/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/housing_information/table'}"
          v-if="$check_action('/housing_information/table','get')">
        <span class="left_span">{{ $page_title("/housing_information/table") || 房屋信息 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/appointment_to_see_the_room/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/appointment_to_see_the_room/table'}"
          v-if="$check_action('/appointment_to_see_the_room/table','get')">
        <span class="left_span">{{ $page_title("/appointment_to_see_the_room/table") || 预约看房 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/lease_contract/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/lease_contract/table'}"
          v-if="$check_action('/lease_contract/table','get')">
        <span class="left_span">{{ $page_title("/lease_contract/table") || 租赁合同 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/maintenance_records/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/maintenance_records/table'}"
          v-if="$check_action('/maintenance_records/table','get')">
        <span class="left_span">{{ $page_title("/maintenance_records/table") || 维修记录 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/complaint_records/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/complaint_records/table'}"
          v-if="$check_action('/complaint_records/table','get')">
        <span class="left_span">{{ $page_title("/complaint_records/table") || 投诉记录 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/financial_statements/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/financial_statements/table'}"
          v-if="$check_action('/financial_statements/table','get')">
        <span class="left_span">{{ $page_title("/financial_statements/table") || 财务报表 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/news_information/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/news_information/table'}"
          v-if="$check_action('/news_information/table','get')">
        <span class="left_span">{{ $page_title("/news_information/table") || 新闻信息 }}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
      <router-link
              to="/user/collect"
              class="menu_item"
              :class="{ selected: this.$route.path=== '/user/collect'}"
              v-if="$check_action('/collect/list','get')">
        <span class="left_span">收藏</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
  </router-link>
	<router-link
	            to="/comment/table"
	            class="menu_item"
	            :class="{ selected: this.$route.path=== '/comment/table'}"
	            v-if="$check_action('/comment/table','get')">
	      <span class="left_span">评论管理</span>
	      <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
	</router-link>
  </div>
</template>

<script>
import mixin from "@/mixins/page.js";
export default {
  mixins: [mixin],
  data() {
    return {
    };
  },
  mounted() {
  },
  methods: {
  },

  components: {
  },
};
</script>

<style scoped>
.list_menu {
  flex: 0 0 25%;
  border-bottom: 1px solid #eee;
}
.menu_item {
  display: flex;
  justify-content: space-between;
  padding: 15px 20px;
  border: 1px solid #eee;
  border-bottom: none;
  background-color: #fff;
}
.menu_item.selected {
  background-color: #000;
}
.menu_item.selected span {
  color: #fff ;
}
.content {
  flex: 0 0 74%;
}
</style>
