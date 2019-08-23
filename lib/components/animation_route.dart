import 'package:flutter/material.dart';


/*
 *  APP页面路由过渡动画组件
 * 
 * */
class AnimationRoute extends PageRouteBuilder{
  final Widget widget;
  AnimationRoute(this.widget)
    :super(
      transitionDuration:const Duration(milliseconds: 200), //设置动画持续的时间
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
      },
     transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            
            //渐隐渐现过渡效果
            // return FadeTransition(
            //   opacity: Tween(begin:0.0,end :1.0).animate(CurvedAnimation(
            //       parent:animation1,
            //       curve:Curves.fastOutSlowIn //设置动画的节奏，也就是常说的曲线
            //   )),
            //   child: child,
            // );

            // 缩放路由动画
            // return ScaleTransition(
            //     scale:Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
            //       parent:animation1,
            //       curve: Curves.fastOutSlowIn
            //       )),
            //       child:child
            // );

            // 左右滑动动画
            return SlideTransition(
              position: Tween<Offset>( begin: Offset(-1.0, 0.0), end:Offset(0.0, 0.0) )
              .animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
              )),
              child: child,
            );

            
        }  
      
    ); 
}