import 'package:flutter/material.dart';
import 'package:movies_app/src/models/film_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Film> films;
  final Function nextPage;
  
  MovieHorizontal({this.films, this.nextPage, Key key}) : super(key: key);

  final _pageController = new PageController(initialPage: 1,
          viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() { 
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        nextPage();
      }
    });


    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: true,
        controller: _pageController,
        children: _cards(context),
      ),
    );
  }

  List<Widget>_cards(BuildContext context) {
    return films.map((film) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                image: NetworkImage(film.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 110,
              ),
            ),
            SizedBox(height: 5,),
            Text(film.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1)
          ]
        ),
      );
    }).toList();
  }
}