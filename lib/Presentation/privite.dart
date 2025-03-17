import 'package:cook_project/bloc_button/button_bloc.dart';
import 'package:cook_project/bloc_button/button_event.dart';
import 'package:cook_project/bloc_button/button_state.dart';
import 'package:cook_project/models/categories.dart';
import 'package:cook_project/models/countries.dart';
import 'package:cook_project/services/services.dart';
import 'package:cook_project/widgets/button_privite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Privite extends StatefulWidget {
  const Privite({super.key});

  @override
  State<Privite> createState() => _PriviteState();
}

class _PriviteState extends State<Privite> {
  late Future<List<Categories>> futureCategories;
  late Future<List<Countries>> futureCountry;
  @override
  void initState() {
    super.initState();
   
    futureCategories = Services().fetchCategories();
    futureCountry = Services().fetchArea();
  }

  @override
  Widget build(BuildContext context) {
    final PressedBloc = context.read<ButtonBloc>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2),
              child: Container(
                color: const Color.fromARGB(66, 85, 85, 85),
                height: 0.5,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading:
              false, // Không tự động thêm nút back mặc định
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50), // Dính sát viền trên
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Color(0xFFCEA700)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                      child: Text(
                        "Trang cá nhân",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFA47804),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.more_vert, color: Color(0xFFCEA700)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<ButtonBloc, ButtonState>(
        builder: (context, state) {
          return Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset(
                    'assets/images/Avatar.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'Nguyễn Đình Trọng',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFA47804),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Text('Bài viết'),
                        Text('100',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),

                  Container(
                    // padding: EdgeInsets.only(left: 50),
                    width: 1,
                    height: 40,
                    color: Color(0xFF909090),
                  ),
                  // SizedBox(width: 45,),
                  Container(
                    // padding: EdgeInsets.only( right: 90),
                    child: Column(
                      children: [
                        Text('Người theo dõi'),
                        Text(
                          '100',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 110),
                    width: 1,
                    height: 40,
                    color: Color(0xFF909090),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Column(
                      children: [
                        Text('Theo dõi'),
                        Text('100',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      text: 'Follow',
                      press: () {
                        PressedBloc.add(PressedButtonEvent());
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  CustomButton(
                    text: 'Message',
                    press: () {
                      PressedBloc.add(PressedButtonEvent());
                    },
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 19),
                child: FutureBuilder<List<Categories>>(
                    future: futureCategories,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text(' Error: ${snapshot.error}');
                      } else {
                        List<Categories> cate = snapshot.data!;
                        return SizedBox(
                          height: 120,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: cate.length,
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 40,
                                  ),
                              itemBuilder: (context, index) {
                                final category = cate[index];
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    category.strCategoryThumb!),
                                                filterQuality:
                                                    FilterQuality.high,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        category.strCategory!,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 190),
                child: const Text(
                  'Danh sách yêu thích',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                // padding: EdgeInsets.only(left: 20, right: 20),
                child: FutureBuilder(
                    future: futureCountry,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error : ${snapshot.error}');
                      } else {
                        List<Countries> country = snapshot.data!;
                        return SizedBox(
                          width: 350,
                          height: 350,
                          child: GridView.builder(
                              itemCount: country.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 25,
                                      childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                final nationnal = country[index];
                                double scale = (index % 3 == 1) ? 1.1 : 1;
                                return Transform.scale(
                                  scale: scale,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        nationnal.strMealThumb!,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
