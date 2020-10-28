import "package:flutter/material.dart";

void main() {
  runApp(new MaterialApp(
    title: "App Geshin Impact",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Creando un arreglo de los datos
  List<Container> characters = List();
  var array = [
    {
      "nombre": "Mona",
      "vision": "Hydro",
      "arma": "Catalizador",
      "imagen": "mona.jpg",
      "rank": "A",
      "descripcion":
          "Una misteriosa joven astróloga que se proclama a sí misma como la Astróloga Mona Megistus y que posee habilidades para igualar el título."
    },
    {
      "nombre": "Diluc",
      "vision": "Pyro",
      "arma": "Claymore",
      "imagen": "diluc.jpg",
      "rank": "S",
      "descripcion":
          "El magnate de un imperio de bodegas en Mondstadt, incomparable en todos los sentidos."
    },
    {
      "nombre": "Fischl",
      "vision": "Electro",
      "imagen": "fischl.jpg",
      "arma": "Arco",
      "rank": "S",
      "descripcion":
          "Una chica misteriosa que se hace llamar Prinzessia der Verurteilung y viaja con un cuervo nocturno llamado Oz."
    },
    {
      "nombre": "Beidou",
      "vision": "Electro",
      "arma": "Claymore",
      "imagen": "beidou.jpg",
      "rank": "C",
      "descripcion":
          "Beidou es el líder de Crux, una flota armada con base en el puerto de Liyue. Una flota armada significa exactamente lo que parece: una flota de barcos armados hasta los dientes."
    },
    {
      "nombre": "Kaeya",
      "vision": "Cryo",
      "arma": "Espada",
      "imagen": "kaeya.jpg",
      "rank": "C",
      "descripcion":
          "Un pensador de los Caballeros de Favonius con una apariencia algo exótica."
    },
    {
      "nombre": "Noelle",
      "vision": "Geo",
      "arma": "Claymore",
      "imagen": "noelle.png",
      "rank": "C",
      "descripcion":
          "Una sirvienta al servicio de los Caballeros de Favonius que sueña con unirse algún día a sus filas."
    },
    {
      "nombre": "Xiangling",
      "vision": "Pyro",
      "imagen": "xiangling.jpg",
      "rank": "A",
      "arma": "Lanza",
      "descripcion":
          "Una chef de renombre de Liyue. Es una apasionada de la cocina y se destaca por hacer sus platos calientes y picantes."
    },
    {
      "nombre": "Venti",
      "vision": "Anemo",
      "imagen": "venti.jpg",
      "arma": "Catalizador",
      "rank": "S",
      "descripcion":
          "Uno de los muchos bardos de Mondstadt, que deambula libremente por las calles y callejones de la ciudad."
    },
    {
      "nombre": "Xingqiu",
      "vision": "Hydro",
      "imagen": "xingchiu.jpg",
      "rank": "B",
      "arma": "Espada",
      "descripcion":
          "Un joven que lleva una espada larga que se ve con frecuencia en las cabinas de libros. Tiene un corazón caballeroso y anhela justicia y equidad para todos."
    },
    {
      "nombre": "Keqing",
      "vision": "Electro",
      "imagen": "keqing.jpg",
      "rank": "S",
      "arma": "Espada",
      "descripcion":
          "El Yuheng del Liyue Qixing. Tiene mucho que decir sobre el enfoque unilateral de Rex Lapis para la formulación de políticas en Liyue, pero en verdad, los dioses admiran mucho a los escépticos como ella."
    }
  ];
  //Recorrer el listado
  _listado() async {
    for (var i = 0; i < array.length; i++) {
      final character = array[i];
      final String imagen = character["imagen"];
      characters.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: character["nombre"],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                          nombre: character["nombre"],
                          imagen: character["imagen"],
                          vision: character["vision"],
                          rank: character["rank"],
                          descripcion: character["descripcion"]),
                    )),
                    child: new Image.asset("assets/images/$imagen",
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(3.0),
              ),
              new Text(
                character["nombre"],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                "Vision:" + character["vision"],
                style: new TextStyle(fontSize: 20.0, color: Colors.grey),
              ),
              new Text("Arma:" + character["arma"],
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey)),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Geshin Impact Tier List"),
          backgroundColor: Colors.amber,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("characters"),
                accountEmail: new Text("miquelmolinier@gmail.com"),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/venti.jpg"))),
              ),
            ],
          ),
        ),
        body: new GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          childAspectRatio: 0.700,
          children: characters,
        ));
  }
}

class Detail extends StatelessWidget {
  Detail({this.nombre, this.imagen, this.vision, this.rank, this.descripcion});
  final String nombre;
  final String imagen;
  final String vision;
  final String rank;
  final String descripcion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
              tag: nombre,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "assets/images/$imagen",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          new IniciarNombre(
            nombre: nombre,
            rank: rank,
          ),
          new IniciarIcon(
            nombre: nombre,
          ),
          new Informacion(
            descripcion: descripcion,
          )
        ],
      ),
    );
  }
}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre, this.rank});
  final String nombre;
  final String rank;
  @override
  Widget build(BuildContext context) {
    if (rank == "S") {
      return Container(
        padding: new EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    nombre,
                    style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Text("S",
                    style: new TextStyle(fontSize: 30.0, color: Colors.white))
              ],
            )
          ],
        ),
      );
    } else if (rank == "A") {
      return Container(
        padding: new EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    nombre,
                    style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Text("A",
                    style: new TextStyle(fontSize: 30.0, color: Colors.white))
              ],
            )
          ],
        ),
      );
    } else if (rank == "B") {
      return Container(
        padding: new EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    nombre,
                    style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Text("B",
                    style: new TextStyle(fontSize: 30.0, color: Colors.white))
              ],
            )
          ],
        ),
      );
    } else if (rank == "C") {
      return Container(
        padding: new EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    nombre,
                    style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Text("C",
                    style: new TextStyle(fontSize: 30.0, color: Colors.white))
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: new EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    nombre,
                    style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 30.0, color: Colors.yellow),
                new Text("D",
                    style: new TextStyle(fontSize: 30.0, color: Colors.white))
              ],
            )
          ],
        ),
      );
    }
  }
}

class IniciarIcon extends StatelessWidget {
  IniciarIcon({this.nombre});
  final String nombre;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(nombre: nombre, tec: "Ataque normal"),
          new IconTec(nombre: nombre, tec: "Habilidad elemental"),
          new IconTec(nombre: nombre, tec: "Explosión elemental")
        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.nombre, this.tec});
  final String nombre;
  final String tec;
  @override
  Widget build(BuildContext context) {
    if (tec == "Ataque normal") {
      return new Expanded(
          child: new Column(
        children: <Widget>[
          new Material(
              color: Colors.black,
              child: new InkWell(
                child: new Image.asset(
                    "assets/images/" + nombre.toLowerCase() + "1" + ".png",
                    fit: BoxFit.cover,
                    height: 120.0,
                    width: 120.0),
              )),
          new Text(tec,
              style: new TextStyle(fontSize: 12.0, color: Colors.blue))
        ],
      ));
    } else if (tec == "Habilidad elemental") {
      return new Expanded(
          child: new Column(
        children: <Widget>[
          new Material(
              color: Colors.black,
              child: new InkWell(
                child: new Image.asset(
                    "assets/images/" + nombre.toLowerCase() + "2" + ".png",
                    fit: BoxFit.cover,
                    height: 120.0,
                    width: 120.0),
              )),
          new Text(tec,
              style: new TextStyle(fontSize: 12.0, color: Colors.blue))
        ],
      ));
    } else {
      return new Expanded(
          child: new Column(
        children: <Widget>[
          new Material(
              color: Colors.black,
              child: new InkWell(
                child: new Image.asset(
                    "assets/images/" + nombre.toLowerCase() + "3" + ".png",
                    fit: BoxFit.cover,
                    height: 120.0,
                    width: 120.0),
              )),
          new Text(tec,
              style: new TextStyle(fontSize: 12.0, color: Colors.blue))
        ],
      ));
    }
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.descripcion});
  final String descripcion;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
          color: Colors.black,
          child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(descripcion,
                  style: new TextStyle(fontSize: 16.0, color: Colors.blue)))),
    );
  }
}
