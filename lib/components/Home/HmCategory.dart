import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    // 返回一个横向滚动的组件
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text("分类${index+1}", style: TextStyle(fontSize: 16, color: Colors.white),),
          );
      })
    );
  }
}