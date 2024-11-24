import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleepy_time/view/widgets/AlarmButton.dart';

import '../app_icons.dart';

class TimeSelectionView extends StatefulWidget {
  const TimeSelectionView(
      {super.key, required this.title, required this.time, required this.mode});

  final String title;
  final int mode;
  final TimeOfDay? time;

  @override
  State<TimeSelectionView> createState() => _TimeSelectionViewState();
}

class _TimeSelectionViewState extends State<TimeSelectionView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 3),
          child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColor,
              flexibleSpace: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: kToolbarHeight,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                AppIcons.back,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 34,
                              ),
                            ),
                            Text(
                              widget.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(width: 48),
                            // Placeholder for spacing
                          ]),
                    ),
                    // Additional Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              {
                                    1: "Despertando a las",
                                    2: "Durmiendo a las",
                                    3: "Durmiendo ahora",
                                    4: "Tomando una siesta ahora"
                                  }[widget.mode] ??
                                  "Texto por defecto",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.normal),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      BlendMode.srcIn,
                                    ),
                                    child: SvgPicture.asset(
                                      AppIcons.alarm,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    '${widget.time?.format(context) ?? "--:--"}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              {
                                    1: "deberías dormir en una de las siguientes horas:",
                                    2: "deberías despertar en una de las siguientes horas:",
                                    3: "deberías despertar en una de las siguientes horas:",
                                    4: "deberías despertar a las:"
                                  }[widget.mode] ??
                                  "Texto por defecto",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Para un descanso eficiente",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AlarmButton(
                  onPressed: () {},
                  time: addTimes(widget.time as TimeOfDay, 6),
                  num: 6),
              AlarmButton(
                  onPressed: () {},
                  time: addTimes(widget.time as TimeOfDay, 5),
                  num: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Para un descanso regular",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AlarmButton(
                  onPressed: () {},
                  time: addTimes(widget.time as TimeOfDay, 4),
                  num: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Para un descanso deficiente",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AlarmButton(
                  onPressed: () {},
                  time: addTimes(widget.time as TimeOfDay, 3),
                  num: 3),
              AlarmButton(
                  onPressed: () {},
                  time: addTimes(widget.time as TimeOfDay, 2),
                  num: 2),
              AlarmButton(
                  onPressed: () {},
                  time: addTimes(widget.time as TimeOfDay, 1),
                  num: 1),
            ]
                .map(
                  (button) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: button,
                  ),
                )
                .toList(),
          ),
        )));
  }

  TimeOfDay addTimes(TimeOfDay time, int num) {
    final horita = DateTime.now();
    final nuevaHora = horita.copyWith(hour: time.hour, minute: time.minute);

    Duration timeAdded =
        Duration(hours: (num * 1.5).toInt(), minutes: !(num % 2 == 0) ? 30 : 0);

    final resultado = nuevaHora.add(timeAdded);

    return TimeOfDay(hour: resultado.hour, minute: resultado.minute);
  }

}
