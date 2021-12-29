import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  final int valor;
  final String titulo;

  const EntradaTempo({Key? key, required this.valor, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.titulo,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_downward,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                primary: Colors.red,
              ),
            ),
            Text(
              '${this.valor} min',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_upward,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
