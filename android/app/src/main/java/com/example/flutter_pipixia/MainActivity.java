package com.example.flutter_pipixia;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

/*
 * 安卓入口主文件
 *
 */
public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
     //设置 系统状态栏为透明
     if(android.os.Build.VERSION.SDK_INT>=android.os.Build.VERSION_CODES.LOLLIPOP)
     {
         getWindow().setStatusBarColor(0);
     }
    //调用注册即可完成通道的建立
    GeneratedPluginRegistrant.registerWith(this);
       

  }
}
