import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas de cine'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: Container(
        child: Column(children:[
          _swiperCards()
        ]),
      ),
      
    );
  }
  
  _swiperCards() {
    return CardSwiper(list: [1,2,3,4]);
    // return Container(
    //   padding: EdgeInsets.only(top:10),
    //   width: double.infinity,
    //   height: 300,
    //   child: Swiper(
    //         itemBuilder: (BuildContext context, int index) {
    //           return new Image.network("http://via.placeholder.com/350x150", fit: BoxFit.fill);
    //           // return new Image.asset(
    //           //   images[index],
    //           //   fit: BoxFit.fill,
    //           // );
    //         },
    //         layout: SwiperLayout.STACK,
    //         itemWidth: 300,
    //         //indicatorLayout: PageIndicatorLayout.COLOR,
    //         //autoplay: true,
    //         itemCount: 4,
    //         //pagination: new SwiperPagination(),
    //         //control: new SwiperControl(),
    //       ),
    // );
  }
}