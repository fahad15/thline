part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();

  Stream<ThemeState> applyAsync({
    ThemeState currentState,
    ThemeBloc bloc,
  });
}

/// The event to change the app wide theme.
class ChangeThemeEvent extends ThemeEvent {
  const ChangeThemeEvent({
    @required this.id,
    this.saveSelection = false,
  });

  /// The `id` used to save the selection to.
  ///
  /// 0..9: index of predefined theme (unused indices are reserved)
  /// 10+: index of custom theme (pro only)
  final int id;

  /// Whether the selection should be saved using the [ThemePreferences].
  final bool saveSelection;

  HarpyTheme _findTheme(ThemeBloc bloc) {
    try {
      if (id < 10) {
      } else {
        // selected theme id = 10 -> index = 0
        final int index = id - 10;

        return bloc.customThemes[index];
      }
    } catch (e, st) {
      return null;
    }
  }

  @override
  Stream<ThemeState> applyAsync({
    ThemeState currentState,
    ThemeBloc bloc,
  }) async* {
    final HarpyTheme harpyTheme = _findTheme(bloc);

    if (harpyTheme != null) {
      if (saveSelection) {}
    }

    yield ThemeSetState();
  }
}

/// Updates the system ui based on the [theme].
///
/// Does not yield anything.
class UpdateSystemUi extends ThemeEvent {
  const UpdateSystemUi({
    @required this.theme,
  });

  final HarpyTheme theme;

  @override
  Stream<ThemeState> applyAsync({
    ThemeState currentState,
    ThemeBloc bloc,
  }) async* {}
}

/// Saves the custom themes in [ThemeBloc.customThemes] using the
/// [ThemePreferences].
class SaveCustomThemes extends ThemeEvent {
  const SaveCustomThemes();

  String _encodeThemeData(HarpyThemeData themeData) {
    try {
      return jsonEncode(themeData.toJson());
    } catch (e, st) {
      return null;
    }
  }

  @override
  Stream<ThemeState> applyAsync({
    ThemeState currentState,
    ThemeBloc bloc,
  }) async* {
    final List<String> encodedCustomThemes = bloc.customThemes
        .map((HarpyTheme theme) => HarpyThemeData.fromHarpyTheme(theme))
        .map(_encodeThemeData)
        .where((String themeDataJson) => themeDataJson != null)
        .toList();
  }
}

class RefreshTheme extends ThemeEvent {
  const RefreshTheme();

  @override
  Stream<ThemeState> applyAsync({
    ThemeState currentState,
    ThemeBloc bloc,
  }) async* {}
}
