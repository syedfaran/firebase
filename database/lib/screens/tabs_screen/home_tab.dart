import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/constants.dart';
import 'package:database/firebaseRepo.dart';
import 'package:database/screens/product_page.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final FirebaseRepo _repo = FirebaseRepo();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.35,
      width: MediaQuery.of(context).size.width / 1.05,
      child: FutureBuilder<QuerySnapshot>(
        future: _repo.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('loading',style: Constants.regularHeading,));
          } else {
            return ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: snapshot.data.docs.map((document) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AspectRatio(
                        aspectRatio: 1.1,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(productId: document.id)));
                          },
                          child: Card(
                              color: Colors.grey[200].withAlpha(255),
                              child: Image.network(document.data()['images'][0])),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(document.data()['name'],style: Constants.regularHeading,),
                          Text(
                            "\$${document.data()['price'].toString()}",style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900
                          )),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
