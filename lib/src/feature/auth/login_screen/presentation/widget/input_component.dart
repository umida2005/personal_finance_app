import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String hintName;
  final String inputText;
  final String inputName;
  final TextEditingController controller;
  final TextInputType keyBoardType;

  const InputComponent(
      {super.key,
      required this.hintName,
      required this.keyBoardType,
      required this.controller,
      required this.inputText,
      required this.inputName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(inputName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
         const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black12, width: 1),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child:
                      Text("", style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyBoardType,
                    decoration: InputDecoration(
                      hintText: hintName,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
