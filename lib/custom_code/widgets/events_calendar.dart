// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class EventsCalendar extends StatefulWidget {
  const EventsCalendar({
    Key? key,
    this.width,
    this.height,
    required this.calendar,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<ApplicationsRecord> calendar;

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => first.add(Duration(days: index)),
  );
}

class Event {
  final String title;
  const Event(this.title);

  @override
  String toString() => title;
}

class _TableEventsExampleState extends State<EventsCalendar> {
  Map<DateTime, List<Event>> events = {};

  void addEvents(List<DateTime>? dates, List<String>? eventNames) {
    if (dates != null && eventNames != null) {
      for (int i = 0; i < dates.length; i++) {
        DateTime date = dates[i];
        String eventName = eventNames[i];
        DateTime utcDate = DateTime.utc(date.year, date.month, date.day);
        if (!events.containsKey(utcDate)) {
          events[utcDate] = [];
        }
        events[utcDate]!.add(Event(eventName));
      }
    }
  }

  late final ValueNotifier<List<Event>> _selectedEvents;
  //
  //
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  List<DateTime> jobD = [];
  List<String> jobN = [];

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    events = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    // Initialize _selectedEvents here
    _selectedEvents = ValueNotifier([]);
    for (ApplicationsRecord job in widget.calendar) {
      jobD.add(job.jobdate!);
      jobN.add(job.jobname);
    }
    addEvents(jobD, jobN);
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    DateTime utcDate = DateTime.utc(day.year, day.month, day.day);
    return events[utcDate] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2050, 1, 1),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            calendarStyle: CalendarStyle(
              weekendTextStyle:
                  TextStyle(color: Color.fromARGB(255, 57, 57, 57)),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 233, 38),
              ),
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
