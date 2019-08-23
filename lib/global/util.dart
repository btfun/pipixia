import 'package:flutter/material.dart'; 

/*
 * 利用overlay实现Toast
 */

class _BounceOutCurve extends Curve {
  const _BounceOutCurve._();
  //定义一个弹跳一次后回弹的动画差值器
  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * ((2 + 1) * t + 2) + 1.0;
  }
}


class ToastView {

  // static ToastView preToast;

  static void show(BuildContext context,  String message) {

	 var overlayState = Overlay.of(context);
   //创建3个动画,显示的位移和渐显动画，Toast消失的渐隐动画
   var controllerShowAnim = new AnimationController(
      vsync: overlayState,
      duration: Duration(milliseconds: 250),
    );
    var controllerShowOffset = new AnimationController(
      vsync: overlayState,
      duration: Duration(milliseconds: 350),
    );
    var controllerHide = new AnimationController(
      vsync: overlayState,
      duration: Duration(milliseconds: 250),
    );

    var opacityAnim1 = new Tween(begin: 0.0, end: 1.0).animate(controllerShowAnim);

    var controllerCurvedShowOffset = new CurvedAnimation(
        parent: controllerShowOffset, curve: _BounceOutCurve._() );

    var offsetAnim = new Tween(begin: 30.0, end: 0.0).animate(controllerCurvedShowOffset);
    var opacityAnim2 = new Tween(begin: 1.0, end: 0.0).animate(controllerHide);
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry;

    
    overlayEntry = new OverlayEntry(builder: (context) {
    
      return  ToastWidget(
        opacityAnim1: opacityAnim1,
        opacityAnim2: opacityAnim2,
        offsetAnim: offsetAnim,
        child: _widgetOverlay(context,message)
      );
      
    });


    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    controllerShowAnim.forward();
    controllerShowOffset.forward();

    //两秒后，移除Toast
    Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
      controllerHide.forward();
    });
  }

  static _widgetOverlay(context,message){
//外层使用 Positioned 进行定位，控制在Overlay中的位置
    // return IgnorePointer(
    //       // top: MediaQuery.of(context).size.height * 0.8,
    //       ignoring: true,
    //       child:  Material(
    //         color: Colors.white.withOpacity(0),
    //         child:  Container(
    //           width: MediaQuery.of(context).size.width,
    //           alignment: Alignment.center,
    //           child:  Container(
    //             child:  Card(
    //               child:  Padding(
    //                 padding: EdgeInsets.all(8),
    //                 child:  Text(message),
    //               ),
    //               color: Colors.grey,
    //             ),
    //           ),
    //           margin: EdgeInsets.only(
    //               bottom: MediaQuery.of(context).size.height * 0.15,
    //               left: MediaQuery.of(context).size.width * 0.2,
    //               right: MediaQuery.of(context).size.width * 0.2,
    //             ),
    //         ),
    //       ));

    return IgnorePointer(
        ignoring: true,
        child: Container(
          child: Material(
            color: Colors.white.withOpacity(0),
            child: Container(
              child: Container(
                child: Text(
                  "$message",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.2,
                right: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
 

  }

}



class ToastWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> opacityAnim1;
  final Animation<double> opacityAnim2;
  final Animation<double> offsetAnim;

  ToastWidget({this.child, this.offsetAnim, this.opacityAnim1, this.opacityAnim2});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnim1,
      child: child,
      builder: (context, child_to_build) {
        return Opacity(
          opacity: opacityAnim1.value,
          child: AnimatedBuilder(
            animation: offsetAnim,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(0, offsetAnim.value),
                child: AnimatedBuilder(
                  animation: opacityAnim2,
                  builder: (context, _) {
                    return Opacity(
                      opacity: opacityAnim2.value,
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

 