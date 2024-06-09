import 'package:final_project/screens/first_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboarding_items.dart';

class OnboardinView extends StatefulWidget {
  const OnboardinView({super.key});

  @override
  State<OnboardinView> createState() => _OnboardinViewState();
}

class _OnboardinViewState extends State<OnboardinView> {
  final controller = OnboardItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child:isLastPage? getStarted(): Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
               child: const Text('Skip',style: TextStyle(
                                color: Color.fromARGB(255, 107, 104, 104),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Inter'
                              ),),
               ),
               //const Spacer(flex: 1,),
               SmoothPageIndicator(
                          controller: pageController,
                           count: controller.items.length,
                           effect: const ExpandingDotsEffect(
                            dotWidth: 7,
                            dotHeight: 8,
                            activeDotColor:  Color(0XFFF5903F),
                            ),
                           ),
                        // const  Spacer(flex: 1,),
                InkWell(
                  onTap: (){pageController.nextPage(
                              duration: const Duration(microseconds: 600),
                              curve: Curves.easeIn);},
                  child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0XFFF5903F),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Text(
                              '>',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ), ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: PageView.builder(
          onPageChanged: (index)=> setState(()=> isLastPage = controller.items.length-1 == index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context,index){
            return Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(controller.items[index].img),
                const Spacer(flex: 1,),
                Text(controller.items[index].text1,style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff253544),
                        //fontFamily: 'Inter'
                      )),
                      const   SizedBox(height: 10,),
                Text(controller.items[index].text2,style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:  Color(0XFFF5903F),
                      //fontFamily: 'Inter'
                    ),),
                    const SizedBox(height: 20,),
                Text(controller.items[index].desc,style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff253544),
                      //fontFamily: 'Inter'
                    ),),
                     //const SizedBox(height: 20,),
                    const Spacer(flex: 1,),  
              ],
            );
        }),
      ),
    );
  }
  Widget getStarted(){
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0XFFF5903F), ),
      width: MediaQuery.of(context).size.width ,
      height: 43,
      child: TextButton(onPressed: ()async{
        final pres = await SharedPreferences.getInstance();
        pres.setBool("onboarding", true);

        if(!mounted)return;

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FirstScreen()));
      },
       child: const Text('Get Started',style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        color: Colors.white,
       ),),
       ),
    );
  }
}