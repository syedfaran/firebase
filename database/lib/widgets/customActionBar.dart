import 'package:database/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  const CustomActionBar({Key key, this.title, this.hasBackArrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hasBackArrow?ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 45.0,
              width: 45.0,
              color: Colors.black,
              child: Center(child: IconButton(onPressed: (){
                Navigator.pop(context);
              },icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),)),
            ),
          ):Text(title,style: Constants.boldHeading,),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Container(
              height: 45.0,
              width: 45.0,
              //padding:const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
              color: Colors.black,
              child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontSize: 20.0))),
            ),
          ),
        ],
      ),
    );
  }
}
