import 'dart:io'; // for File operations
import 'package:path_provider/path_provider.dart';

class ErrorLogger {
  // Logs an error with optional additional details
  static Future<void> logError(
    String message, [
    String? extra1,
    String? extra2,
  ]) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/error_log.txt';
      final file = File(filePath);

      final timestamp = DateTime.now().toIso8601String();
      final fullError = [message, extra1, extra2].whereType<String>().join(' ');
      final errorLog = '$timestamp: $fullError\n';

      await file.writeAsString(errorLog, mode: FileMode.append);
    } catch (e) {
      // Optional: handle logging failure here, but avoid recursion
      print("Failed to write to error log: $e");
    }
  }

  // Reads the full error log content
  static Future<String> readLog() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/error_log.txt';
      final file = File(filePath);

      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return 'No logs available.';
      }
    } catch (e) {
      return 'Failed to read log: $e';
    }
  }

  static Future<void> clearLog() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/error_log.txt';
      final file = File(filePath);

      if (await file.exists()) {
        await file.writeAsString('');
      }
    } catch (e) {
      print("Failed to clear error log: $e");
    }
  }
}
