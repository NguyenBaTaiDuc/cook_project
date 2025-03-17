import 'package:cook_project/Presentation/privite.dart';
import 'package:cook_project/Presentation/search_item.dart';
import 'package:cook_project/Presentation/struture.dart';
import 'package:cook_project/models/categories.dart';
import 'package:cook_project/models/countries.dart';
import 'package:cook_project/models/meals.dart';
import 'package:cook_project/services/services.dart';
import 'package:cook_project/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPressed = false;
  int? selectedItem;

  late Future<List<Categories>> futureCategories;
  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'could not launch url';
    }
  }

  int selectedIndex = 0;
  late Future<List<Meal>> futureMeals;
  late Future<List<Countries>> futureCountry;
  @override
  void initState() {
    super.initState();
    futureMeals = Services().fetchMeal();
    futureCategories = Services().fetchCategories();
    futureCountry = Services().fetchArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
          child: IndexedStack(index: selectedIndex, children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(top: 45, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 0,
                          )
                        ],
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 0,
                        minWidth: 0,
                      ),
                      hintText: 'Tìm kiếm sản phẩm',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 40)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TP. Hồ Chí Minh',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Xem tất cả',
                      style: TextStyle(
                          color: Color(0xFFCEA700),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              FutureBuilder<List<Meal>>(
                  future: futureMeals,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error : ${snapshot.error}');
                    } else {
                      List<Meal> meals = snapshot.data!;
                      return SizedBox(
                        height: 215,
                        width: 400,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: meals.length,
                            itemBuilder: (context, index) {
                              final meal = meals[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: SizedBox(
                                  width: 220,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Stack(children: [
                                            ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                        top:
                                                            Radius.circular(
                                                                12)),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        _launchUrl(
                                                            meal.strYoutube ??
                                                                '');
                                                      },
                                                      child: SizedBox(
                                                        height: 100,
                                                        width: 100,
                                                        child:
                                                            Image.network(
                                                          meal.youtube,
                                                          fit: BoxFit.cover,
                                                          width: double
                                                              .infinity,
                                                          height: double
                                                              .infinity,
                                                          errorBuilder:
                                                              (context,
                                                                  error,
                                                                  stackTrace) {
                                                            return Image
                                                                .asset('');
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: Text(
                                                            '1 tiếng 20 phút',
                                                            style:
                                                                TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .only(
                                                                  right:
                                                                      10),
                                                          child: Icon(
                                                            Icons
                                                                .favorite_border,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets
                                                              .only(
                                                              left: 10),
                                                      child: Text(
                                                        'Cách chiên trứng một cách cung phu',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 9,
                                                                  top: 10),
                                                          child: SizedBox(
                                                            width: 35,
                                                            height: 35,
                                                            child:
                                                                ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          60),
                                                              child: Image
                                                                  .asset(
                                                                      'assets/images/Avatar.png'),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .only(
                                                                  top: 11),
                                                          child: Text(
                                                            'Nguyễn Đình Phúc',
                                                            style:
                                                                TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xFFCEA700),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Danh mục',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                      color: Color(0xFFCEA700),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: FutureBuilder<List<Categories>>(
                    future: futureCategories,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text(' Error: ${snapshot.error}');
                      } else {
                        List<Categories> cate = snapshot.data!;
                        return SizedBox(
                          height: 30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cate.length,
                              itemBuilder: (context, index) {
                                final category = cate[index];
                                isPressed = selectedItem == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedItem = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: isPressed
                                              ? const Color(0xFFCEA700)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        width: 100,
                                        child: Text(
                                          'Danh mục ${category.idCategory!}',
                                          style: TextStyle(
                                              color: isPressed
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                  ),
                                );
                              }),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: futureCountry,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error : ${snapshot.error}');
                    } else {
                      List<Countries> meals = snapshot.data!;
                      return SizedBox(
                        height: 236,
                        width: 400,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: meals.length,
                            itemBuilder: (context, index) {
                              final meal = meals[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 35),
                                  child: Stack(children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 200,
                                          padding: const EdgeInsets.only(
                                              top: 40,
                                              left: 10,
                                              right: 5,
                                              bottom: 15),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFAF6E9),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                meal.strMeal!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Color(0xFF6B4A19),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 5),
                                              const Column(
                                                children: [
                                                  Text('Tạo bởi',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xFF6B4A19))),
                                                  Text(
                                                    'Trần Đình Trọng',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color(
                                                            0xFF6B4A19)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('20 phút',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .black87)),
                                                  Icon(Icons.sticky_note_2,
                                                      color: Color(
                                                          0xFF6B4A19)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Transform.translate(
                                      offset: const Offset(45,
                                          -35), // Dịch ảnh xuống để nó chồng lên Container
                                      child: Positioned(
                                        left:
                                            50, // Căn giữa ảnh theo chiều ngang
                                        top: -30,
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 3),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  meal.strMealThumb!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            }),
                      );
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              const Text('Công thức'),
            ],
          ),
        ),
        const SearchItem(),
        const Struture(),
        const Privite(),
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xFFCEA700),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 45,
            ),
            onPressed: () {
              // print('bạn đã nhấn một lần');
            }),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildBottonNav(
                    index: 0,
                    icon: Icons.home,
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }),
                BuildBottonNav(
                    index: 1,
                    icon: Icons.search,
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }),
                BuildBottonNav(
                    index: 2,
                    icon: Icons.bookmark_border,
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    }),
                BuildBottonNav(
                    index: 3,
                    icon: Icons.person_2_outlined,
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
