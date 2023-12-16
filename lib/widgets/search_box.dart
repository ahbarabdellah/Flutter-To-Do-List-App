import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchKeyword;
  final void Function(String)? onChanged;
  const SearchBox(
      {super.key, required this.searchKeyword, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.3), // Shadow color with opacity
              spreadRadius: 3, // Spread radius
              blurRadius: 3, // Blur radius
              offset: const Offset(0, 0), // Changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: TextField(
        onChanged: onChanged,
        controller: searchKeyword,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: InputBorder.none),
      ),
    );
  }
}
