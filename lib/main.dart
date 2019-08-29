import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pipixia/components/splash_screen.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:catcher/catcher_plugin.dart';

/*
 * APP 主入口文件
 *  
 * 
 * */

// void main() => runApp(MyApp());

void main() {

  CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  // CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
  //   EmailManualHandler(["625672881@qq.com"])
  // ]);
  // debugPaintSizeEnabled = true; 
  
  Catcher(MyApp(), debugConfig: debugOptions);

  // runApp(MyApp());

} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     // 方式一：默认设置宽度1080px，高度1920px 
    // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    //  // 方式二：设置宽度750px，高度1334px
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // // 方式三：设置宽度750px，高度1334px，根据系统字体进行缩放
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
    
    return MaterialApp(
      title: 'Flutter 全干之路 ',
      theme: ThemeData( 
        primarySwatch: Colors.yellow, //设置主题 默认蓝色
      ),
      home: SplashScreen(),
    );
  }
}

