import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MiscWidgets {

  static  DropdownButton<String> createDropDownButton(String? selectedItem, List<String> items,
      Function(String?) onChanged) {
    return DropdownButton<String>(
      value: selectedItem,
      items: items.map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item, style: TextStyle(fontSize:14.0)),
      ))
          .toList(),
      onChanged: (item) => onChanged(item),
    );
  }
  static InkWell createLink(String url, String description) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          description,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      onTap: () {
        print('Launching url: $url');
        launchUrl(Uri.parse(url));
      }
    );
  }


}