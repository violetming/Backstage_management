// src/http/index.js
import directorApi from './apis/DirectorApi'
import actorApi from './apis/actorApi'
import movieApi from './apis/MovieApi'
import cinemaapi from './apis/CinemaApi'
import adminApi from './apis/AdminApi'
import cinemaRoomApi from './apis/CinemaRoomApi'
import movieThumbApi from './apis/MovieThumbApi'
import showingonPlanApi from './apis/ShowingonPlanApi'
 //封装http接口

const httpApi={ //封装http接口
  actorApi,
  directorApi,
  movieApi,
  cinemaapi,
  adminApi,
  cinemaRoomApi,
  movieThumbApi,
  showingonPlanApi,


}

export default httpApi