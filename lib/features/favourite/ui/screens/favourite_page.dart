import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_go/features/favourite/bloc/favourite_bloc.dart';

import 'package:lets_go/model/Places.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavoritesBloc,FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesInitial) {
            BlocProvider.of<FavoritesBloc>(context).add(FavoritesPageInitialEvent());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoritesPageLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoritesPageLoadedSuccessState) {
            return ListView.builder(
              itemCount: state.favoritePlaces.length,
              itemBuilder: (context, index) {
                final PlacesDataModel favoriteItem = state.favoritePlaces[index];
                return ListTile(
                  title: Text(favoriteItem.name ?? ''),
                  subtitle: Text(favoriteItem.location ?? ''),
                  leading: Image.network(
                    favoriteItem.image ?? '',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage()),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<FavoritesBloc>(context).add(FavoritesPageFavoriteRemoveEvent(favoriteItem));
                    },
                  ),
                );
              },
            );
          } else if (state is FavoritesPageFavoriteRemovedState) {
           
            return Container();
          } else {
            return Center(
              child: Text('Error: Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}
