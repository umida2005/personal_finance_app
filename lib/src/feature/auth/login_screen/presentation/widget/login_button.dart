import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child:
              isLoading
                  ? const Center(
                    child: SizedBox(
                      width: 24,
                      height: 14,
                      child: CircularProgressIndicator(),
                    ),
                  )
                  : Text(text, style: const TextStyle(color:Color(0xFF647AE1),fontSize: 18,fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
