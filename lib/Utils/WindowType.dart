enum WindowType {
  XSMALL,
  SMALL,
  MEDIUM,
  LARGE;

  int get sizes {
    switch (this) {
      case WindowType.XSMALL:
        return 640;
      case WindowType.SMALL:
        return 768;
      case WindowType.MEDIUM:
        return 860;
      case WindowType.LARGE:
        return 861;
    }
  }
}