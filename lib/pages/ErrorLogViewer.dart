import 'package:flutter/material.dart';
import '../utils/error_logger.dart'; // Adjust path based on your structure

class ErrorLogViewer extends StatefulWidget {
  const ErrorLogViewer({super.key});

  @override
  State<ErrorLogViewer> createState() => _ErrorLogViewerState();
}

class _ErrorLogViewerState extends State<ErrorLogViewer> {
  String _logContent = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadLog();
  }

  Future<void> _loadLog() async {
    final log = await ErrorLogger.readLog();
    setState(() {
      _logContent = log;
    });
  }

  Future<void> _clearLog() async {
    await ErrorLogger.clearLog(); // Optional: create this method
    setState(() {
      _logContent = 'Log cleared.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Log Viewer'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadLog,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearLog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: SelectableText(
            _logContent,
            style: const TextStyle(fontFamily: 'Courier', fontSize: 14),
          ),
        ),
      ),
    );
  }
}
