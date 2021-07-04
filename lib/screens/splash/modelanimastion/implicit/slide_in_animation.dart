import 'package:flutter/material.dart';

import '../kLongAnimationDuration.dart';

/// Builds its [child] translated by [offset] and slides it into position upon
/// creation.
///
/// [delay] can delay the time it takes for the [child] to start the
/// translation.
class SlideInAnimation extends StatefulWidget {
  const SlideInAnimation({
    @required this.child,
    @required this.offset,
    this.curve = Curves.fastOutSlowIn,
    this.duration = kLongAnimationDuration,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Offset offset;
  final Curve curve;
  final Duration duration;
  final Duration delay;

  @override
  _SlideInAnimationState createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  bool _hidden = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurveTween(curve: widget.curve).animate(_controller);

    _hidden = widget.delay != Duration.zero;

    Future<void>.delayed(widget.delay).then((_) {
      if (mounted) {
        _hidden = false;
        _controller.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) => _hidden
          ? Container()
          : Transform.translate(
              offset: Offset(
                (1 - _animation.value) * widget.offset.dx,
                (1 - _animation.value) * widget.offset.dy,
              ),
              child: widget.child,
            ),
      child: widget.child,
    );
  }
}
