import 'package:flutter/material.dart';

class Dpp {
  final String title;
  final List<DppItem> dppItems;

  Dpp({required this.title, required this.dppItems});
}

class DppItem {
  final String title;
  final Function onTap;

  DppItem({required this.title, required this.onTap});
}

Widget buildDppTiles(List<Dpp> dpps) {
  return ListView.builder(
    itemCount: dpps.length,
    itemBuilder: (context, index) {
      return _buildDppTile(dpps[index]);
    },
  );
}

Widget _buildDppTile(Dpp dpp) {
  return ExpansionTile(
    title: Text(
      dpp.title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    children: dpp.dppItems.map((item) {
      return ListTile(
        title: Text(item.title),
        onTap: () {
          item.onTap();
        },
      );
    }).toList(),
  );
}
