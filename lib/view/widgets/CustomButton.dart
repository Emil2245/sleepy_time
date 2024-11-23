import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String topText;
  final String bottomText;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.topText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        minimumSize: Size(MediaQuery.of(context).size.width, 32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primaryFixedDim, BlendMode.srcIn),
            child: SvgPicture.asset(
              iconPath,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            topText,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primaryFixedDim,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            bottomText,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
