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
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(  // Envolver el DropdownButtonFormField con Expanded
            child: DropdownButtonFormField<String>(
              isExpanded: true,  // Asegúrate de que isExpanded esté configurado en true
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
              items: widget.items.isNotEmpty
                  ? widget.items.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.toString(),
                          overflow: TextOverflow.ellipsis, // Truncar con puntos suspensivos
                        ),
                      );
                    }).toList()
                  : [
                      DropdownMenuItem(
                        value: "NoData",
                        child: Text("No existen datos"),
                      ),
                    ],
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}






