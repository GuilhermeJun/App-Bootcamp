import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_bootcamp/models/bootcamp_model.dart';

class BootcampDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BootcampModel bootcampModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: bootcampModel.imagem,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              color: Colors.blueAccent,
              height: 500.0,
              child: _column(bootcampModel, context),
            ),
          ],
        ),
      ),
    );
  }

  Column _column(BootcampModel bootcampModel, BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            title: Text(
              bootcampModel.nome,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            subtitle: SizedBox(
              height: 50.0,
              child: Row(
                children: [
                  Text(
                    bootcampModel.nivel,
                    style: _textStyle(),
                  ),
                  _sizedBox(),
                  Text(
                    bootcampModel.duracao,
                    style: _textStyle(),
                  ),
                  _sizedBox(),
                  Card(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      color: Color.fromRGBO(0, 0, 102, .9),
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'RS${bootcampModel.preco}',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        _card(bootcampModel, context),
      ],
    );
  }

  SizedBox _sizedBox() {
    return SizedBox(
      width: 25.0,
    );
  }

  TextStyle _textStyle() => TextStyle(color: Colors.white, fontSize: 17.0);

  Card _card(BootcampModel bootcampModel, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Text(
              bootcampModel.conteudo,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            ElevatedButton(
              child: Text(
                'Matricular-se',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Matrículado com Sucesso!"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
