import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places_provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshots) => snapshots.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatePlacesProvider>(
                child: Center(child: const Text('Any place add not yet...')),
                builder: (ctx, greatPlaces, myChild) =>
                    greatPlaces.items.length <= 0
                        ? myChild as Widget
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[index].image),
                              ),
                              title: Text(greatPlaces.items[index].title),
                            ),
                          ),
              ),
      ),
    );
  }
}
