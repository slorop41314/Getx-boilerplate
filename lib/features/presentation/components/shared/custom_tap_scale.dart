part of 'shared.dart';

class CustomTapScale extends StatefulWidget {
  final Widget child;
  final bool isDisabled;

  CustomTapScale({
    required this.child,
    this.isDisabled = false,
  });

  @override
  State<CustomTapScale> createState() => _CustomTapScaleState();
}

class _CustomTapScaleState extends State<CustomTapScale>
    with TickerProviderStateMixin {
  static const _ANIM_DURATION = Duration(milliseconds: 300);
  static const _MIN_SCALE = 0.97;
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scale = Tween<double>(begin: 1.0, end: 1.0).animate(
      _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: !widget.isDisabled ? _onTapDown : null,
      onPointerCancel: _onTapCancel,
      onPointerUp: _onTapUp,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ScaleTransition(
            scale: _scale,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  Future<void> anim({double? scale, double? opacity, Duration? duration}) {
    _controller.stop();
    _controller.duration = duration ?? Duration.zero;
    _scale = Tween<double>(
      begin: _scale.value,
      end: scale,
    ).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: _controller,
    ));
    _controller.reset();
    return _controller.forward();
  }

  Future<void> _onTapDown(_) {
    return anim(
      scale: _MIN_SCALE,
      duration: _ANIM_DURATION,
    );
  }

  Future<void> _onTapUp(_) {
    return anim(
      scale: 1.0,
      duration: _ANIM_DURATION,
    );
  }

  Future<void> _onTapCancel(_) {
    return _onTapUp(_);
  }
}
