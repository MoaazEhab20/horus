import 'package:final_project/components/custom_text.dart';
import 'package:final_project/screens/touristview/home_pages/government_screen.dart';
import 'package:flutter/material.dart';

import '../../models/landmark_model.dart';
import '../../services/recommended_services.dart';
import '../../widgets/custom_categories_listview.dart';
import '../../widgets/custom_recommend_listview.dart';
import '../../widgets/custom_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Landmark>> _recommendedLandmarks;

  @override
  void initState() {
    super.initState();
    _recommendedLandmarks = RecommendedService().fetchRecommendedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: CircleAvatar(
                radius: 26,
                backgroundImage:
                    AssetImage('assets/images/Dave-Dickinson-Headshot.jpg'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back 👋🏻',
                  style: TextStyle(
                    color: Color(0xffA4A4A4),
                    fontSize: 18,
                    fontFamily: 'Inter',
                  ),
                ),
                TextForTitleM(data: 'Moaaz Ehab'),
              ],
            )
          ],
        ),
        toolbarHeight: 60,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GovernmentScreen()));
                    },
                    child: Stack(children: [
                      Container(
                        width: double.infinity,
                        height: 195,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/cairo.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      Positioned(
                        top: 135,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(221, 245, 145, 63),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 4, top: 4),
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Cairo',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 4, top: 4),
                                    child: Icon(
                                      Icons.change_circle_outlined,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    'Change City',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextForBodyL(
                      data: 'Explore the Beautiful World !',
                    ),
                  ),
                  const CustomSearchField(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextForBodyL(
                      data: 'Categories',
                    ),
                  ),
                  const CustomCategoriesListView(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextForBodyL(
                          data: 'Recommended',
                        ),
                        Text(
                          'show more',
                          style: TextStyle(
                            color: Color(0xffA4A4A4),
                            fontSize: 13,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<Landmark>>(
                    future: _recommendedLandmarks,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Color.fromARGB(221, 245, 145, 63),
                        ));
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child: Text('No recommendations available'));
                      } else {
                        return CustomRecommendListView(
                            recommendations: snapshot.data!);
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextForBodyL(
                          data: 'Popular Destination',
                        ),
                        Text(
                          'show more',
                          style: TextStyle(
                            color: Color(0xffA4A4A4),
                            fontSize: 13,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  //const CustomRecommendListView(),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
