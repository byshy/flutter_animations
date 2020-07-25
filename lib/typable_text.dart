import 'package:flutter/material.dart';

class TypeAbleTextFormField extends StatefulWidget {
  final String finalText;
  final InputDecoration decoration;
  final Animation<double> animation;

  TypeAbleTextFormField(
      {Key key, this.animation, this.finalText, this.decoration})
      : super(key: key);

  @override
  TypeAbleTextFormFieldState createState() {
    return new TypeAbleTextFormFieldState();
  }
}

class TypeAbleTextFormFieldState extends State<TypeAbleTextFormField> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: widget.decoration,
      controller: controller,
    );
  }

  @override
  void initState() {
    super.initState();
    widget.animation.addListener(() {
      int totalLettersCount = widget.finalText.length;
      int currentLettersCount =
          (totalLettersCount * widget.animation.value).round();
      setState(() {
        controller.text = widget.finalText.substring(0, currentLettersCount);
      });
    });
  }
}
