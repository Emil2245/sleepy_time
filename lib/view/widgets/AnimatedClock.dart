import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedClock extends StatefulWidget {
  const AnimatedClock({super.key});

  @override
  _AnimatedClockState createState() => _AnimatedClockState();
}

class _AnimatedClockState extends State<AnimatedClock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 12),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: ClockPainter(controller: _controller, context: context),
        child: SizedBox(width: 45, height: 45),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ClockPainter extends CustomPainter {
  final AnimationController controller;

  ClockPainter({required this.controller, required BuildContext context})
      : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Pintura para el borde del reloj
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Pintura para la manecilla grande (minutos)
    final bigHandPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    // Pintura para la manecilla pequeña (horas)
    final smallHandPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    // Dibujar el borde del reloj
    canvas.drawCircle(center, radius, borderPaint);

    final elapsedTime = controller.value * 12; // Rango: 0 a 12 horas

    final bigHandAngle = (elapsedTime * 2 * pi) / 12; // 1 hora = 2π/12
    final bigHandLength = radius * 0.75;
    final bigHandEnd = Offset(
      center.dx + bigHandLength * cos(bigHandAngle - pi / 2),
      center.dy + bigHandLength * sin(bigHandAngle - pi / 2),
    );
    canvas.drawLine(center, bigHandEnd, bigHandPaint);

    final smallHandAngle = (elapsedTime * 2 * pi) / 6; // 12 horas = 2π
    final smallHandLength = radius * 0.4;
    final smallHandEnd = Offset(
      center.dx + smallHandLength * cos(smallHandAngle - pi / 2),
      center.dy + smallHandLength * sin(smallHandAngle - pi / 2),
    );
    canvas.drawLine(center, smallHandEnd, smallHandPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
