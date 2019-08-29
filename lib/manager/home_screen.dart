import 'package:flutter/material.dart'; 
// import 'package:flutter_pipixia/components/search_bar.dart';
import '../components/smart_drawer.dart';
import 'package:flutter_pipixia/global/theme_style.dart';
import '../global/util_loading.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key); 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.reorder),
            onPressed: () {
              //弹出侧边栏
                  Scaffold.of(context).openDrawer();
            } ,
          ),
        ),
      ),
       
      //侧边栏
      drawer: SmartDrawer(
        widthPercent: 0.8,
        child: Scaffold(
          body:  Column(
          children: <Widget>[
                
                  UserAccountsDrawerHeader(
                    accountName: Text('昵称：皮皮瞎我们走'),
                    accountEmail: Text('店铺编号：1182'),
                    onDetailsPressed:(){
                      // 当 accountName 或者 accountEmail 被点击的时候所触发的回调
                      print('do it');
                      //延迟 多次点击会异常
                      //  Future.delayed(Duration(milliseconds: 2500)).then((value) {
                      //     Navigator.pop(context); // 关闭侧边栏
                      // });
                    },
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/pipixia.png"),
                    ),
                    otherAccountsPictures: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage("images/pipixia.png"),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("images/pipixia.png"),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("images/pipixia.png"),
                      ), 
                    ] ,
                    margin: EdgeInsets.zero,
                ),
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                        color: Color(0xFFf0f0f0)
                   ),
                  child:  ListView(
                    children: <Widget>[
                      ListTile(
                          title:  Text('小猫钓鱼店'),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                              Future.delayed(Duration(milliseconds: 100)).then((value) {
                                  Navigator.pop(context); // 关闭侧边栏
                              });
                            }
                      ),
                      ListTile(
                          title:  Text('早起虫儿有鸟吃店'),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                              Future.delayed(Duration(milliseconds: 100)).then((value) {
                                  Navigator.pop(context); // 关闭侧边栏
                              });
                            }
                      ),
                      ListTile(
                          title:  Text('天天睡懒觉店'), 
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                              Future.delayed(Duration(milliseconds: 100)).then((value) {
                                  Navigator.pop(context); // 关闭侧边栏
                              });
                            }
                      ),
                       ListTile(
                          title:  Text('早起虫儿有鸟吃店'),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                              Future.delayed(Duration(milliseconds: 100)).then((value) {
                                  Navigator.pop(context); // 关闭侧边栏
                              });
                            }
                      ),
                      ListTile(
                          title:  Text('天天睡懒觉店'), 
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                              Future.delayed(Duration(milliseconds: 100)).then((value) {
                                  Navigator.pop(context); // 关闭侧边栏
                              });
                            }
                      ),
                    ],
                  ),
                ),
               
                Column(
                  children: <Widget>[
                    ClipRect(
                      child:  ListTile(
                        leading:  CircleAvatar(child: new Text("A")),
                        title:  Text('退出登录'),
                        onTap: () => { },
                      ),
                    ),
                   ClipRect(
                      child:  ListTile(
                        leading:  CircleAvatar(child: new Text("F")),
                        title:  Text('推荐好友'),
                        onTap: () => { },
                      ),
                    ),
                    ClipRect(
                      child:  ListTile(
                        leading:  CircleAvatar(child: new Text("S")),
                        title:  Text('系统设置'),
                        onTap: () => { },
                      ),
                    ),
                  ],
                )
          ],
        ),
        
        ),
       
      ),
      // body: SearchBarDemo()
      //内容主体
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){ 
                LoadingView.show( 
                  context: context,
                  message: '我是小妖怪，逍遥又自在，杀人不眨眼，吃人不撒盐',
                  backgroundColor:Colors.red
                );

            },
            child: Text('显示加载动画'),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
