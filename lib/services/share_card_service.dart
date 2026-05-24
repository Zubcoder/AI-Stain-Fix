import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/stain_result.dart';
import '../utils/constants.dart';

class ShareCardService {
  static const _w = 720.0;
  static const _h = 1080.0;

  static Future<void> shareResultCard(StainResult item) async {
    final bytes = await _render(item);
    final dir = await getTemporaryDirectory();
    final ts = item.analyzedAt.millisecondsSinceEpoch;
    final file = File('${dir.path}/share_card_$ts.png');
    await file.writeAsBytes(bytes);
    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Stain Fix — умное удаление пятен по фото',
    );
  }

  static Future<Uint8List> _render(StainResult item) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, _w, _h));

    final bgPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0A0E21), Color(0xFF1A1F38)],
      ).createShader(Rect.fromLTWH(0, 0, _w, _h));
    canvas.drawRect(Rect.fromLTWH(0, 0, _w, _h), bgPaint);

    canvas.drawRect(Rect.fromLTWH(0, 0, _w, 6),
        Paint()..color = AppColors.primary);

    _text(canvas, 'Stain Fix', 40, 36, size: 28, bold: true);
    _text(canvas, 'Умное удаление пятен по фото', 40, 74, size: 16,
        color: const Color(0xFF8E95B4));

    canvas.drawRect(Rect.fromLTWH(40, 112, _w - 80, 1),
        Paint()..color = const Color(0xFF2A3052));

    // Stain type + fabric
    _text(canvas, '${item.stainType} на ${item.fabricType}', 40, 136,
        size: 26, bold: true);

    // Difficulty badge
    final diffColor = item.difficultyLevel >= 4
        ? const Color(0xFFFF5252)
        : item.difficultyLevel >= 2
            ? const Color(0xFFFFD600)
            : const Color(0xFF4CAF50);
    final badgePaint = Paint()..color = diffColor.withValues(alpha: 0.2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(40, 182, 200, 40), const Radius.circular(20)),
      badgePaint,
    );
    _text(canvas, '${item.difficulty} (${item.difficultyLevel}/5)', 60, 190,
        size: 16, color: diffColor, bold: true);

    // Steps
    double y = 250;
    _text(canvas, '📋 Инструкция:', 40, y, size: 18, bold: true,
        color: AppColors.primary);
    y += 32;
    for (int i = 0; i < item.steps.length && i < 8; i++) {
      _text(canvas, '${i + 1}. ${item.steps[i]}', 40, y, size: 14,
          color: const Color(0xFFCCCCCC));
      y += 24;
    }
    y += 12;

    // Products
    if (item.products.isNotEmpty && y < _h - 200) {
      _text(canvas, '🧴 Средства:', 40, y, size: 16, bold: true,
          color: AppColors.accent);
      y += 28;
      for (final p in item.products.take(4)) {
        _text(canvas, '  • $p', 40, y, size: 14,
            color: const Color(0xFFCCCCCC));
        y += 22;
      }
      y += 8;
    }

    // Warnings
    if (item.warnings.isNotEmpty && y < _h - 120) {
      _text(canvas, '⚠ Предупреждения:', 40, y, size: 16, bold: true,
          color: const Color(0xFFFFD600));
      y += 28;
      for (final w in item.warnings.take(3)) {
        _text(canvas, '  • $w', 40, y, size: 14,
            color: const Color(0xFFCCCCCC));
        y += 22;
      }
    }

    // Bottom branding
    final bottomY = _h - 60;
    canvas.drawRect(Rect.fromLTWH(40, bottomY - 16, _w - 80, 1),
        Paint()..color = const Color(0xFF2A3052));
    _text(canvas, 'Stain Fix', 40, bottomY, size: 16, bold: true);
    _text(canvas, 'Скачать в RuStore', 40, bottomY + 22, size: 13,
        color: AppColors.primary);

    final picture = recorder.endRecording();
    final img = await picture.toImage(_w.toInt(), _h.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  static void _text(Canvas c, String t, double x, double y, {
    double size = 16, Color color = Colors.white, bool bold = false,
  }) {
    final b = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.left, fontSize: size, maxLines: 2, ellipsis: '...',
    ))..pushStyle(ui.TextStyle(
        color: color, fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal))
      ..addText(t);
    final p = b.build()..layout(ui.ParagraphConstraints(width: _w - x - 40));
    c.drawParagraph(p, Offset(x, y));
  }
}
