import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/star_gold.png",
          height: 20,
        ),
        Image.asset(
          "assets/images/star_gold.png",
          height: 20,
        ),
        Image.asset(
          "assets/images/star_gold.png",
          height: 20,
        ),
        Image.asset(
          "assets/images/star_gold.png",
          height: 20,
        ),
        Image.asset(
          "assets/images/star.png",
          height: 20,
        ),
        const SizedBox(width: 5),
        Text(
          "(4.0)",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        )
      ],
    );
  }
}
