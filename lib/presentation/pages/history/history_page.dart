import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          focusedDay: now,
          firstDay: DateTime(1994, 6, 12),
          lastDay: DateTime(2100, 1, 1),
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date.day.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              );
            },
            todayBuilder: (context, date, events) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date.day.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green, width: 2), // 今日のアイコンの枠線の色を変更
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              );
            },
            markerBuilder: (context, date, events) {
              if (isSameDay(DateTime.now(), date)) {
                // 今日の日付の場合は、アイコンを表示しない
                return null;
              }
              return Positioned(
                left: 0,
                right: 0,
                bottom: 1,
                child: Column(
                  children: [
                    Text(date.day.toString(), style: TextStyle(fontSize: 16)),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.blue,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
