import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_pipixia/global/theme_style.dart';

import 'package:flutter_pipixia/manager/home_screen.dart';
import 'package:flutter_pipixia/manager/user_screen.dart';
import 'package:flutter_pipixia/manager/info.dart';
import 'package:flutter_pipixia/components/animation_route.dart';
import 'package:flutter_pipixia/global/util.dart';

/*
 * 主界面底部导航栏
 *  5个图标 4 + 1
 *  1个快捷页面
 *
 *  Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数
 *  Navigator.pop：是返回到上一个页面，使用时传递一个context（上下文）参数，使用时必须是有上级页面的
 */

 class BottomNavigationWidget extends StatefulWidget {
   _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
 }
 
 class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
   final _BottomAppBarColor=ThemeStyle.iconButton;
   int _currentIndex=0;

   List<Widget> list = List();

   //组件初始化状态
    @override
    void initState(){
          list
          ..add(MyHomePage(title: '皮皮瞎')) //返回调用者本身
          ..add(UserPage(title: '瞎皮皮'));

        super.initState();
    }

   //构建组件
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: list[_currentIndex],//默认显示的内容
       floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: '常回家看看',//长按提示 #fc49ae
          onPressed: (){
            // 中间加号的点击事件 
            //  Navigator.of(context).push(AnimationRoute(InfoPage()));

            //  Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
            //             return InfoPage(title:'s');
            //           })); 
            //  _showSimpleDialog(context);

             ToastView.show(context,'杀人不眨眼，吃人不撒盐');

          },
          child: Icon( Icons.add, color: ThemeStyle.iconButton ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,//居中浮动显示

        // bottomNavigationBar: _bottomNavigationBar()//使用规则导航
        bottomNavigationBar: _bottomAppBar()//使用不规则导航
        
       
     );
   }

/***************内部私有方法*********************/


/*
 *  规则的底部导航栏
 * 
 * */

  Widget _bottomNavigationBar(){
   //底部导航栏
   return BottomNavigationBar(
          items:[
              BottomNavigationBarItem(
                icon: Icon( Icons.home, color: _BottomAppBarColor ),
                title: Text( '主页', style: TextStyle(color: _BottomAppBarColor) )
              ),
              BottomNavigationBarItem(
                icon: Icon( Icons.account_box, color: _BottomAppBarColor),
                title: Text( '用户', style: TextStyle(color: _BottomAppBarColor) ) 
              ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type:BottomNavigationBarType.fixed // 悬浮
        );
 }

 /*
 *  不规则的底部导航栏
 * 
 * */
 Widget _bottomAppBar(){
   //底部工具栏 更灵活
   return BottomAppBar(
          color: Colors.white, //底部工具栏的颜色。
          shape: CircularNotchedRectangle(), //有缺口的圆形矩形
          child: Row(
            mainAxisSize: MainAxisSize.max, //
            mainAxisAlignment: MainAxisAlignment.spaceAround, // 平均放
            children: <Widget>[ 
               IconButton(
               icon: Icon(Icons.home),
               color: ThemeStyle.iconButton,
               tooltip: 'Navigation menu',
               onPressed:(){
                 setState(() {
                    _currentIndex= 0;       
                  });
               }
              ),
               IconButton(
               icon:Icon(Icons.account_box),
               color: ThemeStyle.iconButton,
               onPressed:(){
                 setState(() {
                    _currentIndex= 1;      
                  });
               }
             )
            ],
          ),
        );
 }

  _showSimpleDialog(context) {
    showDialog(
        barrierDismissible: true,// 设置点击 dialog 外部不取消 dialog，默认能够取消
        context: context,
        builder: (context) => SimpleDialog(
              // title: Text('我是个比较正经的标题...\n选择你的性别'),
              backgroundColor: CupertinoColors.white,
              // shape: Border.all(),
              // 这里传入一个选择器列表即可
             children: <Widget>[
               Text('sdadsa'),
               Text('tretreter'),
               Text('23486465'),
             ],
            ));
  }


 }
