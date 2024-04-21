import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank_home_reproduction/core/cubits/nubank_theme/nubank_theme_cubit.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_theme.dart';

extension NubankThemeExtension on BuildContext {
  NubankThemeCubit get _nuThemeCubit =>
      BlocProvider.of<NubankThemeCubit>(this, listen: true);

  NubankTheme get nuTheme =>
      _nuThemeCubit.state.currentTheme.getRelatedNubankBackgroundColor;
}
