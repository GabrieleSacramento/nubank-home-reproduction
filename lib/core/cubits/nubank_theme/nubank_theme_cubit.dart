import 'package:bloc/bloc.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_theme_enum.dart';

part 'nubank_theme_state.dart';

class NubankThemeCubit extends Cubit<NubankThemeState> {
  NubankThemeCubit()
      : super(
          NubankThemeState(
            currentTheme: NuThemes.defaultDeviceConfig,
          ),
        );
  void updateTheme({
    required NuThemes theme,
  }) {
    emit(
      NubankThemeState(
        currentTheme: theme,
      ),
    );
  }
}
