import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController valueController = TextEditingController();
  final void Function(String) onSearch;
  final String? hint;

  SearchField({
    required this.onSearch,
    this.hint,
  });

  String get value => valueController.text;

  Widget build(BuildContext context) {
    return Container(
      height: 42,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          hintText: hint ?? "",
        ),
        onFieldSubmitted: onSearch,
      ),
    );
  }
}
