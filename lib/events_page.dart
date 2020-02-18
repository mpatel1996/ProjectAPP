import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventPage extends StatefulWidget {
  
  EventPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EventPageState createState() => _EventPageState();
  
}

class _EventPageState extends State<EventPage> {
  CalendarController _calendarController;
    @override
    void initState() {
      super.initState();
      _calendarController = CalendarController();
    }

    @override
    void dispose() {
      _calendarController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return TableCalendar(
        calendarController: _calendarController,
      );
    }  
}

