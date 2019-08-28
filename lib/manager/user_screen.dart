import 'package:flutter/material.dart'; 
import './star_screen.dart';
import '../global/api_conf.dart';

/*
 * APP用户主页
 * 可传入title参数 
 * 
 * */

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key); 

  final String title;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with SingleTickerProviderStateMixin {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController controller;
  Animation<double> animation;
  double _R = 10;

  //插入渲染树时调用，只调用一次
  @override
  void initState() { 
    super.initState();
      // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源 
    controller = AnimationController(
        duration: const Duration(milliseconds: 20000), vsync: this);
        animation = Tween(begin: 10.0, end: 100.0).animate(controller)
        ..addListener(() {
          setState(() {
            _R = animation.value;
            
          });
      });

     

  }
  //组件即将销毁时调用 最后
  @override
  void dispose() { 
    super.dispose();
     controller.dispose(); // 资源释放
  }
  //移除渲染树时调用 倒数第二
  @override
  void deactivate() { 
    super.deactivate();
  }
 

  //构建组件时调用
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () {
              //弹出侧边栏
                  Scaffold.of(context).openDrawer();
            } ,
          ),
        ),
      ),
      key: _scaffoldKey,
      body: CustomPaint(
        painter: StarView(context, _R),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); //执行动画
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
      // body: Center(
      //   child:    RaisedButton(
      //             child: Text('点我试试呼出SnackBar&Drawer'),
      //             onPressed: () {
      //               _scaffoldKey.currentState.openDrawer();
      //               // _scaffoldKey.currentState.showSnackBar(const SnackBar(
      //               //     content: Text("我是通过ScaffoldState的方式呼出的SnackBar.")
      //               // ));
      //             },
      //           ),
      // ) ,
     
    );
  }

/* * *
 * 
 *  下面是私有方法
 * 
 * * */
 


}

