import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleepy_time/view/widgets/AnimatedClock.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final TimeOfDay? time;

  const ConfirmationBottomSheet({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          color: Theme.of(context).colorScheme.surfaceTint,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 35,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              AnimatedClock(),
              Text(
                '¿Programar alarma a las ${time?.format(context) ?? 'No time set'}?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context, 'cancelar');
                    },
                    child: Text(
                      'Cancelar',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryFixedVariant),
                    onPressed: () {
                      Navigator.pop(context, 'confirmar');
                    },
                    child: Container(
                      child: Text(
                        'Aceptar',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
