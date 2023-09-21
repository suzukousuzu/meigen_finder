enum EventType {
  todayQuoteButton(),
  retryTodayButtonQuote,
}

extension EventTypeExtension on EventType {
  String get name {
    switch (this) {
      case EventType.todayQuoteButton:
        return "today_quote_button";
      case EventType.retryTodayButtonQuote:
        return "retry_today_button_quote";
    }
  }
}
