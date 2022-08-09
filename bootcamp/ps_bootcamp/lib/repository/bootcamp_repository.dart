import 'package:flutter/cupertino.dart';
import 'package:ps_bootcamp/models/bootcamp_model.dart';

import 'database.dart';

class BootcampRepository {
  Future<List<BootcampModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<BootcampModel> bootcamp = List<BootcampModel>();

    if (db.created) {
      bootcamp = List<BootcampModel>();
      bootcamp.add(
        new BootcampModel(
          id: 1,
          nome: 'Formação Cientista de Dados',
          nivel: 'Intermediário',
          duracao: '120 horas',
          conteudo:
              'Aprenda a trabalhar com dados. Do Excel ao Python e Machine Learning. Use os principais bancos SQL do mercado e faça análises de dados com business intelligence. Pandas, SciKitLearn, Jupyter e mais.',
          preco: 499.99,
          imagem: new AssetImage('cientista_dados.jpeg'),
        ),
      );
      bootcamp.add(
        new BootcampModel(
          id: 2,
          nome: 'Formação Back-End',
          nivel: 'Intermediário',
          duracao: '90 horas',
          conteudo:
              'Programe nas principais linguagens e plataformas. Explore plataformas como Python, Node.JS, PHP, Java, e .NET a fundo, além de muito conteúdo em outras linguagens como GoLang, Clojure, C/C++, VB ou Cobol. Iniciantes são bem vindos nos cursos de lógica e JavaScript.',
          preco: 399.99,
          imagem: new AssetImage('front_end.jpg'),
        ),
      );
      bootcamp.add(
        new BootcampModel(
          id: 3,
          nome: 'Formação Front-End',
          nivel: 'Intermediário',
          duracao: '90 horas',
          conteudo:
              'Desenvolva sites e webapps com HTML, CSS e JavaScript. Aprenda as boas práticas e as últimas versões do JavaScript. Estude ferramentas e frameworks do mercado como React, Angular, Webpack, jQuery e mais.',
          preco: 399.99,
          imagem: new AssetImage('back_end.jpg'),
        ),
      );
      bootcamp.add(
        new BootcampModel(
          id: 4,
          nome: 'Formação Full-Stack',
          nivel: 'Avançado',
          duracao: '160 horas',
          conteudo:
              'A formação FullStack é para desenvolvedores que visam ser profissionais completos, podendo participar de projetos com desenvoltura tanto no Frontend dominando o HTML, CSS, JavaScript e o Design Responsivo e sendo um expert no Backend, com amplo conhecimento em Java e no desenvolvimento web com as principais tecnologias.',
          preco: 599.99,
          imagem: new AssetImage('full_stack.jpg'),
        ),
      );
      bootcamp.add(
        new BootcampModel(
          id: 5,
          nome: 'Formação UX/IU Design',
          nivel: 'Básico',
          duracao: '50 horas',
          conteudo:
              'Crie designs de qualidade através de aulas dinâmicas com conceitos e ferramentas nos principais softwares do mercado. Crie layouts para impressos ou plataformas digitais. Edite vídeos ou crie animações. Aventure-se no universo da modelagem virtual 3D ou torne-se um ilustrador. Aprenda a capturar e tratar imagens com qualidade profissional.',
          preco: 199.99,
          imagem: new AssetImage('ux_ui_design.jpeg'),
        ),
      );
      bootcamp.add(
        new BootcampModel(
          id: 6,
          nome: 'Formação Desenvolvedor Android',
          nivel: 'Básico',
          duracao: '80 horas',
          conteudo:
              'Com Java ou com Kotlin você pode criar aplicações poderosas através dos cursos da Alura. Você vai ver desde o começo do desenvolvimento com Android Studio até aplicações mais robustas com os frameworks mais utilizados no mercado, passando por GPS, APIs novas e web services.',
          preco: 199.99,
          imagem: new AssetImage('android_dev.png'),
        ),
      );
    }

    return new Future.value(bootcamp);
  }
}
