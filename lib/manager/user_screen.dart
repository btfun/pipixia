import 'package:flutter/material.dart'; 

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

class _UserPageState extends State<UserPage> {
  
  //插入渲染树时调用，只调用一次
  @override
  void initState() { 
    super.initState();
    
  }
  //组件即将销毁时调用 最后
  @override
  void dispose() { 
    super.dispose();
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
      ),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ), 
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

/* * *
 * 
 *  下面是私有方法
 * 
 * * */
 


}
