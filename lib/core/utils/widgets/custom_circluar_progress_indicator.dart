import 'package:ChattyPal/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        
        color: AppTheme.primaryBlueColor,
      ),
    );
  }
}
