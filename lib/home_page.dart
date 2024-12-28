import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

import 'car_details_page.dart';
import 'entity/car.dart';
import 'entity/carousel_item.dart';
import 'utils/screen_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  int _bottomNavIndex = 0;

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      imagePath: 'assets/images/img1_.png',
      title: 'Mercedes Maybach S680',
      price: '200',
    ),
    CarouselItem(
      imagePath: 'assets/images/img6_.png',
      title: 'Cayenne S',
      price: '180',
    ),
    CarouselItem(
      imagePath: 'assets/images/img4_.png',
      title: '718 Cayman S',
      price: '250',
    ),
  ];

  // Liste des voitures pour le carrousel
  final List<Car> carouselCars = [
    Car(
      id: '1',
      name: 'Mercedes Maybach S680',
      imageUrl: 'assets/images/img1_.png',
      discount: 15,
      topSpeed: 250,
      fuelType: 'Gasoline',
      transmission: 'Automatic',
      description:
          'Experience luxury and performance with the all-new Mercedes-Benz GT. This masterpiece combines elegant design with powerful performance.',
      pricePerDay: 200.0,
      subtitle: 'Luxury Sedan',
      originalPrice: 250.0,
    ),
    // Ajoutez d'autres voitures pour le carrousel...
  ];

  final List<Car> dealCars = [
    Car(
      id: '1',
      name: 'Mercedes-AMG GT Coupe',
      imageUrl: 'assets/images/img7_.png',
      discount: 25,
      topSpeed: 220,
      fuelType: 'Electric',
      transmission: 'Automatic',
      description:
          'The electric A-Class offers a perfect blend of luxury and sustainability. Featuring cutting-edge technology and premium comfort, this vehicle represents the future of automotive excellence.',
      pricePerDay: 200.0,
      subtitle: 'Electric Auto',
      originalPrice: 260.0,
    ),
    Car(
      id: '2',
      name: 'Mercedes-Benz GT',
      imageUrl: 'assets/images/img5_.png',
      discount: 15,
      topSpeed: 315,
      fuelType: 'Gasoline',
      transmission: 'Automatic',
      description:
          'Experience unparalleled performance with the 2024 Mercedes-Benz GT. This luxury sedan combines sportiness with elegance, offering a premium driving experience with state-of-the-art features.',
      pricePerDay: 170.0,
      subtitle: 'Luxury Sedan',
      originalPrice: 200.0,
    ),
    Car(
      id: '3',
      name: 'Mercedes-Benz GT',
      imageUrl: 'assets/images/img1_.png',
      discount: 15,
      topSpeed: 315,
      fuelType: 'Gasoline',
      transmission: 'Automatic',
      description:
          'The 2024 Mercedes-Benz GT redefines luxury performance. With its sleek design and powerful engine, this vehicle delivers an exceptional driving experience combined with premium comfort and sophistication.',
      pricePerDay: 170.0,
      subtitle: 'Luxury Sedan',
      originalPrice: 200.0,
    ),
    Car(
      id: '4',
      name: 'Mercedes-Maybach S',
      imageUrl: 'assets/images/img1_.png',
      discount: 15,
      topSpeed: 315,
      fuelType: 'Gasoline',
      transmission: 'Automatic',
      description:
          'Another stunning example of the 2024 Mercedes-Benz GT line, this model showcases the perfect balance of power and luxury. Its advanced features and refined interior make every journey a memorable experience.',
      pricePerDay: 170.0,
      subtitle: 'Luxury Sedan',
      originalPrice: 200.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeUtil.init(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        height: SizeUtil.heightPercentage(10),
        iconPadding: 10,
        animationDuration: const Duration(milliseconds: 300),
        index: _bottomNavIndex,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(
              Iconsax.home,
              color: Colors.white,
              size: 23,
            ),
            label: 'Home',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Iconsax.search_normal,
              color: Colors.white,
              size: 20,
            ),
            label: 'Search',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Iconsax.car,
              color: Colors.white,
              size: 23,
            ),
            label: 'Book',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 23,
            ),
            label: 'Profile',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverAppBar fixe
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 253, 253, 253),
              expandedHeight: SizeUtil.heightPercentage(10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                titlePadding: EdgeInsets.zero,
                title: Container(
                  height: SizeUtil.heightPercentage(10),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('assets/images/car_logo.png',
                          height: SizeUtil.heightPercentage(7)),
                      const SizedBox(width: 25),
                      const Text(
                        'DrivePro',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hms Gilbert Serif',
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 15,
                            top: 14,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 3),
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Contenu
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color:  Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search car ',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(Icons.tune, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Carousel avec indicateurs personnalisés
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: SizeUtil.heightPercentage(30),
                            scrollDirection: Axis.vertical,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentCarouselIndex = index;
                              });
                            },
                          ),
                          items: carouselItems.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey[100],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.asset(
                                            item.imagePath,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 16,
                                        left: 16,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.55),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.title,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                '\$${item.price}/day',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      // Indicateurs personnalisés (traits)
                      Positioned(
                        right: 25,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Column(
                            // On garde Column
                            mainAxisSize: MainAxisSize.min,
                            children:
                                carouselItems.asMap().entries.map((entry) {
                              return Container(
                                width: 3,
                                height: entry.key == _currentCarouselIndex
                                    ? 25
                                    : 13,
                                margin: const EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: entry.key == _currentCarouselIndex
                                      ? Colors.black.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.3),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // Quick Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAction(Icons.key, 'Book Now'),
                      _buildQuickAction(Icons.history, 'My Rentals'),
                      _buildQuickAction(Icons.local_offer, 'Offers'),
                      _buildQuickAction(Icons.headset_mic, 'Support'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Current Deals Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Current Deals',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rotunda',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Deal Cards
                  ...dealCars
                      .map((car) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: _buildDealCard(car),
                          ))
                      .toList(),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDealCard(Car car) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(car: car),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: car.id,
                child: Image.asset(
                  car.imageUrl,
                  width: SizeUtil.widthPercentage(25),
                  height: SizeUtil.heightPercentage(12),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        car.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: SizeUtil.heightPercentage(4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '-${car.discount}%',
                          style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    car.subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 11,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${car.originalPrice}/day',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '\$${car.pricePerDay}/day',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
