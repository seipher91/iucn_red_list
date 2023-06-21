import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "ALL"),
    DropdownMenuItem(child: Text("Mammal"), value: "MAMMAL"),
    DropdownMenuItem(child: Text("Critically Endangered"), value: "CR"),
  ];
  return menuItems;
}
