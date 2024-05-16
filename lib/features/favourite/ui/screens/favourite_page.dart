import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/details/bloc/details_bloc.dart';
import 'package:lets_go/features/favourite/bloc/favourite_bloc.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late final FavoritesBloc favoritesBloc;
  late final DetailsBloc detailsBloc2;

  @override
  void initState() {
    favoritesBloc = FavoritesBloc();
    detailsBloc2 = DetailsBloc();
    favoritesBloc.add(FavoritesPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 3, color: Colors.blue)),
          ),
          child: Text(
            'Favourites',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        bloc: favoritesBloc,
        listenWhen: (previous, current) => current is FavoriteActionState,
        buildWhen: (previous, current) => current is! FavoriteActionState,
        listener: (context, state) {
          if (state is FavoritesPageFavoriteRemovedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 100),
                content: Text(
                  "The selected place has been deleted!",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 243, 33, 33),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
            
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
              if (successState.favoritePlaces.isEmpty) {
                return Center(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Center(
                     child: Lottie.network(
                              "https://lottie.host/6096c0ad-b67c-4fda-9396-af5f50b4ee43/lS8njlPOD6.json",
                       width: 400,
                       height: 400,
                            ),
                          ),
                    SizedBox(height: 5,),
                   Center(
                   child: Text(
                         'No favourite places found',
                   style: GoogleFonts.poppins(
                   fontSize: 25,
                   color: Colors.grey.shade600,
                   fontWeight: FontWeight.bold,
                      ),
                     ),
                      ),
                     ],
                   )
                );
              } else {
                return ListView.builder(
                  itemCount: successState.favoritePlaces.length,
                  itemBuilder: (context, index) {
                    final favoriteItem = successState.favoritePlaces[index];
                    return ListTile(
                      title: Text(
                        favoriteItem.name ?? '',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(favoriteItem.location ?? '', style: GoogleFonts.poppins()),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          favoriteItem.image ?? '',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        detailsBloc2.add(DetailsPagePlaceDetailsChangeEvent(clickedPlace: favoriteItem));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage()));
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.blue),
                        onPressed: () {
                          favoritesBloc.add(FavoritesPageFavoriteRemoveEvent(favorited: favoriteItem));
                        },
                      ),
                    );
                  },
                );
              }
            case FavoritesPageFavoriteRemovedState:
              return Container();
            case FavoritesInitial:
              return Center(
                child: Text('Initial state'),
              );
            default:
              return Center(
                child: Text('Error: Something went wrong!'),
              );
          }
        },
      ),
    );
  }
}
