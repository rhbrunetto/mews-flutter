import 'package:flutter/widgets.dart';
import 'package:optimus/optimus.dart';

typedef ResolveStyle = TextStyle Function(Breakpoint);

enum OptimusTypographyColor { primary, secondary }

class OptimusTypography extends StatelessWidget {
  const OptimusTypography({
    Key? key,
    required this.resolveStyle,
    this.color = OptimusTypographyColor.primary,
    required this.child,
    this.maxLines,
    this.align,
  }) : super(key: key);

  final ResolveStyle resolveStyle;
  final Widget child;
  final OptimusTypographyColor color;
  final int? maxLines;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).screenBreakpoint;
    final theme = OptimusTheme.of(context);

    return DefaultTextStyle.merge(
      child: child,
      textAlign: align,
      maxLines: maxLines,
      style: resolveStyle(screenSize).copyWith(color: _color(theme)),
    );
  }

  // TODO(VG): can be changed when final dark theme design is ready.
  Color _color(OptimusThemeData theme) {
    switch (color) {
      case OptimusTypographyColor.primary:
        return theme.colors.defaultTextColor;
      case OptimusTypographyColor.secondary:
        return theme.colors.secondaryTextColor;
    }
  }
}
