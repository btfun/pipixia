import 'package:flutter/material.dart'; 

/*
 * APP用户主页
 * 可传入title参数 
 * 
 * */

class InfoPage extends StatefulWidget {
  InfoPage({Key key, this.title}) : super(key: key); 

  final String title;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  // @override
  // void initState() { 
  //   super.initState();
    
  // }

  @override
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Center(  
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( 'You have ' ), 
            Text( 'You have ' ), 
            Text( 'You have ' ), 
            Text( 'You have ' ), 
            Text( 'You have ' ), 
            Text( 'You have ' ), 
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
