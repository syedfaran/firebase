import 'package:database/screens/product_page.dart';
import 'package:database/state.dart';
import 'package:database/widgets/bottom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePage extends StatelessWidget {
  final productId;

  const HomePage({Key key, this.productId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        context.watch<TabProvider>().getAppbar,
        Center(child: context.watch<TabProvider>().getWidget),
        Align(alignment: Alignment.bottomCenter,child: BottomTabs()),
      ],
    );
  }
}


