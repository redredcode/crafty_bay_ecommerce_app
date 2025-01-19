import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({
    super.key,
    required this.colors,
    required this.child,
  });

  final List<Color> colors;
  final Widget child;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color? _selectedColor;
  late bool
      _isSelected; // might remove this later. totally unnecessary for now...

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...widget.colors.map(
            (color) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = color;
                  _isSelected = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: color,
                    ),
                    if (_selectedColor == color)
                      Icon(_isSelected ? Icons.check : null,
                          color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
