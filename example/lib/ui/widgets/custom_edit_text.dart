/**
 * @ Author: Carlos Henry Céspedes <chenryhabana205@gmail.com>
 * @ Create Time: 2020-02-18 18:44:02
 * @ Modified by: Marcos Rodriguez Toranzo
 * @ Modified time: 2020-02-18 18:55:58
 * @ Description:
 */

import 'package:flutter/material.dart';

class IconedEditText extends StatefulWidget {
  final String hint;
  final String label;
  final IconData icon;
  final isHidenText;
  final TextEditingController controller;
  final TextInputType textType;
  final Function validator;

  IconedEditText(
      {this.controller,
      this.validator,
      this.hint,
      this.label,
      this.icon,
      this.isHidenText = false,
      this.textType = TextInputType.text});

  @override
  _IconedEditTextState createState() => _IconedEditTextState();
}

class _IconedEditTextState extends State<IconedEditText> {
  bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  getToogleButton() {
    return IconButton(
        icon: Icon(
          // Based on passwordVisible state choose the icon
          passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {
          // Update the state i.e. toogle the state of passwordVisible variable
          setState(() {
            passwordVisible = !passwordVisible;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
          elevation: 0,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: TextFormField(
            style: TextStyle(height: 1),
            keyboardType: widget.textType,
            controller: widget.controller,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              prefixIcon: Container(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                  )),
              border: InputBorder.none,
              labelText: widget.hint,
              hintText: widget.label,
              errorStyle: TextStyle(
                  height: 0.2,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              suffixIcon: widget.isHidenText ? getToogleButton() : null,
            ),
            obscureText: !passwordVisible && widget.isHidenText,
            validator: widget.validator,
          )),
    );
  }
}
