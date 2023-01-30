import 'package:flutter/material.dart';
import 'package:flutter_pokedex/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBodySurface,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          "Texto",
          style: textHeadLine.copyWith(color: colorDragon),
        ),
      ),
    );
  }
}
