import 'package:flutter/material.dart';
import 'package:flutter_to_airplay/src/airplay_route_picker_view.dart';

/// This widget returns an AirplayRoutePicker button from native code,
/// it can be added as a button or as an app bar icon, just like any widget.
class AirPlayIconButton extends StatelessWidget {
  /// The color to use for the icon inside the button
  final Color? color;

  /// That will just increase the tapable area of this button.
  final double? size;

  /// The padding around the button's icon. The entire padded icon will react
  /// to input gestures.
  final EdgeInsetsGeometry padding;

  /// Optional size constraints for the button.
  final BoxConstraints? constraints;

  /// Defines how the icon is positioned within the IconButton.
  final Alignment alignment;

  /// The route picker view will start presenting routes to the user.
  final VoidCallback? onShowPickerView;

  /// The route picker view will finished presenting routes to the user.
  final VoidCallback? onClosePickerView;

  const AirPlayIconButton({
    Key? key,
    this.color,
    this.size,
    this.constraints,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    this.onShowPickerView,
    this.onClosePickerView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);

    final tappableAreaSize = size ?? iconTheme.size ?? 24.0;

    return ConstrainedBox(
      constraints: constraints ??
          const BoxConstraints(
            minHeight: kMinInteractiveDimension,
            maxHeight: kMinInteractiveDimension,
          ),
      child: Padding(
        padding: padding,
        child: Align(
          alignment: alignment,
          child: AirPlayRoutePickerView(
            height: tappableAreaSize,
            width: tappableAreaSize,
            tintColor: color ?? iconTheme.color,
            activeTintColor: color ?? iconTheme.color,
            onClosePickerView: onClosePickerView,
            onShowPickerView: onShowPickerView,
          ),
        ),
      ),
    );
  }
}
