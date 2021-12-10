import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore_for_file: always_specify_types, public_member_api_docs

/// Converter for [DateTime] type
class DateTimeConverter extends BaseCustomConverter
    implements ICustomConverter {
  const DateTimeConverter() : super();

  @override
  Object? fromJSON(dynamic jsonValue, [DeserializationContext? context]) {
    final DateFormat? format = getDateFormat(context!.jsonPropertyMeta);
    final bool isUTC =
        getConverterParameter('isUTC', jsonProperty) as bool? ?? false;

    if (jsonValue is String) {
      return format != null
          ? (isUTC ? format.parseUtc(jsonValue) : format.parse(jsonValue))
          : DateTime.tryParse(jsonValue);
    }

    return jsonValue;
  }

  @override
  dynamic toJSON(Object? object, [SerializationContext? context]) {
    final format = getDateFormat(context!.jsonPropertyMeta);
    final bool isUTC =
        getConverterParameter('isUTC', jsonProperty) as bool? ?? false;

    if (object != null) {
      if (object is List) {
        return object.map((e) {
          return _dateParser(e, isUTC, format);
        }).toList();
      } else {
        return _dateParser(object, isUTC, format);
      }
    } else {
      return null;
    }
  }

  String? _dateParser(dynamic date, bool isUTC, DateFormat? format) {
    if (date != null) {
      DateTime? dateTime;
      if (date is DateTime) {
        dateTime = date;
      } else if (date is String) {
        return date;
      } else {
        return date.toString();
      }
      if (isUTC) {
        dateTime = dateTime.toUtc();
      }
      if (format != null) {
        return format.format(dateTime);
      } else {
        return dateTime.toString();
      }
    }
    return null;
  }

  DateFormat? getDateFormat([JsonProperty? jsonProperty]) {
    final String? format =
        getConverterParameter('format', jsonProperty) as String?;

    return format != null ? DateFormat(format) : null;
  }
}
