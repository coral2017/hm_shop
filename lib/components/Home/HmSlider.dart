import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  final _controller = CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    final screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller,
      items: widget.bannerList.map((item) {
        return Container(
          child: Image.network(item.imgUrl, width: screenWidth, fit: BoxFit.cover),
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text("搜索...", style: TextStyle(fontSize: 16, color: Colors.white),)
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () => _controller.jumpToPage(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 6,
                width: _currentIndex == index ? 40 : 20,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.white : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          })
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],
    );
  }
}