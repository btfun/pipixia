>flutter 阅读日记

flutter create xxx 创建项目
flutter run -d 'iPhone' 运行项目
flutter build apk 构建APK文件

StatelessWidget 不可变状态窗口部件
StatefulWidget  可变状态的窗口部件 在使用应用的时候就可以随时变化

***布局部分***
 MaterialApp() 表示程序主界面入口 相当WEB界面的于HTML appBar: body:
 Scaffold()    相当WEB界面的于body appBar: body:

 Container()  容器组件 child: 类似盒子模型 padding margin alignment decoration(装饰属性):设置背景和边框 背景图，边框，圆角，阴影和渐变

 Material() 独立窗口小部件
 IgnorePointer() 忽略组件，可触发组件外任意交互事件，在独立小窗口可使用
 AbsorbPointer() 可以做蒙层防止下层交互事件被触发 但是本体组件可能会遮挡下层事件

 ListView() 列表 默认的就是垂直滚动  ScrollDirection: Axis.horizontal 横向,  children:
 ListView.builder() 动态列表
 RefreshIndicator() 上下拉刷新组件

 
 Column() 垂直布局 children:
 Row()    水平布局 children:
 Stack()  层叠布局 children:

 安卓 ：LinearLayout  线性布局 , RelativeLayout 相对布局

 SafeArea() 安全区域组件 全面屏的上下 child:
 Padding()  child:
 Expanded() 可包含部件组件 变成灵活布局 child:
 Center()   居中 child:
 Card()     卡片式布局 child:
 Opacity()  设置透明度 child:

 GestureDetector() 事件组件 给不支持事件监测的组件添加事件监测 child: ,onTap()



 TextFiled( decoration: InputDecoration(hintText: "this is hint") //提示文字 )

 flutter 如何调用硬件与三方服务

 访问位置信息GPS的插件： geolocator
 用于访问相册与相机的插件：image_picker
 本地储存插件： Shared Preferences
 访问数据的插件：SQFilte
 用于推送通知的插件：firebase_messageing

** flutter里面使用动画库来包裹widgets
 AnimationController 动画控制类 可同时控制多个动画

>>>>>>>>>>>>>>>>>>>>>>>>>>>>依赖库>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  fluro: ^1.5.0
  dio: ^2.1.0  http请求
  fluttertoast: ^3.1.0  轻量级弹窗 可自己写
  image_picker: ^0.6.1+2 拍照
  shared_preferences: ^0.5.3+4 临时数据存储
  sqflite: ^1.1.6 永久数据存储
  flutter_screenutil: ^0.5.3 屏幕适配

  ***无线端app开发事项***
  1 UI组件布局
  2 路由管理
  3 http请求管理
  4 json解析
  5 数据状态管理
  6 APP日志管理
  7 三方以及自定义插件管理
  8 消息推送