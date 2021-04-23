import 'package:flutter/material.dart';

import 'package:movies_app/src/providers/film_provider.dart';
import 'package:movies_app/src/widgets/card_swiper_widget.dart';
import 'package:movies_app/src/widgets/movie_horizonta.dart';

class HomePage extends StatelessWidget {
  FilmProvider filmProvider = new FilmProvider();

  @override
  Widget build(BuildContext context) {
    filmProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas de cine'),
        backgroundColor: Colors.indigoAccent,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _swiperCards(),
          _fotter(context),
        ]),
      ),
    );
  }

  _swiperCards() {
    return FutureBuilder(
      future: filmProvider.getFilmsInCinema(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(list: snapshot.data);
        } else {
          return Container(
              height: 350, child: Center(child: CircularProgressIndicator()));
        }
      },
    );

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

  _fotter(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text("Populares", style: Theme.of(context).textTheme.subtitle1),
          ),
          SizedBox(height: 10),
          StreamBuilder(
              stream: filmProvider.popularStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(films: snapshot.data, nextPage: filmProvider.getPopular,);
                } else {
                  return Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()));
                }
              })
          // FutureBuilder(
          //     future: filmProvider.getPopular(),
          //     builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          //       if (snapshot.hasData) {
          //         return MovieHorizontal(films: snapshot.data);
          //       } else {
          //         return Container(
          //             height: 200,
          //             child: Center(child: CircularProgressIndicator()));
          //       }
          //     })
        ],
      ),
    );
  }
}
