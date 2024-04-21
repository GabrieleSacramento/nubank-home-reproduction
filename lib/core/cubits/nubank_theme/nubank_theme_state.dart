part of 'nubank_theme_cubit.dart';

class NubankThemeState {
  final NuThemes currentTheme;

  const NubankThemeState({
    required this.currentTheme,
  });

  NubankThemeState copyWith({
    NuThemes? theme,
  }) {
    return NubankThemeState(
      currentTheme: theme ?? currentTheme,
    );
  }
}
