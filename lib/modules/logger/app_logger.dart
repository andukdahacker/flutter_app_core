import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class AppLogger {
  final Logger logIt = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  /// Log a message at level [Level.trace].
  void trace(
      dynamic message, {
        dynamic error,
        bool showInProd = false,
        StackTrace? stackTrace,
      }) {
    if ( !showInProd) {
      return;
    }

    logIt.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(
      dynamic message, {
        dynamic error,
        bool showInProd = false,
        StackTrace? stackTrace,
      }) {
    if (showInProd) {
      return;
    }

    logIt.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(
      dynamic message, {
        dynamic error,
        bool showInProd = false,
        StackTrace? stackTrace,
      }) {
    if (!showInProd) {
      return;
    }

    logIt.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn(
      dynamic message, {
        dynamic error,
        bool showInProd = false,
        StackTrace? stackTrace,
      }) {
    if (!showInProd) {
      return;
    }

    logIt.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(
      dynamic message, {
        dynamic error,
        bool showInProd = false,
        StackTrace? stackTrace,
      }) {
    if (!showInProd) {
      return;
    }

    logIt.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void fatal(
      dynamic message, {
        dynamic error,
        bool showInProd = false,
        StackTrace? stackTrace,
      }) {
    if (!showInProd) {
      return;
    }

    logIt.f(message, error: error, stackTrace: stackTrace);
  }
}