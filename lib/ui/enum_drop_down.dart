import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnumDropDown<T extends Enum> extends StatefulWidget {
  T? selectedEnum;
  List<T> enumValues;
  void Function(T?)? onChanged;

  EnumDropDown(this.selectedEnum, this.enumValues, this.onChanged, {Key? key, }) : super(key:  key);

  @override
  State<EnumDropDown<T>> createState() => _EnumDropDownState<T>();
}

class _EnumDropDownState<T extends Enum> extends State<EnumDropDown<T>> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(items: widget.enumValues.map((item) => DropdownMenuItem<T>(
      value: item,
      child: Text(item.name, style: TextStyle(fontSize:16.0)),
    ))
        .toList(),
  onChanged: (newValue) {
              if( newValue != widget.selectedEnum) {
                widget.selectedEnum = newValue;
                widget.onChanged!(newValue);
              }
           });
  }
}