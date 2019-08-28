import 'api_user_conf.dart';

/*
 * APP 全局请求接口配置
 * 如果接口过多，为方便管理 可以分模块引入 统一由此文件对外提供
 * 
 * */

 class ApiConf{

  //****start******上下文***********
  static const String SAASROOT = "http://saas.mljia.cn"; //
  static const String WXROOT   = "http://wx.mljia.cn";     //
  static const String PAYROOT  = "http://pay.mljia.cn";   //
  //****end******上下文************
  
 /* *
  * 对外提供的API
  * 
  * */
  static const String USER_REGISTER = "$SAASROOT/user/register"; //注册
  static const String USER_LOGIN    = "$WXROOT/user/login"; //登录
  static const String USER_LOGOUT   = "$PAYROOT/user/logout"; //退出
 
   

 }
