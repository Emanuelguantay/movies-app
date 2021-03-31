import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> list;

  CardSwiper({@required this.list});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top:10),
      // width: double.infinity,
      // height: 300,
      child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network("http://via.placeholder.com/350x150", fit: BoxFit.cover),
              );
              // return new Image.asset(
              //   images[index],
              //   fit: BoxFit.fill,
              // );
            },
            layout: SwiperLayout.STACK,
            itemWidth: _screenSize.width * 0.7,
            itemHeight: _screenSize.height * 0.5,
            //indicatorLayout: PageIndicatorLayout.COLOR,
            //autoplay: true,
            itemCount: list.length,
            //pagination: new SwiperPagination(),
            //control: new SwiperControl(),
          ),
    );
  }
}
