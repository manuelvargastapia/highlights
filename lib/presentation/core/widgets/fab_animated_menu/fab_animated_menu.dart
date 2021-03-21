import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';

class FABAnimatedMenu extends StatefulWidget {
  final List<FloatingActionButton> buttons;
  final Color baseButtonColor;

  const FABAnimatedMenu({
    Key key,
    @required this.buttons,
    this.baseButtonColor = Colors.blue,
  }) : super(key: key);

  @override
  _FABAnimatedMenuState createState() => _FABAnimatedMenuState();
}

class _FABAnimatedMenuState extends State<FABAnimatedMenu>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _translateButton;
  final _curve = Curves.easeOut;
  final double _fabHeight = 56;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() => setState(() {}));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          0.75,
          curve: _curve,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...widget.buttons
            .asMap()
            .entries
            .map(
              (entry) => Transform(
                transform: Matrix4.translationValues(
                  0,
                  _translateButton.value * (widget.buttons.length - entry.key),
                  0,
                ),
                child: entry.value,
              ),
            )
            .toList(),
        Material(
          elevation: 4,
          shape: const CircleBorder(),
          child: AnimatedIconButton(
            splashRadius: 1,
            size: 28,
            duration: const Duration(milliseconds: 600),
            onPressed: () {
              if (!isOpened) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              isOpened = !isOpened;
            },
            icons: [
              AnimatedIconItem(
                backgroundColor: widget.baseButtonColor,
                icon: const Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const AnimatedIconItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
