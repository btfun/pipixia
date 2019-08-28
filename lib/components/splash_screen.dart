import 'package:flutter/material.dart';
import 'bottom_widget.dart';

/*
 *  app 闪屏动画
 * 
 *  1 有状态组件
 * 
 * */

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  void initState() { 
    super.initState();
    //vsync 垂直同步设置 需要 混入 with SingleTickerProviderStateMixin
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:1500));
    _animation = Tween(begin: 1.0,end:1.0).animate(_controller);


    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      //表示动画已经执行完毕
      if(status == AnimationStatus.completed){
        //执行操作
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>BottomNavigationWidget()),
          (route)=> route==null
        );
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    //周期结束时销毁减少开销
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
      child: Image.asset(
        'images/blibli.jpeg',
         fit:BoxFit.cover  // 充满父容器
        ), 
    );
  }
}