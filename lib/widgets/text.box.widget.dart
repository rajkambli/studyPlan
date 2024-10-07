import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utility/constant.dart';
import '../utility/utility.dart';

class TextBoxWidget extends StatefulWidget {

  final TextInputType? keyboardType;
  final String hintText;
  final String prefixText;
  final String originalText;
  final bool isPrefixVisible;
  final int maxLength;
  final bool isObscureEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String val) onChanged;

  const TextBoxWidget({super.key,
    this.keyboardType = TextInputType.text,
    this.prefixText = "",
    this.originalText = "",
    this.maxLength = 50,
    this.isPrefixVisible = false,
    this.isObscureEnabled = false,
    required this.hintText,
    required this.onChanged,
    required this.inputFormatters,
  });

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {

  final TextEditingController _controller = TextEditingController();
  Color borderBoxColor = Colors.white;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 10),
      decoration: BoxDecoration(
        color:Colors.transparent,
        border: Border.all(color: Utility.getHexColor("B8B8D2")),
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextFormField(
        obscureText: widget.isObscureEnabled && _isObscure,
        controller: _controller,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        cursorColor: Colors.black,
        maxLength: widget.maxLength,

        style: TextStyle(
            fontFamily: Constant.font,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          counterText: "",
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderBoxColor),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderBoxColor),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderBoxColor),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontFamily: Constant.font,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.transparent
          ),
          prefix: widget.isPrefixVisible ? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              widget.prefixText,
              style: TextStyle(
                  fontFamily: Constant.font,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ) : const SizedBox.shrink(),
          suffixIcon: widget.isObscureEnabled
              ? GestureDetector(
            onTap: () {
              setState(() {
                _isObscure = !_isObscure; // Toggle text visibility
              });
            },
            child: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
            ),
          )
              : null,
        ),

      ),
    );
  }
}
