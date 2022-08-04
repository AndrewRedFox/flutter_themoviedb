import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description
  });
}

class MoveListWidget extends StatefulWidget {


  MoveListWidget({Key? key}) : super(key: key);

  @override
  State<MoveListWidget> createState() => _MoveListWidgetState();
}

class _MoveListWidgetState extends State<MoveListWidget> {
  final _movies =[
    Movie(
      imageName: Images.film1,
      title: 'Spider Man',
      time: 'April 7, 2021',
      description: 'Peter Parkers life and reputation are in jeopardy as Mysterio reveals Spider-Mans identity to the world. In an attempt to rectify the situation, Peter turns to Stephen Strange for help, but things soon become much more dangerous.'
    ),
    Movie(
      imageName: Images.film1,
      title: 'Doctor Durka',
      time: 'April 7, 2021',
      description: 'Peter Parkers life and reputation are in jeopardy as Mysterio reveals Spider-Mans identity to the world. In an attempt to rectify the situation, Peter turns to Stephen Strange for help, but things soon become much more dangerous.'
    ),
  ];

  var _filteredMovies = <Movie> [];

  final _searchController = TextEditingController();

  void _searchMovies() {//вызывается каждый раз, когда пользователь что то введет
    final query = _searchController.text;
    if(query.isNotEmpty){
      _filteredMovies = _movies.where((Movie movie) {
       return movie.title.toLowerCase().contains(query.toLowerCase());//возврашает элекмент из списка
      }).toList();
    } else{
      _filteredMovies = _movies;
    }

    setState(() {}); //обновлние состоания=> перерисовка

  }

  @override
  void initState() {//метод вызывается один раз с самого начала
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {//в билде только верстка
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70), //чтобы поиск и фильмы не перекрывались
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,//клава закрывается, как только начинается скрол
            itemCount: _filteredMovies.length,
            itemExtent: 163, //если все виджеты одинакового размера
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(//чтобы работал InkWell
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black.withOpacity(0.2)), //черный цвет с прозрачностью 0,2
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0,2)//сдвигаем тень из под контейнера
                          )
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,//скругляет края
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(width: 15),
                          Expanded(//из за того, что строка может быть сколь угодно длинной, то мы задаем ограничения через expanded
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(movie.title,
                                style: TextStyle(fontWeight: FontWeight.bold,),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                      
                                SizedBox(height: 5),
                                Text(movie.time,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                      
                                SizedBox(height: 20),
                                Text(movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis//добавляет 3 точки в конце
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(//нужен чтобы InkWell корректно работал
                      color: Colors.transparent,//делает material прозрачным
                      child: InkWell(//отслеживает нажатия на контент
                        onTap: (){//карточка фильма некликабельна, но поверх лежит InkWell с которым мы взаимодействуем 
                          print('Tap');
                        },
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    )
                  ],
                ),
              );
            }), 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  label: Text('Search:'),
                  filled: true,
                  fillColor: Colors.white.withAlpha(235),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
      ],
    );
  }
}
