import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_line/screens/splash/modelanimastion/theme/harpy_theme.dart';
import 'package:the_line/screens/splash/modelanimastion/theme/harpy_theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

/// The [ThemeBloc] handles initialization of the [HarpyTheme] that creates the
/// [ThemeData] used by the root [MaterialApp].
///
/// When a user is authenticated, their selected theme and their custom themes
/// are loaded using the [ThemePreferences].
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(UninitializedState());

  get harpyTheme => null;

  static ThemeBloc of(BuildContext context) => context.watch<ThemeBloc>();

  /// The [HarpyTheme] used in the root [MaterialApp].

  /// The list of custom themes for the currently authenticated user.
  ///
  /// Is empty when no user is authenticated, or when the user has no custom
  /// themes.
  /// Custom themes can only be created when using Harpy Pro.
  List<HarpyTheme> customThemes = <HarpyTheme>[];

  /// Returns the selected theme id based off of the [ThemePreferences].
  ///
  /// If the selected theme id is `-1` (no theme selected), `0` is returned
  /// instead.

  HarpyThemeData _decodeThemeData(String themeDataJson) {
    try {
      return HarpyThemeData.fromJson(jsonDecode(themeDataJson));
    } catch (e, st) {
      return null;
    }
  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  /// Loads the custom themes from the [ThemePreferences] for the currently
  /// authenticated user.

  /// Updates the system ui to match the [theme].
}
