import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/history_page_controller.dart';
import 'package:meigen_finder/application/state/history_page_view_state.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:meigen_finder/util/emotional_type_extension.dart';
import 'package:table_calendar/table_calendar.dart';

const _iconSize = 36.0;

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final controller = ref.watch(historyPageControllerProvider.notifier);
    final viewState = ref.watch(historyPageControllerProvider);

    useEffect(() {
      controller.fetchHistory();
      return;
    }, const []);

    final events = viewState.events;
    print('length${events?.length}');

    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          enabledDayPredicate: (day) {
            return viewState.selectedDate.month == day.month;
          },
          rowHeight: 80,
          locale: 'ja_JP',
          focusedDay: viewState.focusedDay,
          eventLoader: (day) {
            final date = DateTime(day.year, day.month, day.day);
            return events?[date] ?? [];
          },
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: textTheme.h2,
            leftChevronIcon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: colorScheme.onBackground,
            ),
            rightChevronIcon: Icon(
              FontAwesomeIcons.chevronRight,
              color: colorScheme.onBackground,
            ),
          ),
          selectedDayPredicate: (day) {
            return isSameDay(viewState.selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            controller.onDaySelected(selectedDay, focusedDay);
          },
          availableCalendarFormats: const {
            CalendarFormat.month: '月',
          },
          calendarFormat: CalendarFormat.month,
          firstDay: DateTime(1994, 6, 12),
          lastDay: DateTime(2100, 1, 1),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, events) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    date.day.toString(),
                    style: textTheme.subtextBold,
                  ),
                ),
              );
            },
            outsideBuilder:
                (BuildContext context, DateTime day, DateTime focusedDay) {
              if (viewState.selectedDate.month != day.month) {
                return const SizedBox.shrink();
              }
            },
            disabledBuilder:
                (BuildContext context, DateTime day, DateTime focusedDay) {
              return const SizedBox.shrink();
            },
            selectedBuilder: (context, date, selectedDay) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: colorScheme.calenderSelectedDay,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: textTheme.subtextBold.copyWith(
                            color: colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            todayBuilder: (context, date, focusedDay) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    date.day.toString(),
                    style: textTheme.subtextBold,
                  ),
                ),
              );
            },
            markerBuilder: (context, date, events) {
              print(events);
              if (events.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Container(
                    width: _iconSize,
                    height: _iconSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.notSelected,
                    ),
                  ),
                );
              } else {
                final event = events[0] as TodaysQuote;
                final emotionalType = event.emotionalType;
                final isSelected = isSameDay(viewState.selectedDate, date);
                final isToday = isSameDay(DateTime.now(), date);
                return isToday
                    ? Material(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: colorScheme.selectedColor,
                            width: 2.0,
                          ),
                        ),
                        child: Icon(
                          emotionalType.icon,
                          size: _iconSize,
                          color: emotionalType.getColor(context),
                        ),
                      )
                    : Icon(
                        emotionalType.icon,
                        size: _iconSize,
                        color: emotionalType.getColor(context),
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}
