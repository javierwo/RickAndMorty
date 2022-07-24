import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_1/Pantallas/personajeDetalles.dart';
import 'package:flutter_app_1/Models/Personaje.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController textController = TextEditingController();
  late Future<List<Personaje>> _listadoPersonajes;

  Future<List<Personaje>> _getPersonajes() async {
    List<Personaje> personajes = [];
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body);
      for (var personaje in jsonData["results"]) {
        personajes.add(Personaje(
          personaje['id'],
          personaje['name'],
          personaje['status'],
          personaje['species'],
          personaje['type'],
          personaje['gender'],
          personaje['image'],
        ));
      }
      return personajes;
    } else {
      throw Exception("Failed");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoPersonajes = _getPersonajes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text(
          'Rick and Morty',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(15.0), //padding para los bordes
        child: ListView(
          children: <Widget>[
            CupertinoSearchTextField(
                placeholder: 'Buscar personaje',
                onChanged: (String value) {
                  print('The text has changed to: $value');
                },
                onSubmitted: (String value) {
                  print('Submitted text: $value');
                }),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15),
              child: Text(
                'Personajes',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.right,
              ),
            ),
            FutureBuilder(
              future: _listadoPersonajes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.8,
                    children: _listPersonajes(snapshot.data),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error al cargar los datos");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _listPersonajes(data) {
    List<Widget> personajes = [];

    for (var personaje in data) {
      personajes.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => personajeDetalles(
                name: personaje.name,
                status: personaje.status,
                species: personaje.species,
                type: personaje.type,
                gender: personaje.gender,
                image: personaje.image,
              ),
            ));
          },
          child: Container(
            child: Column(
              children: [
                Hero(
                  tag: personaje.image,
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(personaje.image),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Chip(
                  elevation: 0,
                  backgroundColor: Colors.grey[100],
                  shadowColor: Colors.black,
                  label: Text(
                    personaje.name,
                    style: Theme.of(context).textTheme.headline4,
                  ), //Text
                ),
              ],
            ),
          ),
        ),
      );
    }

    return personajes;
  }
}
