import 'package:flutter/material.dart';

enum Type {
  text,
  elevated,
  outlined,
}

class Button extends StatelessWidget {
  final Type type;

  /// 按钮属性
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  final Widget? child;
  final ButtonStyle? style;

  /// 按钮文本属性
  final String? text;
  final TextStyle? textStyle;

  const Button({
    super.key,
    this.type = Type.elevated,
    this.onPressed,
    this.child,
    this.text,
    this.textStyle,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = const SizedBox.shrink();
    switch (type) {
      case Type.text:
        button = _buildText();
        break;
      case Type.elevated:
        button = _buildElevated();
        break;
      case Type.outlined:
        button = _buildOutlined();
        break;
    }

    return button;
  }

  _buildChild() {
    if (null != child) {
      return child;
    }
    return Text(
      text ?? "",
      style: textStyle,
    );
  }

  _buildText() {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      child: _buildChild(),
    );
  }

  _buildElevated() {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      child: _buildChild(),
    );
  }

  _buildOutlined() {
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      child: _buildChild(),
    );
  }
}
