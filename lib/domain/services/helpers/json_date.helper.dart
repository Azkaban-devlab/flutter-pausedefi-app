import 'package:intl/intl.dart';

///
/// [JsonDateHelper]
///
class JsonDateHelper {
  ///
  /// Format `String` to `DateTime`
  ///
  static DateTime dateTimeFromJsonUTC(String dateTimeStr) {
    DateTime dateTime = DateTime.now();
    try {
      dateTime =
          // ignore: unnecessary_string_escapes
          DateFormat('yyyy-MM-dd\THH:mm:ss.Z').parseUTC(dateTimeStr).toLocal();
    } catch (e) {
      try {
        dateTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').parseUTC(dateTimeStr).toLocal();
      } catch (e) {
        //
      }
    }
    return dateTime;
  }

  ///
  /// Format `DateTime` to `String` format `"y-MM-d"`
  ///
  static String? dateTimeToJsonDate(DateTime? dateTime) {
    return dateTime is DateTime ? DateFormat('y-MM-d').format(dateTime) : null;
  }

  ///
  /// Format `DateTime` to `String`
  ///
  static String? dateTimeToJsonUTC(DateTime? dateTime) {
    return dateTime?.toUtc().toIso8601String();
  }

  ///
  /// Convert microseconds to `Duration`
  ///
  static Duration? fromJsonMicroSeconds(dynamic microseconds) {
    final int? microsecondsConverted = microseconds is int
        ? microseconds
        : int.tryParse(microseconds.toString());

    return microsecondsConverted != null
        ? Duration(microseconds: microsecondsConverted)
        : null;
  }

  ///
  /// Convert milliseconds to `Duration`
  ///
  static Duration? fromJsonMilliSeconds(dynamic milliseconds) {
    final int? millisecondsConverted = milliseconds is int
        ? milliseconds
        : int.tryParse(milliseconds.toString());

    return millisecondsConverted != null
        ? Duration(milliseconds: millisecondsConverted)
        : null;
  }

  ///
  /// Convert minutes to `Duration`
  ///
  static Duration? fromJsonMinutes(dynamic minutes) {
    final int? converted =
        minutes is int ? minutes : int.tryParse(minutes.toString());

    return converted != null ? Duration(minutes: converted) : null;
  }

  ///
  /// Convert seconds to `Duration`
  ///
  static Duration? fromJsonSeconds(dynamic seconds) {
    final int? secondsConverted =
        seconds is int ? seconds : int.tryParse(seconds.toString());

    return secondsConverted != null
        ? Duration(seconds: secondsConverted)
        : null;
  }

  ///
  /// Convert `Duration` to microseconds
  ///
  static int? toJsonMicroSeconds(Duration? duration) {
    return duration?.inMicroseconds;
  }

  ///
  /// Convert `Duration` to milliseconds
  ///
  static int? toJsonMilliSeconds(Duration? duration) {
    return duration?.inMilliseconds;
  }

  ///
  /// Convert `Duration` to minutes
  ///
  static int? toJsonMinutes(Duration? duration) {
    return duration?.inMinutes;
  }

  ///
  /// Convert `Duration` to seconds
  ///
  static int? toJsonSeconds(Duration? duration) {
    return duration?.inSeconds;
  }
}
