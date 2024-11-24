import 'package:flutter/material.dart';
import 'package:sleepy_time/app_icons.dart';
import 'package:sleepy_time/view/settings_view.dart';
import 'package:sleepy_time/view/time_selection_view.dart';
import 'package:sleepy_time/view/widgets/AlarmButton.dart';
import 'package:sleepy_time/view/widgets/CustomButton.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsView(
                    title: '',
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.settings,
              size: 25,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...[
                AlarmButton(
                  onPressed: () {},
                  time: TimeOfDay.now(),
                  num: 4,
                ),
                CustomButton(
                  onPressed: onPressedNightTime,
                  iconPath: AppIcons.moon,
                  topText: 'Calcula el mejor momento para dormir',
                  bottomText: 'Hora de Dormir',
                ),
                CustomButton(
                  onPressed: onPressedWakeTime,
                  iconPath: AppIcons.sun,
                  topText: 'Calcula el mejor momento para despertar',
                  bottomText: 'Hora de Despertar',
                ),
                CustomButton(
                  onPressed: onPressedNowTime,
                  iconPath: AppIcons.clock,
                  topText: 'Calcula el mejor momento para despertar',
                  bottomText: 'Duerme Ahora',
                ),
                CustomButton(
                  onPressed: onPressedNapTime,
                  iconPath: AppIcons.nap,
                  topText: 'Toma una siesta en este momento',
                  bottomText: 'Siestita <3',
                ),
              ]
                  .map(
                    (button) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: button,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressedNightTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Hora seleccionada: ${pickedTime.format(context)}')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TimeSelectionView(
            title: widget.title,
            time: pickedTime,
            mode: 1,
          ),
        ),
      );
    }
  }

  Future<void> onPressedWakeTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Hora seleccionada: ${pickedTime.format(context)}')),
      );
    }
  }

  Future<void> onPressedNowTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Hora seleccionada: ${pickedTime.format(context)}')),
      );
    }
  }

  Future<void> onPressedNapTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Hora seleccionada: ${pickedTime.format(context)}')),
      );
    }
  }
}
