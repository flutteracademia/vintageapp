import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedHour;

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.white;
    const Color calendarColor = Color(0xFFF9FAFB);
    const Color currentDateColorOutside = Color(0xFF1C2A3A);
    const Color currentDateColorInside = Colors.white;
    const Color dateColor = Color(0xFF1C2A3A);
    const Color selectHourColor = Color(0xFF1C2A3A);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: backgroundColor,
        foregroundColor: currentDateColorOutside,
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Date',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: dateColor,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: calendarColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: currentDateColorOutside,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: currentDateColorOutside,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(color: dateColor),
                  weekendTextStyle: TextStyle(color: dateColor),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(color: dateColor, fontSize: 16),
                  leftChevronIcon: Icon(Icons.chevron_left, color: dateColor),
                  rightChevronIcon: Icon(Icons.chevron_right, color: dateColor),
                ),
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, date, _) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: currentDateColorOutside,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${date.day}',
                        style: const TextStyle(color: currentDateColorInside),
                      ),
                    );
                  },
                  selectedBuilder: (context, date, _) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: currentDateColorOutside,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${date.day}',
                        style: const TextStyle(color: currentDateColorInside),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Select Hour',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: dateColor,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(10, (index) {
                String hour = [
                  '09.00 AM',
                  '09.30 AM',
                  '10.00 AM',
                  '10.30 AM',
                  '11.00 AM',
                  '11.30 AM',
                  '3.00 PM',
                  '3.30 PM',
                  '4.00 PM',
                  '4.30 PM',
                ][index];
                bool isSelected = _selectedHour == hour;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedHour = hour;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? selectHourColor
                          : selectHourColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        hour,
                        style: TextStyle(
                          color: isSelected ? Colors.white : selectHourColor,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            Divider(thickness: 1, color: Colors.grey[300]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle confirm logic here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: selectHourColor, // Button color
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18, // Increase font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
