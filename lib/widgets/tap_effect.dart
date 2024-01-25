import 'package:flutter/material.dart';

class TapEffect extends StatefulWidget {
  final bool isClickable;
  final VoidCallback onClick;
  final Widget child;

  TapEffect(
      {Key? key,
      this.isClickable = true,
      required this.onClick,
      required this.child})
      : super(key: key);

  @override
  State<TapEffect> createState() => _TapEffectState();
}

class _TapEffectState extends State<TapEffect>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  DateTime taptime = DateTime.now();
  bool isProgress = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    animationController!.animateTo(1.0,
        duration: Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  Future<void> onTapCancel() async {
    if (widget.isClickable) {
      await _onDelayed();
      animationController!.animateTo(1.0,
          duration: Duration(milliseconds: 240), curve: Curves.fastOutSlowIn);
    }
    isProgress = false;
  }

  Future<void> _onDelayed() async {
    if (widget.isClickable) {
      final int tapDuration = DateTime.now().millisecondsSinceEpoch -
          taptime.microsecondsSinceEpoch;
      if (tapDuration < 120) {
        await Future<dynamic>.delayed(Duration(milliseconds: 280));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () async {
      if (widget.isClickable) {
        await Future<dynamic>.delayed(Duration(milliseconds: 280));
        try {
          if (!isProgress) {
            widget.onClick();
            isProgress = true;
          }
        } catch (_) {}
      }
    }, onTapDown: (TapDownDetails details) {
      if (widget.isClickable) {
        taptime = DateTime.now();
        animationController!.animateTo(0.9,
            duration: Duration(milliseconds: 120), curve: Curves.fastOutSlowIn);
      }
      isProgress = true;
    },
      onTapUp: (TapUpDetails details){
      onTapCancel();
      },
      onTapCancel: (){
      onTapCancel();
      },
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget ? child){
          return Transform.scale(
            scale: animationController!.value,
            origin: Offset(0.0,0.0),
            child: widget.child,
          );
        },
      ),
    );
  }
}
