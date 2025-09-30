import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrWatermarkPainter extends CustomPainter {
  QrWatermarkPainter(this.qrImage, {this.size = 80, this.opacity = 0.1});

  final ui.Image qrImage;
  final double size;
  final double opacity;

  @override
  void paint(Canvas canvas, Size sizeScreen) {
    final paint = Paint()..color = Colors.black.withAlpha(50);

    final rows = (sizeScreen.height / size).ceil();
    final cols = (sizeScreen.width / size).ceil();

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final dx = c * size;
        final dy = r * size;
        canvas.drawImageRect(
          qrImage,
          Rect.fromLTWH(
            0,
            0,
            qrImage.width.toDouble(),
            qrImage.height.toDouble(),
          ),
          Rect.fromLTWH(dx, dy, size, size),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant QrWatermarkPainter oldDelegate) =>
      oldDelegate.qrImage != qrImage ||
      oldDelegate.size != size ||
      oldDelegate.opacity != opacity;
}

class QrWatermark extends StatefulWidget {
  const QrWatermark({
    required this.data,
    super.key,
    this.size = 80,
    this.opacity = 0.1,
  });

  final String data;
  final double size;
  final double opacity;

  @override
  State<QrWatermark> createState() => _QrWatermarkState();
}

class _QrWatermarkState extends State<QrWatermark> {
  ui.Image? qrImage;

  @override
  void initState() {
    super.initState();
    _generateQr();
  }

  Future<void> _generateQr() async {
    final painter = QrPainter(data: widget.data, version: QrVersions.auto);

    final pic = await painter.toImage(200); // base resolution
    setState(() => qrImage = pic);
  }

  @override
  Widget build(BuildContext context) {
    if (qrImage == null) return const SizedBox.shrink();

    return IgnorePointer(
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: QrWatermarkPainter(
          qrImage!,
          size: widget.size,
          opacity: widget.opacity,
        ),
      ),
    );
  }
}
