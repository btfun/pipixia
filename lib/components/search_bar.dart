import 'package:flutter/material.dart'; 

/* *
 * 搜索条
 * 
 * 
 * 
 * */

class SearchBarDemo extends StatefulWidget {
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('SearchBarDemo'),
        actions:<Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
               showSearch(context:context,delegate: searchBarDelegate());
            }
            // showSearch(context:context,delegate: searchBarDelegate()),
          ),
        ]
      )
    );

  }
}

const searchList = [
  "jiejie-大长腿",
  "jiejie-水蛇腰",
  "gege1-帅气欧巴",
  "gege2-小鲜肉"
];

const recentSuggest = [
  "推荐-1",
  "推荐-2"
];

class searchBarDelegate extends SearchDelegate<String>{

  //搜索条右侧的按钮执行方法
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
    ];
  }
  //搜索栏左侧的图标和功能的编写
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: transitionAnimation
              ),
        onPressed: () => close(context, null)
      );
  }
  //搜到到内容后的展现
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  //设置推荐，就是我们输入一个字，然后自动为我们推送相关的搜索结果
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                          TextSpan(
                              text: suggestionList[index].substring(query.length),
                              style: TextStyle(color: Colors.grey)
                          )
                      ]
                  )
                ),
          ));
  }


}