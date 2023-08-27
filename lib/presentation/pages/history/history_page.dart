import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/history_page_controller.dart';
import 'package:meigen_finder/application/state/history_page_view_state.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';
import 'package:meigen_finder/presentation/components/loading/execute_while_loading.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:meigen_finder/util/emotional_type_extension.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../application/controller/quote_detail_page_controller.dart';
import '../../../domain/collection/quote.dart';
import '../../theme/mf_color_scheme.dart';
import '../../theme/mf_text_theme.dart';

const _iconSize = 36.0;

typedef CalenderBuilder = Widget? Function(BuildContext, DateTime, DateTime)?;
typedef MarkerBuilder = Widget? Function(
    BuildContext, DateTime, List<dynamic>)?;

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
      executeWhileLoading(() => controller.fetchHistory());
      return null;
    }, const []);

    final events = viewState.events;

    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          calendarStyle: const CalendarStyle(outsideDaysVisible: false),
          rowHeight: 80,
          locale: 'ja_JP',
          focusedDay: viewState.focusedDay,
          eventLoader: (day) =>
              events?[DateTime(day.year, day.month, day.day)] ?? [],
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
          selectedDayPredicate: (day) => isSameDay(viewState.selectedDate, day),
          onDaySelected: controller.onDaySelected,
          availableCalendarFormats: const {
            CalendarFormat.month: '月',
          },
          calendarFormat: CalendarFormat.month,
          firstDay: DateTime(1994, 6, 12),
          lastDay: DateTime(2100, 1, 1),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: _buildDefaultCalendarItem(textTheme),
            outsideBuilder: _buildOutsideCalendarItem(viewState.selectedDate),
            disabledBuilder: (context, day, focusedDay) =>
                const SizedBox.shrink(),
            selectedBuilder: _buildSelectedCalendarItem(colorScheme, textTheme),
            todayBuilder: _buildDefaultCalendarItem(textTheme),
            markerBuilder: _buildMarker(colorScheme, viewState.selectedDate,
                viewState.likedQuotes ?? []),
          ),
        ),
      ),
    );
  }

  CalenderBuilder _buildDefaultCalendarItem(MfTextTheme textTheme) {
    return (context, date, events) {
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
    };
  }

  CalenderBuilder _buildOutsideCalendarItem(DateTime selectedDate) {
    return (context, day, focusedDay) {
      if (selectedDate.month != day.month) {
        return const SizedBox.shrink();
      }
      return null;
    };
  }

  CalenderBuilder _buildSelectedCalendarItem(
      MfColorScheme colorScheme, MfTextTheme textTheme) {
    return (context, date, selectedDay) {
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
    };
  }

  MarkerBuilder _buildMarker(MfColorScheme colorScheme, DateTime selectedDate,
      List<Quote> likedQuotes) {
    return (context, date, events) {
      if (events.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            width: _iconSize,
            height: _iconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.notEmotionalTypeColor,
            ),
          ),
        );
      } else {
        final event = events[0] as TodaysQuote;
        final emotionalType = event.emotionalType;
        final isToday = isSameDay(DateTime.now(), date);
        return isToday
            ? GestureDetector(
                onTap: () {
                  showFlexibleBottomSheet(
                      minHeight: 0,
                      initHeight: 0.2,
                      context: context,
                      isSafeArea: true,
                      builder: (context, scrollController, offset) {
                        return _BottomSheetContainer(
                          context: context,
                          quote: event,
                          isLike: event.isLiked(likedQuotes),
                        );
                      });
                },
                child: Material(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: colorScheme.calenderSelectedDay,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    emotionalType.icon,
                    size: _iconSize,
                    color: emotionalType.getColor(context),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  showFlexibleBottomSheet(
                      minHeight: 0,
                      initHeight: 0.2,
                      context: context,
                      isSafeArea: true,
                      builder: (context, scrollController, offset) {
                        return _BottomSheetContainer(
                            context: context, quote: event);
                      });
                },
                child: Icon(
                  emotionalType.icon,
                  size: _iconSize,
                  color: emotionalType.getColor(context),
                ),
              );
      }
    };
  }
}

class _BottomSheetContainer extends StatelessWidget {
  const _BottomSheetContainer({
    Key? key,
    required this.context,
    required this.quote,
    this.isLike = false,
  }) : super(key: key);
  final BuildContext context;
  final TodaysQuote quote;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final date = quote.createdAt;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${date.year}年${date.month}月${date.day}日',
                  style: textTheme.h3.copyWith(color: colorScheme.onBackground),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                        QuoteDetailRouteFromHistory(
                                QuoteDetailArgument(quote.quote, isLike))
                            .push(context);
                      },
                      icon: const Icon(FontAwesomeIcons.ellipsisVertical,
                          size: 24),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(FontAwesomeIcons.xmark, size: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  quote.emotionalType.icon,
                  size: 48,
                  color: quote.emotionalType.getColor(context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 48,
                    child: VerticalDivider(
                      width: 4,
                      thickness: 2,
                      color: colorScheme.onBackground,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    quote.quote.text,
                    style: textTheme.subtextBold
                        .copyWith(color: colorScheme.onBackground),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
