import 'package:flutter/material.dart';
import 'package:prak_tugas2/tourism_place.dart';
import 'package:prak_tugas2/detailplace.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({Key? key}) : super(key: key);

  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Daftar Menu Wisata"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPlace(dataIdx: index);
              }));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: place.name)));
            },
            splashColor: Colors.green,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: 500,
              width: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                    SizedBox(height: 40,),
                    Image.network(place.imageUrls[0], width: 300,),
                    SizedBox(height: 15,),
                    Text(place.name,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'RobotoMono',
                      ),),
                    SizedBox(height: 10,),
                    Text(place.ticketPrice,
                      style: TextStyle(
                        // fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
