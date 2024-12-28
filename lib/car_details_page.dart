import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'entity/car.dart';
import 'utils/screen_size.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  //int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: SizeUtil.heightPercentage(12.7),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price Per Day",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "\$${widget.car.pricePerDay}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 15,
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Book Now",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rotunda',
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   //height: 151,
      //   padding: const EdgeInsets.all(16),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.3),
      //         spreadRadius: 1,
      //         blurRadius: 5,
      //         offset: const Offset(0, -3),
      //       ),
      //     ],
      //   ),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const Text(
      //                 "Price Per Day",
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 14,
      //                 ),
      //               ),
      //               Text(
      //                 "\$${widget.car.pricePerDay}",
      //                 style: const TextStyle(
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           Container(
      //             //height: 50,
      //             decoration: BoxDecoration(
      //               color: Colors.grey[200],
      //               borderRadius: BorderRadius.circular(30),
      //             ),
      //             child: Row(
      //               children: [
      //                 IconButton(
      //                   icon: const Icon(Icons.remove),
      //                   onPressed: () {
      //                     if (_quantity > 1) {
      //                       setState(() {
      //                         _quantity--;
      //                       });
      //                     }
      //                   },
      //                 ),
      //                 Text(
      //                   '$_quantity',
      //                   style: const TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 IconButton(
      //                   icon: const Icon(Icons.add),
      //                   onPressed: () {
      //                     setState(() {
      //                       _quantity++;
      //                     });
      //                   },
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 16),
      //       SizedBox(
      //         width: double.infinity,
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.black,
      //             padding: const EdgeInsets.symmetric(vertical: 16),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //           ),
      //           child: const Text(
      //             "Book Now",
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      body: CustomScrollView(
        slivers: [
          // Image en haut avec bouton retour
          SliverAppBar(
            expandedHeight: SizeUtil.heightPercentage(34),
            pinned: true,
            backgroundColor: Colors.grey[100],
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: widget.car.id,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth:
                                    400, // Limitation max pour grand écran
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  widget.car.imageUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Indicateurs de type trait
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 20,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 20,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Contenu principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre et badge de réduction
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.car.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "-${widget.car.discount}%",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Luxury Sedan",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),

                  // Spécifications
                  const SizedBox(height: 16),
                  const Text(
                    "Specifications",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rotunda',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSpecItemVertical(
                        Icons.speed,
                        "${widget.car.topSpeed} km/h",
                        "Top Speed",
                        //"Top Speed",
                      ),
                      _buildSpecItemVertical(
                        Icons.local_gas_station,
                        widget.car.fuelType,
                        "Fuel Type",
                        //"Fuel Type",
                      ),
                      _buildSpecItemVertical(
                        Icons.settings,
                        widget.car.transmission,
                        "Transmission",
                        //"Transmission",
                      ),
                    ],
                  ),

                  // Détails
                  const SizedBox(height: 16),
                  const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rotunda',
                    ),
                  ),
                  const SizedBox(height: 8),
                  ReadMoreText(
                    widget.car.description,
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read More',
                    trimExpandedText: 'Show Less',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecItemVertical(
    IconData icon,
    String value,
    String unit,
    /*String label*/
  ) {
    return Container(
      width: SizeUtil.widthPercentage(28),
      //padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Icon(icon, size: 22),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 7),
          // Text(
          //   label,
          //   style: const TextStyle(
          //     color: Colors.grey,
          //     fontSize: 10,
          //   ),
          // ),
          // const SizedBox(height: 4)
        ],
      ),
    );
  }
}