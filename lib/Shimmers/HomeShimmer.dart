import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Number of shimmering items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.indigo,
          highlightColor: Colors.indigoAccent,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
            ),
            title: Container(
              height: 16,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 16,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
