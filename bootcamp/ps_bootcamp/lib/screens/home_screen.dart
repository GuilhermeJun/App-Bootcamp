import 'package:flutter/material.dart';
import 'package:ps_bootcamp/models/bootcamp_model.dart';
import 'package:ps_bootcamp/repository/bootcamp_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Bootcamps',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<BootcampModel>>(
        future: BootcampRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildBootcampView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: _drawer(),
    );
  }

  ListView buildBootcampView(List<BootcampModel> bootcamp) {
    return ListView.builder(
      itemCount: bootcamp == null ? 0 : bootcamp.length,
      itemBuilder: (BuildContext context, int index) {
        return cardBootcamp(bootcamp[index]);
      },
    );
  }

  Card cardBootcamp(BootcampModel bootcamp) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      color: Colors.blueAccent,
      child: Column(
        children: [
          Image(image: bootcamp.imagem),
          ListTile(
            contentPadding:
                EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
            title: Text(
              bootcamp.nome,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            subtitle: Row(
              children: [
                Text(
                  bootcamp.nivel,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                SizedBox(
                  width: 60.0,
                ),
                Text(
                  bootcamp.duracao,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/bootcamp_detalhes',
                  arguments: bootcamp);
            },
          ),
        ],
      ),
    );
  }
}

Drawer _drawer() {
  return Drawer(
    elevation: 16.0,
    child: Center(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Usuário'),
            accountEmail: Text('user01234@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('User'),
            ),
          ),
          ListTile(
            title: new Text("Início"),
            leading: new Icon(Icons.home),
          ),
          ListTile(
            title: new Text("Bootcamp"),
            leading: new Icon(Icons.collections_bookmark_rounded),
          ),
          ListTile(
            title: new Text("Minha conta"),
            leading: new Icon(Icons.person),
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: new Text(
              "PS13SI Ltda.\n©Todos os direitos reservados.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
