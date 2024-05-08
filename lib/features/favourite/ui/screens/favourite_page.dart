import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/favourite/bloc/favourite_bloc.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';
class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}
class _FavoritePageState extends State<FavoritePage> {
  final FavoritesBloc favoritesBloc=FavoritesBloc();
  @override
  void initState() {
favoritesBloc.add(FavoritesPageInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
        ),
      body: BlocConsumer<FavoritesBloc,FavoritesState>(
        bloc: favoritesBloc,
        listenWhen: (previous, current) => current is FavoriteActionState,
      buildWhen: (previous, current) => current is! FavoriteActionState,
      listener: (context, state) {
        if(state is FavoritesPageFavoriteRemovedState){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 100),
            content:Text("The selected place has been deleted!",style: GoogleFonts.poppins(color:const Color.fromARGB(255, 243, 33, 33),fontWeight:FontWeight.bold,),)));
        }
      },
        builder: (context, state) {
  switch (state.runtimeType) {
    

    case FavoritesPageLoadingState:
      return Center(
        child: CircularProgressIndicator(),
      );

    case FavoritesPageLoadedSuccessState:
      final successState = state as FavoritesPageLoadedSuccessState;
      return ListView.builder(
        itemCount: successState.favoritePlaces.length,
        itemBuilder: (context, index) {
          final  favoriteItem = successState.favoritePlaces[index];
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
                favoritesBloc.add(FavoritesPageFavoriteRemoveEvent(favorited: favoriteItem));
              },
            ),
          );
        },
      );

    case FavoritesPageFavoriteRemovedState:
      return Container();

    default:
      return Center(
        child: Text('Error: Something went wrong!'),
      );
  }
} 
  ),
    )
    );
  }
}

 