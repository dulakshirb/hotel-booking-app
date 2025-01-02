import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/hotel.dart';

class FirebaseServices {
  // Get Hotels Document from Firebase DB and return Hotel type data
  static Future<List<Hotel>> getHotels() async {
    CollectionReference hotelCollectionReference =
        FirebaseFirestore.instance.collection('hotels');

    final hotelDocuments = await hotelCollectionReference.get();
    hotelCollectionReference.get().then((hotelDocuments) {});
    // hotelDocuments.docs.forEach((hotel) {
    //   print(hotel['title']);
    // });

    // print(hotelDocuments.docs[1]['prices']);

    List<Hotel> hotels = [];
    for (var hotelDoc in hotelDocuments.docs) {
      hotels.add(
        Hotel(
          title: hotelDoc['title'],
          rating: hotelDoc['rating'],
          prices: hotelDoc['prices'],
          mainImage: hotelDoc['main-image'],
          otherImages: hotelDoc['other-images'],
          amenities: hotelDoc['amenities'],
        ),
      );
    }

    // print(hotels[0].title);

    return hotels;
  }
}
