import 'package:flutter/material.dart';

class DetailButton extends StatelessWidget {
  final Widget _child;
  final Function()? _onPressed;

  const DetailButton({
    super.key,
    required Widget child,
    required Function()? onPressed,
  })  : _child = child,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _onPressed,
        child: _child,
      ),
    );
  }
}
