import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/history_page_controller.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final controller = ref.watch(historyPageControllerProvider.notifier);
    final viewState = ref.watch(historyPageControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          rowHeight: 80,
          locale: 'ja_JP',
          focusedDay: viewState.focusedDay,
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
            selectedBuilder: (context, date, events) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: colorScheme.calenderSelectedDay,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      date.day.toString(),
                      style: textTheme.subtextBold.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Icon(FontAwesomeIcons.solidFaceLaughSquint),
                ],
              );
            },
            todayBuilder: (context, date, events) {
              // TODO:日付の位置がズレて見えるので、修正する
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    date.day.toString(),
                    style: textTheme.subtextBold,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Icon(FontAwesomeIcons.solidFaceLaughSquint),
                ],
              );
            },
            markerBuilder: (context, date, events) {
              if (isSameDay(viewState.selectedDate, date) ||
                  isSameDay(DateTime.now(), date)) {
                return const SizedBox.shrink();
              }
              return const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // デフォルトで日付が入ってるので、ここで明示的に入れる必要はない
                  SizedBox(
                    height: 4,
                  ),
                  Icon(FontAwesomeIcons.solidFaceLaughSquint),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
