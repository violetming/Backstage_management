import axios from "axios"
import qs from "qs" 
// qs模块可以将对象转换为查询字符串

// 创建Axios实例
const instanche = axios.create()

const myaxios = {

    /**
     * 发送get请求，返回Axios Promise对象
     * @param {String} url 请求资源路径
     * @param {Object} params  请求参数
     */

    get(url, params) {
        return instanche({
            url, params, method: "GET"    // url:url,     params:params,
        })
    },

    /**
     * 基于Axios发送post请求
     * @param {String} url 请求资源路径
     * @param {Object} params 请求参数
     */
    post(url,params) {
        // qs模块，可以将params转换成查询字符串
        // {page:1 pagesize:20} ==> page=1&pagesize=20
        return instanche({
            url,
            data:qs.stringify(params),
            method:"POST"
        })
    },

}

export default myaxios