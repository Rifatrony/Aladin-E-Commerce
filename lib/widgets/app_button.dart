import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool loading;
  final Color color;
  final double fontSize;
  final double height;
  final VoidCallback onPress;

  const AppButton({
    super.key,
    required this.onPress,
    required this.title,
    this.loading = false,
    this.color = Colors.blue,
    this.fontSize = 16,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: loading
            ? const Center(child: CircularProgressIndicator(color: Colors.white,))
            : Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
