import 'package:cook_project/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.only(top: 45, bottom: 20),
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
            
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor:  const Color(0xFFCEA700),
          child: const Icon(Icons.add, color: Colors.white, size: 45,),
          onPressed: ()
           {  print('bạn đã nhấn một lần');  }
          
          ),
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
