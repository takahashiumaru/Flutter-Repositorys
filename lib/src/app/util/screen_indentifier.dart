class ScreenIdentifier {

  ScreenIdentifier(double width) {
    width = width;
  }
  late double width;

  static double get xxl => 1400;
  static double get xl => 1200;
  static double get lg => 992;
  static double get md => 768;
  static double get sm => 576;
  static double get xs => 0;

  T conditions<T>({
    T? xxl,
    T? xl,
    T? lg,
    T? md,
    T? sm,
    T? xs,
  }) {
    if (width > ScreenIdentifier.xxl) {
      return (xxl ?? xl ?? lg ?? md ?? sm ?? xs)!;
    } else if (width > ScreenIdentifier.xl) {
      return (xl ?? lg ?? md ?? sm ?? xs ?? xxl)!;
    } else if (width > ScreenIdentifier.lg) {
      return (lg ?? md ?? sm ?? xs ?? xxl ?? xl)!;
    } else if (width > ScreenIdentifier.md) {
      return (md ?? sm ?? xs ?? xxl ?? xl ?? lg)!;
    } else if (width > ScreenIdentifier.sm) {
      return (sm ?? xs ?? xxl ?? xl ?? lg ?? md)!;
    } else if (width > ScreenIdentifier.xs) {
      return (xs ?? xxl ?? xl ?? lg ?? md ?? sm)!;
    } else {
      return xs!;
    }
  }
}
