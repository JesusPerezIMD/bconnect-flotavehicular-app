import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  CustomDropdownFormField({
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomDropdownFormFieldState createState() => _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0), // Espacio alrededor del DropdownButtonFormField
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Seleccione', // Texto "Seleccionar"
              hintStyle: TextStyle(
                 color: Color.fromARGB(255, 0, 0, 0),// Color del texto del hintText
              ),
            ),
            icon: Icon(
              Icons.expand_more, // Icono de flecha hacia abajo
              color: Colors.red, // Color del icono
            ),
            value: widget.value,
            items: widget.items.isNotEmpty
                ? widget.items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item.toString()), // Cambia aquí para usar tus propios datos
                    );
                  }).toList()
                : [DropdownMenuItem(
                    value: "NoData",
                    child: Text("No existen datos"),
                  )],
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}



