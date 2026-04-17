enum Timeframe {
  d1,
  d7,
  d30,
  y1,
}

extension TimeframeJson on Timeframe {
  String get jsonKey {
    switch (this) {
      case Timeframe.d1:
        return 'd1';
      case Timeframe.d7:
        return 'd7';
      case Timeframe.d30:
        return 'd30';
      case Timeframe.y1:
        return 'y1';
    }
  }
}
