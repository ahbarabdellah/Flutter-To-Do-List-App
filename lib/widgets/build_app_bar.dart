import 'package:flutter/material.dart';
import 'package:todoapp/colors/app_colors.dart';

AppBar buildAppBar() {
  return (AppBar(
    backgroundColor: AppColors.floralWhite,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          size: 40,
          color: Colors.black,
        ),
        const Text(
          'To-Do',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
                "https://avatars.githubusercontent.com/u/71067263?v=4"),
          ),
        )
      ],
    ),
  ));
}
