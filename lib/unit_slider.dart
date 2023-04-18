import 'package:flutter/material.dart';

class UnitSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final int steps;
  final double stepWidth;
  final double value;
  final ValueChanged<double> onChanged;
  final Color backgroundColor;
  final Color lineColor;
  final Color indicatorColor;

  UnitSlider({
    required this.minValue,
    required this.maxValue,
    required this.steps,
    required this.value,
    required this.onChanged,
    this.stepWidth = 10,
    this.backgroundColor = Colors.black,
    this.indicatorColor = Colors.white,
    this.lineColor = Colors.grey,
  })  : assert(minValue < maxValue),
        assert(steps > 0),
        // assert(stepWidth >= 1 && stepWidth <= (maxValue - minValue) / steps),
        assert(value >= minValue && value <= maxValue);

  @override
  _UnitSliderState createState() => _UnitSliderState();
}

class _UnitSliderState extends State<UnitSlider> {
  late double _value;

  late BoxConstraints constraints;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double toScrollTo = (widget.value - widget.minValue) /
          (widget.maxValue - widget.minValue) *
          (widget.stepWidth * widget.steps);

      _scrollController.jumpTo(toScrollTo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              child: LayoutBuilder(builder: (context, constraints) {
                this.constraints = constraints;
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification ||
                        notification is ScrollUpdateNotification) {
                      double stoppedValue = notification.metrics.pixels *
                              (widget.maxValue - widget.minValue) /
                              (widget.stepWidth * widget.steps) +
                          widget.minValue;

                      widget.onChanged(stoppedValue);
                    }

                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          // color: Colors.red,
                          height: 20,
                          width: constraints.maxWidth / 2,
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < widget.steps; i++)
                              SizedBox(
                                width: widget.stepWidth,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 20,
                                    width: 1,
                                    color: widget.lineColor,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          width: constraints.maxWidth / 2,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Center(
            child: Container(
              width: 2,
              height: 30,
              decoration: BoxDecoration(
                color: widget.indicatorColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
