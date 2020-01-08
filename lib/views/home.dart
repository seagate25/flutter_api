import 'package:flutter/material.dart';
import '../provider/beer_provider.dart';
import '../models/beer.dart';
import '../widgets/beer_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Beer> __beers = <Beer>[];

  @override
  void initState() {
    super.initState();
    listenForBeers();
  }

  void listenForBeers() async {
    final Stream<Beer> stream = await getBeers();
    stream.listen((Beer beer) =>
      setState(() => __beers.add(beer))
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Beers'),
      ),
      body: ListView.builder(
        itemCount: __beers.length,
        itemBuilder: (context, index) => BeerTile(__beers[index]),
      ),
    );
  }
}