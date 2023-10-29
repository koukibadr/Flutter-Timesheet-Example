import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimeSheetScreen extends StatelessWidget {
  const TimeSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: _renderTimeslotPicker()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderTimeslotPicker() {
    return SfCalendar(
      initialDisplayDate: DateTime.now(),
      showNavigationArrow: true,
      allowViewNavigation: true,
      showDatePickerButton: true,
      viewNavigationMode: ViewNavigationMode.none,
      allowedViews: const <CalendarView>[
        CalendarView.day,
        CalendarView.workWeek,
        CalendarView.month,
      ],
      view: CalendarView.month,
      specialRegions: _getTimeRegions(),
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 8,
        endHour: 16,
        nonWorkingDays: <int>[DateTime.sunday],
        //minimumAppointmentDuration: Duration(minutes: 30)
      ),
      blackoutDates: <DateTime>[
        DateTime(2023, 09, 10),
        DateTime(2023, 09, 15),
        DateTime(2023, 09, 20),
        DateTime(2023, 09, 22),
        DateTime(2023, 09, 24)
      ],
      blackoutDatesTextStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Colors.red,
        decoration: TextDecoration.lineThrough,
      ),
    );
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    var testDuration = DateTime.now().subtract(const Duration(hours: 3));
    var testDuration2 = DateTime.now().subtract(const Duration(hours: 28));
    regions.addAll([
      TimeRegion(
        startTime: testDuration,
        endTime: testDuration.add(const Duration(hours: 2)),
        enablePointerInteraction: false,
        color: Colors.red.withOpacity(0.2),
        text: 'Reservé',
      ),
      TimeRegion(
        startTime: testDuration2,
        endTime: testDuration2.add(const Duration(hours: 1)),
        enablePointerInteraction: false,
        color: Colors.red.withOpacity(0.2),
        text: 'Reservé',
      )
    ]);

    return regions;
  }
}
