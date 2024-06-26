import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';
import 'package:lets_go/features/home/bloc/home_bloc.dart';
import 'package:lets_go/features/home/components/placetile.dart';
import 'package:lets_go/model/Places.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    homeBloc.add(HomeInitialFetchEvent());
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is PlaceDetailNavigatePageState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsPage()));
          }
        },
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(
                  // child: CircularProgressIndicator(
                  //   backgroundColor: Colors.grey,
                  //   color: Colors.blue,
                  // ),
                  child:Lottie.network("https://lottie.host/73943ba5-eba0-4b8c-9524-276c371a31c5/cxYpKmwsvz.json",width: 300,height: 300,)
                ),
              );
            case PLacesFetchSucessState:
              final sucessState = state as PLacesFetchSucessState;
              final List<PlacesDataModel> places =
                  sucessState.filteredPlace ?? sucessState.places;
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 150, left: 15),
                        child: Text(
                          "What Are You Looking For?",
                          style: GoogleFonts.poppins(fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: TextField(
                          onChanged: (value) {
                            homeBloc.add(FilterPlaceEvent(
                                places: sucessState.places,
                                filterValue: value));
                          },
                          controller: controller,
                          decoration: InputDecoration(
                            suffixIcon: controller.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      controller.clear();
                                      homeBloc.add(ClearSearchEvent());
                                      FocusScope.of(context).unfocus();
                                    },
                                    icon: Icon(Icons.close))
                                : null,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            focusColor: Colors.blue.shade400,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          "Experiences in the spotlight",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: places.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Lottie.network(
                                            "https://lottie.host/8f96e8cf-3cc5-4c09-8792-d8861fd1f8a8/xENJ7yDjbQ.json",
                                            width: 400,
                                            height: 400),
                                      ),
                                    ),
                                        SizedBox(height: 5,),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                            'Result for "${controller.text}" Not found',style: GoogleFonts.poppins(fontSize:20,color:Colors.grey.shade600,fontWeight:FontWeight.bold,),),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : GridView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            constraints.maxWidth > 760 ? 4 : 2,
                                        childAspectRatio: 1 / 1,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0),
                                itemCount: places.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var PlacesClicked = places[index];
                                  return GestureDetector(
                                    onTap: () {
                                      homeBloc.add(HomePagePLaceClickedEvent(
                                          placeClicked: PlacesClicked));
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: PlaceTile(
                                            placesDataModels: PlacesClicked,
                                            homeBloc: homeBloc,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
