import 'package:flutter/material.dart';

enum SmartBreakpointEnum {
  small(600), // Phone sized screen
  medium(1024), // Tablet sized screen
  large(1440), // Desktop sized screen
  huge(double.infinity); // Wide Desktop sized screen

  final double value;
  const SmartBreakpointEnum(this.value);
}

class SmartBreakpoints extends InheritedWidget {
  final SmartBreakpointEnum breakpoint;
  final Size? size;

  const SmartBreakpoints({super.key, required super.child, required this.breakpoint, this.size});

  @override
  bool updateShouldNotify(covariant SmartBreakpoints oldWidget) {
    return breakpoint != oldWidget.breakpoint;
  }

  static SmartBreakpoints of(BuildContext context) {
    final responsiveProvider = context.dependOnInheritedWidgetOfExactType<SmartBreakpoints>();
    assert(responsiveProvider != null, "ConectartBreakpointsProvider was not set in the context!");
    return responsiveProvider!;
  }

  static bool isSmall(BuildContext context) => of(context).breakpoint == SmartBreakpointEnum.small;
  static bool isMedium(BuildContext context) => of(context).breakpoint == SmartBreakpointEnum.medium;
  static bool isLarge(BuildContext context) => of(context).breakpoint == SmartBreakpointEnum.large;
  static bool isHuge(BuildContext context) => of(context).breakpoint == SmartBreakpointEnum.huge;

  static bool isMediumOrLesser(BuildContext context) =>
      of(context).breakpoint.value <= SmartBreakpointEnum.medium.value;
  static bool isLargeOrLesser(BuildContext context) => of(context).breakpoint.value <= SmartBreakpointEnum.large.value;

  static bool isMediumOrBigger(BuildContext context) => of(context).breakpoint.value > SmartBreakpointEnum.small.value;
  static bool isLargeOrBigger(BuildContext context) => of(context).breakpoint.value > SmartBreakpointEnum.medium.value;

  static SmartBreakpointEnum getBreakpoint(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    SmartBreakpointEnum result = SmartBreakpointEnum.huge;
    for (SmartBreakpointEnum breakpoint in SmartBreakpointEnum.values) {
      if (width <= breakpoint.value) {
        result = breakpoint;
        break;
      }
    }

    return result;
  }
}

class SmartBreakpointsProvider extends StatefulWidget {
  final Widget child;

  const SmartBreakpointsProvider({super.key, required this.child});

  @override
  State<SmartBreakpointsProvider> createState() => _SmartBreakpointsProviderState();
}

class _SmartBreakpointsProviderState extends State<SmartBreakpointsProvider> {
  SmartBreakpointEnum breakpoint = SmartBreakpointEnum.small;

  void _observe(BuildContext context) {
    SmartBreakpointEnum currentBreakpoint = SmartBreakpoints.getBreakpoint(context);
    if (currentBreakpoint != breakpoint) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!mounted) return;
        setState(() {
          breakpoint = currentBreakpoint;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartBreakpoints(
      breakpoint: breakpoint,
      child: Builder(
        builder: (context) {
          _observe(context);
          return widget.child;
        },
      ),
    );
  }
}
