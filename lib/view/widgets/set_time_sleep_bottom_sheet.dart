import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleepy_time/view/widgets/AnimatedClock.dart';

class SetSleepTimeBottomSheet extends StatefulWidget {
  const SetSleepTimeBottomSheet({super.key});

  @override
  State<SetSleepTimeBottomSheet> createState() =>
      _SetSleepTimeBottomSheetState();
}

class _SetSleepTimeBottomSheetState extends State<SetSleepTimeBottomSheet>
    with WidgetsBindingObserver {
  double _initialChildSize = 0.5;
  double _minChildSize = 0.3;
  double _maxChildSize = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0) {
      // Keyboard is visible
      setState(() {
        _initialChildSize = 0.9;
        _minChildSize = 0.5;
      });
    } else {
      // Keyboard is hidden
      setState(() {
        _initialChildSize = 0.5;
        _minChildSize = 0.3;
      });
    }
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: _initialChildSize,
      minChildSize: _minChildSize,
      maxChildSize: _maxChildSize,
      builder: (context, scrollController) {
        return Container(
          color: Theme.of(context).colorScheme.surfaceTint,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 35,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const AnimatedClock(),
                Text(
                  'No time set',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Ingresa tu nombre',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      print('Texto ingresado: $text');
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryFixedVariant,
                      ),
                      onPressed: () {
                        Navigator.pop(context, 'confirmar');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, 'cancelar');
                      },
                      child: Text(
                        'Cancelar',
                        style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
