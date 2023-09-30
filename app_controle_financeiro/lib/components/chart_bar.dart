import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  const ChartBar({
    this.label,
    this.value,
    this.percentage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${value!.toStringAsFixed(2)}'),
         SizedBox(height: 5),
         SizedBox(
          height: 60,
          width: 10,
          child: Stack(//O Stack possíbilita em que você possa adcionar vários componentes um em cima do outro;
           children:[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),//O Border.all significa borda em todas as direções
                color:  Color.fromRGBO(220, 220, 220,1),
                borderRadius: BorderRadius.circular(5),

              ),
            )
            FractionallySizedBox(
              heightFactor: percentage,
              child: Container(
                 decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 220,1),
                 ),
              ),
            )
           ]
        ),
         ),
        const SizedBox(height: 5),
        Text(label!),
      ],
    );
  }
}
