library ffr_custom_switch;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FFRCustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final String lable;
  final TextStyle style;

  const FFRCustomSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.inactiveColor,
    @required this.activeColor,
    @required this.lable,
    @required this.thumbColor,
    this.style,
  }) : super(key: key);

  @override
  _FFRCustomSwitchState createState() => _FFRCustomSwitchState();
}

class _FFRCustomSwitchState extends State<FFRCustomSwitch> with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: ListTile(
            title: Text(widget.lable, style: widget.style,),
            trailing: Container(
              width: 65,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? widget.inactiveColor
                    : widget.activeColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleAnimation.value == Alignment.centerRight
                        ? Padding(
                            padding: const EdgeInsets.only(left: 30, right: 4),
                          )
                        : Container(),
                    Align(
                      alignment: _circleAnimation.value,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.thumbColor,
                        ),
                      ),
                    ),
                    _circleAnimation.value == Alignment.centerLeft
                        ? Padding(
                            padding: const EdgeInsets.only(right: 30, left: 4),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
