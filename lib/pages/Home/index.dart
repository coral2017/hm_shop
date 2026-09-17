import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerList = [
    BannerItem(id: "1", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png"),
    BannerItem(id: "2", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nvshen_sj.png"),
    BannerItem(id: "3", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/xinnian_sj.png"),
  ];
  // 包裹滚动容器的内容
  List<Widget> _getScrollChildren() {
  return [
    //轮播图组件
    SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)), 
    //间距组件
    SliverToBoxAdapter(child: SizedBox(height: 10,)),
    //分类组件
    SliverToBoxAdapter(child: HmCategory()),
    //间距组件
    SliverToBoxAdapter(child: SizedBox(height: 10,)),
    //推荐组件
    SliverToBoxAdapter(child: HmSuggestion()),
    //间距组件
    SliverToBoxAdapter(child: SizedBox(height: 10,)),
    //热门组件
    SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: HmHot()),
            SizedBox(width: 10,),
            Expanded(child: HmHot()),
          ],
        ),
      ),
    ),
    //间距组件
    SliverToBoxAdapter(child: SizedBox(height: 10,)),
    //无限滚动列表
    HmMoreList()
  ];
}
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren(),);
  }
}