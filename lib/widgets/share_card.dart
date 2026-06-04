import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareCardData {
  final String appName;
  final IconData icon;
  final String title;
  final String subtitle;
  final String body;
  final Color accentColor;
  final String downloadUrl;

  const ShareCardData({
    required this.appName,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.body,
    this.accentColor = const Color(0xFF7C4DFF),
    this.downloadUrl = 'https://apps.rustore.ru/app/com.zubcoder.ai_stain_fix',
  });
}

class ShareCardHelper {
  static final _screenshotController = ScreenshotController();

  static String stripMarkdown(String text) {
    var result = text;
    result = result.replaceAllMapped(RegExp(r'\*\*(.+?)\*\*'), (m) => m.group(1)!);
    result = result.replaceAllMapped(RegExp(r'\*(.+?)\*'), (m) => m.group(1)!);
    result = result.replaceAllMapped(RegExp(r'__(.+?)__'), (m) => m.group(1)!);
    result = result.replaceAllMapped(RegExp(r'_(.+?)_'), (m) => m.group(1)!);
    result = result.replaceAll(RegExp(r'#{1,6}\s*'), '');
    result = result.replaceAll(RegExp(r'^\s*[-*+]\s', multiLine: true), '• ');
    result = result.replaceAllMapped(RegExp(r'^\s*(\d+)\.\s', multiLine: true), (m) => '${m.group(1)}. ');
    result = result.replaceAllMapped(RegExp(r'`(.+?)`'), (m) => m.group(1)!);
    return result.trim();
  }

  static Future<void> shareAsCard(BuildContext context, ShareCardData data) async {
    final Uint8List imageBytes = await _screenshotController.captureFromWidget(
      MediaQuery(
        data: MediaQuery.of(context),
        child: _ShareCardWidget(data: data),
      ),
      delay: const Duration(milliseconds: 100),
      pixelRatio: 3.0,
    );

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/share_card_${DateTime.now().millisecondsSinceEpoch}.png');
    await file.writeAsBytes(imageBytes);

    final shareText = StringBuffer()
      ..writeln(data.title)
      ..writeln(data.subtitle)
      ..writeln()
      ..writeln(data.body)
      ..writeln()
      ..writeln('\u{1F4F2} Скачать ${data.appName}: ${data.downloadUrl}');

    await Share.shareXFiles(
      [XFile(file.path)],
      text: shareText.toString(),
    );
  }
}

class _ShareCardWidget extends StatelessWidget {
  final ShareCardData data;

  const _ShareCardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: data.accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(data.icon, color: data.accentColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.appName,
                        style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700, color: data.accentColor)),
                    Text('Результат анализа',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: data.accentColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: data.accentColor.withValues(alpha: 0.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1A1A2E))),
                const SizedBox(height: 4),
                Text(data.subtitle,
                    style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[600])),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(data.body,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF333333))),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_fix_high_rounded, size: 14, color: data.accentColor),
                    const SizedBox(width: 6),
                    Text('Создано в ${data.appName}',
                        style: TextStyle(
                          fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(data.downloadUrl,
                    style: TextStyle(
                      fontSize: 10,
                      color: data.accentColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
