import 'package:flutter/material.dart';
import 'package:movies_app/src/models/film_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Film> films;
  
  const MovieHorizontal({this.films, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: true,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
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