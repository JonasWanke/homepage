import 'package:intl/intl.dart';

import '../app/_.dart';

@immutable
class LocalMonth implements Comparable<LocalMonth> {
  LocalMonth(int year, int month) : dateTime = DateTime.utc(year, month, 1);
  LocalMonth.fromDateTime(DateTime dateTime)
      : this(dateTime.year, dateTime.month);

  static LocalMonth get current => LocalMonth.fromDateTime(DateTime.now());
  static LocalMonth get next => current.plus(months: 1);

  final DateTime dateTime;

  int get year => dateTime.year;
  int get month => dateTime.month;

  LocalMonth plus({int years = 0, int months = 0}) =>
      LocalMonth.fromDateTime(DateTime.utc(year + years, month + months));
  LocalMonth minus({int years = 0, int months = 0}) =>
      plus(years: -years, months: -months);
  int difference(LocalMonth other) =>
      (year - other.year) * 12 + (month - other.month);

  @override
  bool operator ==(Object other) =>
      other is LocalMonth && year == other.year && month == other.month;
  @override
  int get hashCode => Object.hash(year, month);

  @override
  int compareTo(LocalMonth other) => dateTime.compareTo(other.dateTime);

  LocalMonth copyWith({int? year, int? month}) =>
      LocalMonth(year ?? this.year, month ?? this.month);

  @override
  String toString() {
    final year = dateTime.year.toString().padLeft(4, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    return '$year-$month';
  }
}

enum LocalMonthFormat {
  short._(DateFormat.yM),
  long._(DateFormat.yMMMM),
  monthOnlyLong._(DateFormat.MMMM);

  const LocalMonthFormat._(this._formatGetter);

  // We store a getter instead of the instance because the ambient locale is
  // stored from the instantiation on.
  final ValueGetter<DateFormat> _formatGetter;

  String format(LocalMonth month) => _formatGetter().format(month.dateTime);
}
