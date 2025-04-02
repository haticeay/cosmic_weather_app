import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
 super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Klavye kapanması için
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: DropdownButton<String>(
          value: _selectedItem,
          hint: Text(
            widget.hint,
            style: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
          isExpanded: true,
           underline: SizedBox.shrink(), // Bu satır çizgiyi kaldırır
          dropdownColor: Colors.black,
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
            widget.onChanged(value);
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
