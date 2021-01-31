import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final appTitle;
  final carbonMonoxide;
  final nitrogenMonoxide;
  final nitrogenDioxide;
  final ozone;
  final sulphurDioxide;
  final fineParticlesMatter;
  final coarseParticulateMatter;
  final ammonia;

  DetailsScreen(
    this.appTitle,
    this.carbonMonoxide,
    this.nitrogenMonoxide,
    this.nitrogenDioxide,
    this.ozone,
    this.sulphurDioxide,
    this.fineParticlesMatter,
    this.coarseParticulateMatter,
    this.ammonia,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$appTitle | Details'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Components',
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Table(
            textDirection: TextDirection.rtl,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border: TableBorder.all(width: 1.0, color: Colors.blueGrey),
            children: [
              TableRow(
                children: [
                  Text(
                    'Amount (μg/m3)',
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    'Name',
                    textScaleFactor: 1.5,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$carbonMonoxide',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Carbon Monoxide',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$nitrogenMonoxide',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Nitrogen Monoxide',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$nitrogenDioxide',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Nitrogen Dioxide',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$ozone',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Ozone',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$sulphurDioxide',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Sulphur Dioxide',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$fineParticlesMatter',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Fine Particles Matter',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$coarseParticulateMatter',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Coarse Particulate Matter',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    '$ammonia',
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Ammonia',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
