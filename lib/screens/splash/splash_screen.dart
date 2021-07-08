import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/screens/splash/harpy_scaffold.dart';
import 'package:the_line/screens/splash/modelanimastion/theme/harpy_theme_data.dart';
import 'package:the_line/screens/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/services.dart';
import 'modelanimastion/fadeAnimation.dart';
import 'modelanimastion/harpy_buttom.dart';
import 'modelanimastion/implicit/headlines.dart';
import 'modelanimastion/implicit/slide_animation.dart';
import 'modelanimastion/implicit/slide_in_animation.dart';
import 'modelanimastion/kLongAnimationDuration.dart';
import 'modelanimastion/theme/application/bounce_in_animation.dart';
import 'modelanimastion/theme/harpyBackground.dart';
import 'modelanimastion/theme/harpy_theme.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();
  final GlobalKey<SlideAnimationState> _slideLoginKey =
      GlobalKey<SlideAnimationState>();

  SplashScreen({
    this.child,
    this.colors,
    this.borderRadius,
  });

  final Widget child;
  final List<Color> colors;

  /// The [borderRadius] of the [BoxDecoration].
  final BorderRadius borderRadius;

  @override
  Widget _buildAboutButton(ThemeData theme) {
    //
    return Align(
      alignment: Alignment.topRight,
      child: SafeArea(
        child: HarpyButton.flat(
            icon: Icon(
              CupertinoIcons.info,
              color: theme.textTheme.bodyText1.color.withOpacity(.8),
            ),
            padding: const EdgeInsets.all(16),
            onTap: () {}
            // app<HarpyNavigator>().pushNamed(AboutScreen.route),
            ),
      ),
    );
  }

  Widget _buildText() {
    //
    return const Align(
      alignment: Alignment.bottomCenter,
      child: SecondaryHeadline('welcome to'),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    //
    final Color color = theme.textTheme.bodyText2.color;

    return FractionallySizedBox(
      widthFactor: 2 / 3,
      child: SlideInAnimation(
        offset: const Offset(0, 20),
        duration: const Duration(seconds: 3),
        delay: const Duration(milliseconds: 800),
        child: FlareActor(
          'assets/flare/harpy_title.flr',
          alignment: Alignment.bottomCenter,
          animation: 'show',
          color: color,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    //
    return const SlideInAnimation(
      duration: Duration(seconds: 3),
      offset: Offset(0, 20),
      delay: Duration(milliseconds: 800),
      child: FlareActor(
        'assets/flare/harpy_logo.flr',
        animation: 'show',
        color: Colors.white,
      ),
    );
  }

  Widget _buildButtons() {
    //
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _LegacyLoginButton(onTap: () {}),
        const SizedBox(height: 8),
        _WebviewLoginButton(
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLoginScreen(ThemeData theme) {
    //final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SlideAnimation(
      key: _slideLoginKey,
      endPosition: Offset.zero,
      child: Stack(
        children: <Widget>[
          _buildAboutButton(theme),
          Column(
            children: <Widget>[
              Expanded(child: _buildText()),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Expanded(child: _buildTitle(theme)),
                    Expanded(child: _buildLogo()),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildButtons()),
              const SizedBox(height: 16),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> backgroundColors;

    backgroundColors = <Color>[Colors.black, const Color(0xff17233d)];
    const Color(0xff6b99ff);
    backgroundColors = [
      // Color(0xff17233d),
      //Color(0xff000005),
      // Color(0xff17233d),
      const Color(0xff341a3d),
      const Color(0xff43224f),
      //Color(0xff6b99ff),
    ];
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: Color(0xff17233d),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: _buildGradient(backgroundColors),
          ),
          child: Stack(
            children: [
              _buildLoginScreen(theme),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient _buildGradient(List<Color> backgroundColors) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: backgroundColors.length > 0
          ? backgroundColors
          : <Color>[
              backgroundColors.first,
              backgroundColors.first,
            ],
    );
  }

  /*Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundColors.length > 1
                ? backgroundColors
                : <Color>[
                    backgroundColors.first,
                    backgroundColors.first,
                  ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/logo.jpg',
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );*/

}

class _LegacyLoginButton extends StatelessWidget {
  const _LegacyLoginButton({
    @required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: const Duration(milliseconds: 2800),
      child: HarpyButton.raised(
        text: const Text('login with twitter'),
        onTap: onTap,
      ),
    );
  }
}

class _WebviewLoginButton extends StatelessWidget {
  const _WebviewLoginButton({
    @required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: const Duration(milliseconds: 3100),
      duration: kLongAnimationDuration,
      shouldHide: false,
      child: HarpyButton.flat(
        text: const Text(
          'trouble signing in? try webview login',
          style: TextStyle(fontSize: 13),
        ),
        onTap: onTap,
      ),
    );
  }
}
