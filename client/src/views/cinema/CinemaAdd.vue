<template>
  <div>
    <!-- 表单 -->
    <el-form
      label-width="100px"
      :rules="rules"
      ref="form"
      :model="form"
      style="width: 600px"
    >
      <el-form-item label="电影院名称" prop="cinema_name">
        <el-input v-model="form.cinema_name"></el-input>
      </el-form-item>
      <el-form-item label="选择位置">
        <div
          id="container"
          style="
            height: 200px;
            border: 1px solid #666;
            padding: 0px;
            margin: 0px;
          "
        ></div>
      </el-form-item>
      <el-form-item label="详细地址" prop="address">
        <el-input v-model="form.address"></el-input>
      </el-form-item>
      <el-form-item label="省份" prop="province">
        <el-input v-model="form.province"></el-input>
      </el-form-item>
      <el-form-item label="城市" prop="city">
        <el-input v-model="form.city"></el-input>
      </el-form-item>
      <el-form-item label="地区" prop="district">
        <el-input v-model="form.district"></el-input>
      </el-form-item>
      <el-form-item label="经度" prop="longitude">
        <el-input v-model="form.longitude"></el-input>
      </el-form-item>
      <el-form-item label="纬度" prop="latitude">
        <el-input v-model="form.latitude"></el-input>
      </el-form-item>
      <el-form-item label="选择标签" prop="tags">
        <el-select
          v-model="form.tags"
          multiple
          style="width: 100%"
          placeholder="请选择"
        >
          <el-option
            v-for="item in tags"
            :key="item.id"
            :label="item.tagname"
            :value="item.tagname"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submit">新增电影院</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
import httpApi from "@/http";
export default {
  data() {
    return {
      tags: [],
      form: {
        cinema_name: "",
        address: "",
        province: "",
        city: "",
        district: "",
        longitude: "",
        latitude: "",
        tags: [],
      },
      rules: {
        cinema_name: [{ required: true, message: "必填项", trigger: "blur" }],
        address: [{ required: true, message: "必填项", trigger: "blur" }],
        province: [{ required: true, message: "必填项", trigger: "blur" }],
        city: [{ required: true, message: "必填项", trigger: "blur" }],
        district: [{ required: true, message: "必填项", trigger: "blur" }],
        longitude: [{ required: true, message: "必填项", trigger: "blur" }],
        latitude: [{ required: true, message: "必填项", trigger: "blur" }],
        tags: [{ required: true, message: "必填项", trigger: "blur" }],
      },
    };
  },
  methods: {
    submit() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          this.form.tags = this.form.tags.join(",");
          console.log(this.form);
          httpApi.cinemaapi.add(this.form).then((res) => {
            if (res.data.code == 200) {
              this.$message({
                message: "恭喜，影院新增成功",
                type: "success",
              });
              this.$router.push("/home/cinema-list");
            }
          });
        }
      });
    },

    initMap() {
      AMapLoader.load({
        key: "33082ae5557f99f63935379f6c750b47", // 申请好的Web端开发者Key，首次调用 load 时必填
        version: "2.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
        plugins: ["AMap.Geocoder"], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      })
        .then((AMap) => {
          this.map = new AMap.Map("container", {
            //设置地图容器id
            viewMode: "3D", //是否为3D地图模式
            zoom: 5, //初始化地图级别
            center: [105.602725, 37.076636], //初始化地图中心点位置
          });
          // 为map绑定点击事件，获取经纬度
          this.map.on("click", (e) => {
            console.log(e.lnglat);
            let lng = e.lnglat.KL;
            let lat = e.lnglat.kT;
            console.log({ lng, lat });
            let geocoder = new AMap.Geocoder()
            geocoder.getAddress([lng, lat], (status, result) => {
              console.log(status, result);
              this.form.address = result.regeocode.formattedAddress;
              let addr = result.regeocode.addressComponent;
              this.form.province = addr.province,
              this.form.city = addr.city ? addr.city : addr.province,
              this.form.district = addr.district,
              this.form.latitude = lat;
              this.form.longitude = lng;
            });
          });
        })
        .catch((e) => {
          console.log(e);
        });
    },
    qweqwe() {
      httpApi.cinemaapi.queryAllTags().then((res) => {
        console.log(res);
        this.tags = res.data.data;
      });
    },
  },
  mounted() {
    //DOM初始化完成进行地图初始化
    this.initMap();
    this.qweqwe();
  },
};
</script>

<style lang="scss" scoped>
</style>