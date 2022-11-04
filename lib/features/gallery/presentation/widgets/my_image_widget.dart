import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String url;

  const MyImageWidget({super.key, 
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
