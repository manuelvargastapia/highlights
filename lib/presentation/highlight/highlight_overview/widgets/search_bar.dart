import 'package:flutter/material.dart';

// TODO: implement
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkResponse(
        onTap: () {
          // TODO: implement
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
