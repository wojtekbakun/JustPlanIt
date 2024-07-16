import 'package:calend/models/event.dart';

class EventUtils {
  static String getSingleEventDateAndTime(Event event) {
    return '${getSingleEventDay(event)} | ${getSingleEventTime(event)}';
  }

  static String getSingleEventData(List events, int index) {
    return _daysFromTo(
      events[index].startDate,
      events[index].endDate,
    );
  }

  //TODO make it work for multiple days
  static _daysFromTo(String startDate, String endDate) {
    DateTime dateFrom = DateTime.parse(startDate);
    DateTime dateTo = DateTime.parse(endDate);
    return '${dateFrom.day} - ${dateTo.day}';
  }

  static String getSingleEventDay(Event event) {
    return _formatDate(DateTime.parse(event.startDate));
  }

  static String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }

  static String getSingleEventTime(Event event) {
    return _hoursFromTo(
      event.startDate,
      event.endDate,
    );
  }

  static String _hoursFromTo(String startDate, String endDate) {
    DateTime dateFrom = DateTime.parse(startDate);
    DateTime dateTo = DateTime.parse(endDate);

    return '${dateFrom.hour}:${_formatMinutes(dateFrom.minute)} - ${dateTo.hour}:${_formatMinutes(dateTo.minute)}';
  }

  static String _formatMinutes(int minutes) {
    if (minutes < 10) {
      return '0$minutes';
    }
    return minutes.toString();
  }
}
