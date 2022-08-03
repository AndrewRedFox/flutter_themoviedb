import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../resources/resources.dart';

class MoveListWidget extends StatelessWidget {
  const MoveListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 163, //если все виджеты одинакового размера
        itemBuilder: (BuildContext context, int index) {
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
                      Image(image: AssetImage(Images.film1)),
                      SizedBox(width: 15),
                      Expanded(//из за того, что строка может быть сколь угодно длинной, то мы задаем ограничения через expanded
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text('Spider Man',
                            style: TextStyle(fontWeight: FontWeight.bold,),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                  
                            SizedBox(height: 5),
                            Text('April 7, 2021',
                            style: TextStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                  
                            SizedBox(height: 20),
                            Text('Peter Parkers life and reputation are in jeopardy as Mysterio reveals Spider-Mans identity to the world. In an attempt to rectify the situation, Peter turns to Stephen Strange for help, but things soon become much more dangerous.',
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
        });
  }
}
