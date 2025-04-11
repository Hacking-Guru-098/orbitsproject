import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ErrorLogger {
  // Get the path to the internal 'mitzvah' folder for logs
  static Future<String> _getLogFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final logDir = Directory('${directory.path}/mitzvah');

    // Create the directory if it doesn't exist
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }

    // Return the path to the error_log.txt file
    return '${logDir.path}/error_log.txt';
  }

  // Log an error with optional additional details
  static Future<void> logError(
    String message, [
    String? extra1,
    String? extra2,
  ]) async {
    try {
      final filePath = await _getLogFilePath();
      final file = File(filePath);

      final timestamp = DateTime.now().toIso8601String();
      final fullError = [message, extra1, extra2].whereType<String>().join(' ');
      final errorLog = '$timestamp: $fullError\n';

      // Append the error log to the file
      await file.writeAsString(errorLog, mode: FileMode.append);
    } catch (e) {
      print("Failed to write to error log: $e");
    }
  }

  // Read the full error log content
  static Future<String> readLog() async {
    try {
      final filePath = await _getLogFilePath();
      final file = File(filePath);

      // Check if the file exists and read the contents
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return 'No logs available.';
      }
    } catch (e) {
      return 'Failed to read log: $e';
    }
  }

  // Clear the log file
  static Future<void> clearLog() async {
    try {
      final filePath = await _getLogFilePath();
      final file = File(filePath);

      // If the file exists, clear its contents
      if (await file.exists()) {
        await file.writeAsString('');
      }
    } catch (e) {
      print("Failed to clear error log: $e");
    }
  }
}
