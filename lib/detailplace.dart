import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tourism_place.dart';

class DetailPlace extends StatefulWidget {
  final int dataIdx;

  const DetailPlace({Key? key, required this.dataIdx}) : super(key: key);

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final TourismPlace tourism_place = tourismPlaceList[widget.dataIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(tourism_place.name),
          backgroundColor: Colors.greenAccent,
        ),
        body: ListView(children: [
          Column(
            children: [
              // Data Tempat
              Center(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        tourism_place.name,
                        style: TextStyle(fontSize: 25),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(tourism_place.imageAsset, width: 300,),
                    ),
                    Container(
                      child: Text(tourism_place.description, textAlign: TextAlign.center,),
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    ),
                    Text(
                      "Lokasi       : ${tourism_place.location}",
                    ),
                    Text(
                      "Harga Tiket  : ${tourism_place.ticketPrice}"
                    ),
                    Text(
                      "${tourism_place.openDays} \n${tourism_place.openTime}"
                    ),
                  ],
                ),
              ),

              // Sekat gambar tempat
              Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Gambar Tempat Wisata",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Scrollview
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    child: SizedBox(height: 500, child: _build_tourismlist())),
              )
            ],
          )
        ]));
  }

  // tampilan scrollview
  Widget _build_tourismlist() {
    TourismPlace tourism_place = tourismPlaceList[widget.dataIdx];
    return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  // ListTile(
                  //   leading: Text("${index + 1} "),
                  // ),
                  Image.network(tourism_place.imageUrls[index]),
                ],
              ),
            )),
          );
        },
        itemCount: tourism_place.imageUrls.length);
  }
}
