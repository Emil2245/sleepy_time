import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleepy_time/app_icons.dart';
import 'package:sleepy_time/view/widgets/confirmation_bottom_sheet.dart';

class AlarmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TimeOfDay? time;
  final int num;

  const AlarmButton(
      {super.key,
      required this.onPressed,
      required this.time,
      required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$num ciclo${num > 1 ? 's' : ''}:\n ${(num * 1.5).toInt()}h ${num % 2 == 0 ? '' : '30min'}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontWeight: FontWeight.w300,
                ),
          ),
          Text(
            time?.format(context) ?? "No time set",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .tertiaryContainer
                      .withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  builder: (BuildContext context) {
                    return ConfirmationBottomSheet(
                      time: time,
                    );
                  },
                );
              },
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primaryContainer,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  AppIcons.alarm,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
