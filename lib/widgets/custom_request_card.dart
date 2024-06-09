import 'package:flutter/material.dart';

class CustomRequestCard extends StatelessWidget {
  const CustomRequestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: const Color(0xffF6F5FB),
              ),
            ),
            Positioned(
              left: 13,
              top: 13,
              child: Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(29),
                      topRight: Radius.circular(29),
                      bottomLeft: Radius.circular(29),
                      bottomRight: Radius.circular(29),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Dave-Dickinson-Headshot.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            const Positioned(
              left: 113,
              top: 13,
              right: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Moaaz Ehab ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xff253544),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text(
                          'Day : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xff253544),
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '12/11',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xff253544),
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'time : ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff253544),
                            fontSize: 19,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '11 am To 5 pm',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff253544),
                            fontSize: 19,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'pyramids',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xffF5903F),
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              left: 13,
              right: 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    minWidth: MediaQuery.of(context).size.width * 0.35,
                    height: 45,
                    elevation: 0.5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0), // Change your border radius here
                      ),
                    ),

                    //shape: ,
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff00A6A6)),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    minWidth: MediaQuery.of(context).size.width * 0.35,
                    height: 45,
                    elevation: 0.5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0), // Change your border radius here
                      ),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF0000)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
