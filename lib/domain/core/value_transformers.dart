import 'dart:ui';

Color makeColorOpaque(Color color) {
  return color.withOpacity(1);
}

String trimToMaxLength(String text, int maxLength) {
  return text.substring(0, maxLength);
}
