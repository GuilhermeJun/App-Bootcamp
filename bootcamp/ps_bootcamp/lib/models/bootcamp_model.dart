import 'package:flutter/material.dart';

class BootcampModel {
  int id;
  String nome;
  String nivel;
  String duracao;
  String conteudo;
  double preco;
  AssetImage imagem;

  BootcampModel({
    this.id,
    this.nome,
    this.nivel,
    this.duracao,
    this.conteudo,
    this.preco,
    this.imagem,
  });
}
