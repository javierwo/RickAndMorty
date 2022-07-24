import 'package:flutter/material.dart';

class personajeDetalles extends StatelessWidget {
  final name, status, species, type, gender, image;

  personajeDetalles(
      {this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text(
            this.name,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(15.0), //padding para los bordes
          child: ListView(
            children: [
              Hero(
                tag: this.image,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: NetworkImage(this.image), fit: BoxFit.contain),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline2,
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Status: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: this.status),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline2,
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Species: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: this.species),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline2,
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Type: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: this.type),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline2,
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Gender: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: this.gender),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
