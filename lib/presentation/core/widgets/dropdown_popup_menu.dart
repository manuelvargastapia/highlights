import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' show radians;

// TODO: refactor to improve readibility (ex: hooks)

/// Custom widget to create dropdowns based on popups.
///
/// It receives a [PopupMenuItemSelected] and [PopupMenuItemBuilder]
/// functions, just like [PopupMenuButton]. It also receives a [child]
/// to render as the base widget to be pressed in order to display an
/// animated popup.
///
/// [iconColor] set the color of the leading arrow icon and [isHorizontal]
/// modifies the widget to render the items as an horizontal scrollable list
/// inside the popup.
///
/// The popup is render with a [FadeTransition] animation and the leading arrow
/// icon is also animated during its transition from closed to open.
class DropdownPopupMenu<T> extends StatefulWidget {
  const DropdownPopupMenu({
    Key key,
    @required this.itemBuilder,
    @required this.child,
    @required this.iconColor,
    @required this.onSelected,
    this.isHorizontal = false,
  }) : super(key: key);

  final PopupMenuItemBuilder<T> itemBuilder;
  final PopupMenuItemSelected<T> onSelected;
  final Widget child;
  final Color iconColor;
  final bool isHorizontal;

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<DropdownPopupMenu<T>>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _rotation = Tween<double>(begin: 0, end: 180).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeInExpo,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return TextButton(
          onPressed: _showPopup,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 12),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
          ),
          child: AnimatedSize(
            duration: _controller.duration ~/ 2,
            curve: Curves.fastOutSlowIn,
            vsync: this,
            child: Row(
              mainAxisSize: constraints.hasTightWidth
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.child,
                const SizedBox(width: 8),
                AnimatedBuilder(
                  animation: _rotation,
                  builder: (BuildContext context, Widget child) {
                    return Transform.rotate(
                      angle: radians(_rotation.value),
                      child: child,
                    );
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 26,
                    color: widget.iconColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPopup() {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Rect position = Rect.fromPoints(
      button.localToGlobal(Offset.zero, ancestor: overlay),
      button.localToGlobal(
        button.size.bottomRight(Offset.zero),
        ancestor: overlay,
      ),
    );
    final buttonColor = Theme.of(context).buttonColor;
    final route = _PopupMenuRoute<T>(
      items: widget.itemBuilder(context),
      position: position,
      isHorizontal: widget.isHorizontal,
      shadow: BoxShadow(
        color: buttonColor,
        blurRadius: 6,
        spreadRadius: -2,
      ),
    );
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 150), () {
      return Navigator.of(context, rootNavigator: true)
          .push<T>(route)
          .then((T result) {
        if (!mounted) {
          return;
        }
        if (result != null) {
          widget.onSelected(result);
        }
        _controller.reverse();
      });
    });
  }
}

/// Builds the individual items rendered in the list.
///
/// It extends from [PopupMenuEntry] but it's intended to be used in a
/// similar way to [DropdownMenuItem].
class DropdownPopupMenuItem<T> extends PopupMenuEntry<T> {
  const DropdownPopupMenuItem({
    Key key,
    this.value,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final T value;

  final Widget child;

  @override
  _DropdownMenuItemState<T> createState() => _DropdownMenuItemState<T>();

  @override
  double get height => 32;

  @override
  bool represents(T value) => this.value == value;
}

class _DropdownMenuItemState<T> extends State<DropdownPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop<T>(widget.value),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: widget.child,
      ),
    );
  }
}

class _PopupMenuRoute<T> extends PopupRoute<T> {
  _PopupMenuRoute({
    @required this.items,
    @required this.position,
    @required this.isHorizontal,
    this.shadow = const BoxShadow(
      color: Colors.black26,
      blurRadius: 6,
      spreadRadius: -2,
    ),
  });

  final List<PopupMenuEntry<T>> items;
  final Rect position;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  final BoxShadow shadow;
  final bool isHorizontal;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondary,
    Widget child,
  ) {
    final opacity = CurvedAnimation(
      parent: animation,
      curve: Curves.fastOutSlowIn,
    );
    final top = Tween<double>(
      begin: position.top,
      end: position.bottom,
    ).animate(opacity);
    return FadeTransition(
      opacity: opacity,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Positioned(
                top: isHorizontal ? top.value - 8 : top.value,
                left: isHorizontal ? 32 : position.left,
                width: isHorizontal
                    ? MediaQuery.of(context).size.width - 64
                    : position.width,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: position.width,
                    maxWidth: position.width,
                    maxHeight: constraints.maxHeight - position.bottom,
                  ),
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _PopupPanel(
      items: items,
      padding: const EdgeInsets.only(top: 4),
      shadow: shadow,
      isHorizontal: isHorizontal,
    );
  }
}

class _PopupPanel<T> extends StatelessWidget {
  const _PopupPanel({
    Key key,
    @required this.items,
    @required this.padding,
    @required this.isHorizontal,
    this.shadow = const BoxShadow(
      color: Colors.black26,
      blurRadius: 6,
      spreadRadius: -2,
    ),
  })  : assert(padding != null),
        super(key: key);

  final List<PopupMenuEntry<T>> items;
  final EdgeInsets padding;
  final BoxShadow shadow;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final border = _PopupPanelBorder(
      side: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      shadow: shadow,
    );
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(border: border),
        height: isHorizontal ? 60 : null,
        child: Material(
          type: MaterialType.transparency,
          child: ListView(
            scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
            physics: const BouncingScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: !isHorizontal,
            children: items,
          ),
        ),
      ),
    );
  }
}

class _PopupPanelBorder extends BoxBorder {
  const _PopupPanelBorder({
    this.side = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.shadow,
  })  : assert(side != null),
        assert(borderRadius != null);

  final BorderSide side;

  @override
  BorderSide get top => side;

  @override
  BorderSide get bottom => side;

  @override
  bool get isUniform => true;

  final BorderRadiusGeometry borderRadius;

  final Color color;

  final BoxShadow shadow;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) {
    return _PopupPanelBorder(
      side: side.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect.deflate(side.width), textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final radius = borderRadius.resolve(textDirection);
    final roundedRect = radius.toRRect(rect);
    return Path.combine(
      PathOperation.union,
      Path()..addRRect(roundedRect),
      Path()..close(),
    );
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius borderRadius,
  }) {
    final path = getOuterPath(rect, textDirection: textDirection);
    if (shadow != null) {
      final scale = 1 + shadow.spreadRadius / 100;
      final center = rect.center;
      final m = Matrix4.translationValues(center.dx, center.dy, 0)
        ..scale(scale, scale)
        ..translate(-center.dx, -center.dy);
      canvas.drawPath(path.transform(m.storage), shadow.toPaint());
    }
    if (color != null) {
      canvas.drawPath(path, Paint()..color = color);
    }
    if (side.style == BorderStyle.solid) {
      canvas.drawPath(path, side.toPaint());
    }
  }
}
