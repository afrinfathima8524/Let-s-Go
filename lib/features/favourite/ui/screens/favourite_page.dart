import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_go/features/favourite/bloc/favourite_bloc.dart';
import 'package:lets_go/features/favourite/models/favourite_model.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavouriteBloc _favouriteBloc = FavouriteBloc();

  @override
  void initState() {
    _favouriteBloc.add(LoadFavouritesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        bloc: _favouriteBloc,
        builder: (context, state) {
          if (state is FavouritesLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavouritesLoadedState) {
            return ListView.builder(
              itemCount: state.favourites.length,
              itemBuilder: (context, index) {
                final Model favoriteItem = state.favourites[index];
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
                      MaterialPageRoute(builder: (context) => DetailsPage(favoriteItem: favoriteItem)),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _favouriteBloc.add(RemoveFromFavouritesEvent(favoriteItem));
                    },
                  ),
                );
              },
            );
          } else if (state is FavouritesLoadErrorState) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _favouriteBloc.close();
    super.dispose();
  }
}
