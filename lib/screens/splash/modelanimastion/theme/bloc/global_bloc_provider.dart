import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_line/screens/splash/modelanimastion/theme/bloc/theme_bloc.dart';

/// The [GlobalBlocProvider] is built above the root [MaterialApp] to provide
/// every descendant with globally available blocs.
///
/// These blocs will only be created once.
class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
        // theme
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),

        // authentication
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),

        // application
        // can't be lazy since initialization starts upon bloc creation
        //  BlocProvider<ApplicationBloc>(
        //lazy: false,
        //create: (BuildContext context) => ApplicationBloc(

        // themeBloc: context.read<ThemeBloc>(),
        //),
        //),

        // home timeline
      ],
      child: child,
    );
  }
}
