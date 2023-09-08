import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimeSheetScreen extends StatelessWidget {
  const TimeSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _renderTimeslotPicker(),
      ),
    );
  }

  Widget _renderTimeslotPicker() {
    return SfCalendar(
      initialDisplayDate: DateTime.now(),
      view: CalendarView.workWeek,
      specialRegions: _getTimeRegions(),
      timeSlotViewSettings: TimeSlotViewSettings(
        startHour: 8,
        endHour: 16,
        timeInterval: const Duration(minutes: 60),
        nonWorkingDays: <int>[DateTime.sunday],
      ),
    );
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.addAll([
      TimeRegion(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        text: 'Reservé',
      ),
      TimeRegion(
        startTime: DateTime.now().add(Duration(hours: 20)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        text: 'Reservé',
      ),
      TimeRegion(
        startTime: DateTime(2023, 9, 7, 11),
        endTime: DateTime.now().add(Duration(hours: 1)),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        text: 'Reservé',
      )
    ]);

    return regions;
  }
}
