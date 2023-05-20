<template>
  <div>
    <div 
      style="height:250px; border:1px solid #666;"
      id="mapContainer">
    </div>
    <el-divider content-position="left">电影院列表</el-divider>
    
    <!-- 表格 -->
    <el-table :data="cinemas">
      <el-table-column 
        sortable
        :sort-method="sortByName"
        label="影院名称" 
        prop="cinema_name"
        width="280px">
      </el-table-column>
      <el-table-column label="影院地址" prop="address"></el-table-column>
      <el-table-column label="影院位置" width="200px">
        <template slot-scope="scope">
          {{scope.row.province}}
          {{scope.row.city}}
          {{scope.row.district}}
        </template>
      </el-table-column>
      <el-table-column label="操作" width="230px">
        <template slot-scope='scope'>
          <!-- 点击确定地址放大 -->
          <el-button
          @click='moveToPossition(scope.row.longitude,scope.row.latitude)'
          size="small" type="info" icon="el-icon-location-outline" circle></el-button>
          <!-- 跳转到放映厅列表 -->
          <el-button 
            @click='$router.push(`/home/cinema-room-list/${scope.row.id}`)'
            size="small" type="primary" icon="el-icon-view" circle></el-button>
          <!-- 修改影院信息 -->
          <el-button 
           @click="$router.push(`/home/cinemaupdate/${scope.row.id}`)"
          size="small" type="warning" icon="el-icon-edit" circle></el-button>
          <!-- 删除影院 -->
          <el-button size="small" type="danger" icon="el-icon-delete" circle></el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader';
import httpApi from '@/http';

export default {
  
  data() {
    return {
      cinemas: [], // 保存所有影院信息
    }
  },

  methods: {
    moveToPossition(lng,lat){
      console.log(lng,lat);
      this.map.setZoomAndCenter(15,[lng,lat],false,1000)
    },
    initMap(){
      AMapLoader.load({
        key:"33082ae5557f99f63935379f6c750b47",             // 申请好的Web端开发者Key，首次调用 load 时必填
        version:"2.0",      // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
        plugins:[],       // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      }).then((AMap)=>{
        this.map = new AMap.Map("mapContainer",{  //设置地图容器id
          viewMode:"3D",    //是否为3D地图模式
          zoom:11,           //初始化地图级别
          center:[116.397505,39.907648], //初始化地图中心点位置
        });
        // 地图加载完毕后，加载影院列表
        this.listCinemas()

      }).catch(e=>{
        console.log(e);
      })
    },

    /** 自定义排序规则  将会传入两个元素 需要返回数字 -1  0  1 */
    sortByName(a, b){
      return b.length - a.length
    },

    // 加载所有影院信息
    listCinemas() {
      httpApi.cinemaapi.query().then(res=>{
        console.log(res)
        this.cinemas = res.data.data
        // 遍历所有的影院，获取影院的经纬度，显示marker
        this.cinemas.forEach(item=>{
          let lnglat = [item.longitude, item.latitude]
          let marker = new AMap.Marker({
            position: lnglat
          })
          this.map.add(marker)
        })
      })
    }
  },

  /** 生命周期 */
  mounted(){
    // 加载地图
    this.initMap()
  },

};
</script>

<style lang="scss" scoped>
</style>