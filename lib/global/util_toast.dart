import 'package:flutter/material.dart'; 

/*
 * 利用overlay实现Toast
 * 基本功能实现ok
 * 待实现防重复
 * 
 */

class ToastView {

  static void show({
        @required BuildContext context,        //组件上下文
        @required String message,              //信息文字
        Color backgroundColor=Colors.redAccent,//信息底色
        Color textColor=Colors.white,          //文字颜色
        double fontSize
      }) {
    //
	  var overlayState = Overlay.of(context);

    //创建3个动画控制器,显示的位移和渐显动画，Toast消失的渐隐动画
    var controllerShowAnim   =  AnimationController( vsync: overlayState, duration: Duration(milliseconds: 250) );
    var controllerShowOffset =  AnimationController( vsync: overlayState, duration: Duration(milliseconds: 350) );
    var controllerHide       =  AnimationController( vsync: overlayState, duration: Duration(milliseconds: 200) );


    var opacityShow =  Tween(begin: 0.0, end: 1.0).animate(controllerShowAnim);
    var offsetAnim  =  Tween(begin: 30.0, end: 0.0).animate(CurvedAnimation( parent: controllerShowOffset,  curve: _BounceOutCurve._() ));
    var opacityHide =  Tween(begin: 1.0, end: 0.0).animate(controllerHide);
      
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry  = new OverlayEntry(builder: (context) {
      return  ToastWidget(
        show: opacityShow,
        hide: opacityHide,
        offsetAnim: offsetAnim,
        child: _widgetOverlay(
            context: context,
            message: message,
            backgroundColor: backgroundColor,
            textColor: textColor,
            fontSize: fontSize
          )
      );
      
    });


    //往Overlay中插入插入OverlayEntry
    overlayState.insert(overlayEntry);
    //播放动画
    controllerShowAnim.forward();
    controllerShowOffset.forward();
    //两秒后，移除Toast
    Future.delayed(Duration(seconds: 2)).then((value) {
      controllerHide.forward();
      Future.delayed(Duration(milliseconds: 250)).then((value) {
        //移除
        overlayEntry.remove();
        overlayState=null;
      });
    });
  }

  static _widgetOverlay({
    @required context,
    @required message,
    Color backgroundColor,
    Color textColor,
    double fontSize
  }){
    //AbsorbPointer  IgnorePointer

    return IgnorePointer (
        ignoring: true,
        child: Container(
          alignment: Alignment.bottomCenter,//内容定位最底部
          child: Material(
            //使屏幕样式独立，并消除底色 
            color: Colors.redAccent.withOpacity(0),  
            child: Container(
                child: Text( "$message", style: TextStyle(color: textColor) ),
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.7),
                  borderRadius: BorderRadius.all( Radius.circular(5) ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.2,
                  right: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
          ),
        ),
      );

  }

}

class _BounceOutCurve extends Curve {
  const _BounceOutCurve._();
  //定义一个弹跳一次后回弹的动画差值器
  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * ((2 + 1) * t + 2) + 1.0;
  }
}

/* *
 *  动画模块
 * 
 * 
 *  */
class ToastWidget extends StatefulWidget {
 

  ToastWidget({this.child, this.offsetAnim, this.show, this.hide}): super();
  final Widget child;
  final Animation<double> show;
  final Animation<double> hide;
  final Animation<double> offsetAnim;

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> { 

  //初始化
  @override
  void initState() { 
    super.initState(); 

  }
  //销毁
  @override
  void dispose() { 
    super.dispose();
  }
  //创建
  @override
  Widget build(BuildContext context) { 

  /*
  * widget.show  widget.child //来访问传入的参数
  * AnimatedBuilder只能执行一个动画步骤 多次连续的动画需要多个AnimatedBuilder
  * 第一个AnimatedBuilder 的 child_to_build
  * */
    return AnimatedBuilder(
          animation: widget.show,//显示动画
          child: widget.child,
          builder: (context, child_to_build) {
            //显示值
            return Opacity(
              opacity: widget.show.value,
              child: AnimatedBuilder(
                animation: widget.offsetAnim,//抖动动画
                builder: (context, _) {
                  //抖动值
                  return Transform.translate(
                    offset: Offset(0, widget.offsetAnim.value),
                    child:  AnimatedBuilder(
                      animation: widget.hide,//隐藏动画
                      builder: (context, _) {
                        //隐藏值
                        return Opacity(
                          opacity: widget.hide.value,
                          child: child_to_build,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
    );
  }
}


 