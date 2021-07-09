import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/constants.dart';
import 'package:database/state.dart';
import 'package:database/widgets/customActionBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final String productId;

  const ProductPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomActionBar(
            hasBackArrow: true,
          ),
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('products')
                .doc(productId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('error${snapshot.error}'),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 500),
                  builder: (context, animate, child) {
                    return Opacity(
                      opacity: animate,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: animate * 4),
                        child: child,
                      ),
                    );
                  },
                  child: AspectRatio(
                    aspectRatio: 7 / 9,
                    child: ListView(children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 400,
                            color: Colors.blue[900],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 24),
                            child: Image.network(
                                snapshot.data.data()['images'][0]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 24),
                        child: Text(
                          snapshot.data.data()['name'],
                          style: Constants.regularHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 24),
                        child: Text(
                          '\$${snapshot.data.data()['price'].toString()}',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 24),
                        child: Text(
                          snapshot.data.data()['description'],
                          style: Constants.regularHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 24),
                        child: Text(
                          'Select Size',
                          style: Constants.regularHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 24),
                        child: _SizeSelection(list: snapshot.data.data()['size'],)
                      ),
                    ]),
                  ),
                );
              } else {
                return Center(child: Text('loading'));
              }
            },
          ),
        ],
      ),
    );
  }
}


class _SizeSelection extends StatelessWidget {
  final List list;
  const _SizeSelection({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro =Provider.of<NavigationState>(context,listen: true);
    return Container(
      height: 45.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: ()=>pro.setIndex(index),
              child: Container(
                width: 45.0,
                height: 45.0,
                color: pro.index==pro.currentIndex?Colors.blue[900]:Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
