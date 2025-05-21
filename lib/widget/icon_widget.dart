import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final Color backgroundColor;
  static final Decoration _decoration = BoxDecoration(shape: BoxShape.circle);
  final double width;
  final double height;
  final IconData icons;

  const CircleIcon({
    super.key,
    Color? backgroundColor,
    double? height,
    double? width,
    required this.icons
  }) : backgroundColor = backgroundColor ?? Colors.transparent,
       width = width ?? double.infinity,
       height = height ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: _IconClipper(CircleIcon._decoration),
      child: ColoredBox(
        color: backgroundColor,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: this.width,
              height: this.height,
              child: Icon(this.icons),
            );
          },
        ),
      ),
    );
  }
}

class _IconClipper extends CustomClipper<Path> {
  final Decoration decoration;

  const _IconClipper(this.decoration);

  @override
  Path getClip(final Size size) {
    final Rect rect = Offset.zero & size;

    return this.decoration.getClipPath(rect, TextDirection.ltr);
  }

  @override
  bool shouldReclip(covariant final CustomClipper<Path> customClipper) {
    if (customClipper.runtimeType != _IconClipper) {
      return false;
    }

    final _IconClipper oldProfileClipper = customClipper as _IconClipper;
    return oldProfileClipper.decoration != this.decoration;
  }
}
