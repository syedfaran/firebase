import 'package:database/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomTabs extends StatelessWidget {
  final List<IconData> list = [
    Icons.home_outlined,
    Icons.search,
    Icons.favorite_border,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TabProvider>(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list.asMap().map((i, element) => MapEntry(i, IconButton(
          icon: Icon(element),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: ()=>pro.page(i),
        ))).values.toList(),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[400].withOpacity(0.15),
      ),
    );
  }
}
