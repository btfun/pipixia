import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';


/*
 * 网络请求
 *
 **/ 
 
Future $http(String url, String type, Object params, Options options) async{

      print('http>> 请求链接：$url ===>>>> 请求方式：$type ===>>> 请求参数：$params ');

      Response response; 
      Dio dio = new Dio();
          dio.options.connectTimeout=8000; //8s
          dio.options.contentType= ContentType.json;
          dio.options.responseType= ResponseType.json;

          //待添加请求拦截


      try{

          switch(type){
            case 'get':
              response = await dio.get(url, queryParameters: params , options:options );
            break;
            case 'post':
              response = await dio.post(url, queryParameters: params , options:options );
            break;
            case 'put':
              response = await dio.put(url, queryParameters: params , options:options );
            break;
            case 'delete':
              response = await dio.delete(url, queryParameters: params , options:options );
            break;
            default:
              response = await dio.get(url, queryParameters: params , options:options );
          }

      } on DioError catch(e){
        if (e.response != null) {
          response = e.response;
        } else {
          response = Response(statusCode: 599, statusMessage: "请求失败,稍后再试！");
        }

      }

      if(response.statusCode==200){
        return response.data;
      }else{
        throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      } 
      
}
