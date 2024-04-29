import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://static.toiimg.com/img/107852737/Master.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Text(
                        "Paris, France",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
              
                      
                    ],
                  ),
              
                  const Text(
                "Eiffel Tower",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                   const Text(
                    "(1M)",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              
              const Text(
                "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France.Gustave Eiffel, the engineer behind the tower, also contributed to the design of the Statue of Liberty.",
                style: TextStyle(
                  fontSize:16,
                ),
              ),
              
              const SizedBox(height: 10,),
              
               const Text(
                "PHOTOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              
                SizedBox(
                height: 250,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1/1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      ),
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                       itemBuilder: (context, index) {
              
                        return Container(
                          child: Hero(tag: "ss", child: Image.network("https://static.toiimg.com/img/107852737/Master.jpg",fit: BoxFit.cover,)),
                          );
                    
                  },),
                ),
                       const SizedBox(height: 10,),
                const Text(
                "TOUR & TICKETS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),

               SizedBox(
                height: 250,
                  child: ListView.builder(
                   
                    itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        leading: Hero(tag: "ss", child: Image.network("https://static.toiimg.com/img/107852737/Master.jpg",fit: BoxFit.cover,)),
                      
                      ),
                    );
                    
                  },),
                ),

                ],
              ),
            ),
            
        
          ],
        ),
      ),
    );
  }
}
