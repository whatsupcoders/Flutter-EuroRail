import 'package:flutter_web/material.dart';
import 'place.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Euro Rail',
      theme: ThemeData(
        primaryColor: Color(0xff003082),
      ),
      home: MyHomePage(title: 'Euro Rail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                //
              }),
          title: Text(widget.title),
          actions: <Widget>[
            CustomLeadingAction(),
          ],
        ),
        body: Container(
          child: CustomScrollView(
          slivers: <Widget>[
             SliverPadding(
             padding: EdgeInsets.only(top: 8.0),
             sliver:SliverGrid.count(
                  childAspectRatio: 1.74,
                  crossAxisCount: MediaQuery.of(context).size.width >= 1400
                      ? 3
                      : MediaQuery.of(context).size.width >= 800 ? 2 : 1,
                  mainAxisSpacing: 2.0,
                  children:
                      places.map((place) => placeContainer(place)).toList(),
                ),
             ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigationMenu());
  }

  Widget CustomLeadingAction() => MediaQuery.of(context).size.width > 800
      ? Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  //
                }),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
              icon: Icon(Icons.train),
              onPressed: () {},
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
              icon: Icon(Icons.portrait),
              onPressed: () {},
            ),
          ],
        )
      : IconButton(
          icon: Icon(Icons.train),
          onPressed: () {
            //
          });

  Widget bottomNavigationMenu() => MediaQuery.of(context).size.width <= 800
      ? BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.tram),
              title: Text('Tickets'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.portrait), title: Text('Profile'))
          ],
        )
      : SizedBox();

  Widget placeContainer(Place place) {
    return Card(
      child: Column(
        children: <Widget>[
         Expanded(
          child:Stack(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 260.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(place.placeImage)))
          ),
        Container(
        alignment: Alignment.topLeft,
        child: Container(
          width: 80.0,
          height: 60.0,
          color: Color(0xffFFC917),
          child: Align(alignment: Alignment.center, child:Text(place.placePrice,style:TextStyle(color: Color(0xff003082),fontSize: 30.0)),),
        ),
      )
          ],),),
          ListTile(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  place.placeName,
                  style: TextStyle(color: Color(0xffEA3556), fontSize: 18.0,fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Column(
                children: <Widget>[
                  Text(
                    place.placeDetails,
                    style: TextStyle(fontSize: 14.0,color: Colors.black),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Color(0xffEA3556),
                      child: new Text(
                        "Book",
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
