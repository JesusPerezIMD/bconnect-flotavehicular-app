import 'package:flutter/material.dart';

// Clase para manejar elementos del dropdown con un valor y una etiqueta
class DropdownItem<T> {
  T value;
  String label;

  DropdownItem({required this.value, required this.label});
}

// Widget CustomDropdownFormField genérico
class CustomDropdownFormField<T> extends StatefulWidget {
  final List<DropdownItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String hintText;

  CustomDropdownFormField({
    Key? key,
    required this.items,
    this.value,
    this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _CustomDropdownFormFieldState<T> createState() => _CustomDropdownFormFieldState<T>();
}

// Estado del CustomDropdownFormField
class _CustomDropdownFormFieldState<T> extends State<CustomDropdownFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            widget.hintText,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Seleccione',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            icon: Icon(
              Icons.expand_more,
              color: Colors.red,
            ),
            value: widget.value,
            items: widget.items.map((DropdownItem<T> item) {
              return DropdownMenuItem<T>(
                value: item.value,
                child: Text(
                  item.label,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}






