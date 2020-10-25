import 'package:flutter/material.dart';
import 'package:kace/constants.dart';
import 'package:kace/screens/sign_in/sign_in_screen.dart';
//import 'package:kace/screens/sign_in/sign_in_screen.dart';
import 'package:kace/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  int flexSize = 1;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to KaceShop, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 1),
                    but(currentPage),
                    Spacer(flex: flexSize),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDefaultContinueButton(BuildContext context) {
    if(currentPage == 2){
      flexSize = 2;
      return  but(currentPage);
     }else{
       flexSize = 2;
       return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: currentPage == 0 ? 0 : 80,
      color: Colors.black,
      child: Text(
            "KACESHOP",
            style: TextStyle(
              fontSize: currentPage == 2 ?getProportionateScreenWidth(36) : 8,
              color:currentPage == 1 ? kPrimaryColor : Color(0xFFD8D8D8),
              fontWeight: FontWeight.bold,
            ),
       )
      
    );
       
       
     }                  
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }


  Widget but(index){
    return AnimatedContainer(
      duration: Duration(milliseconds: 50000),
      child: Container(
        width: index == 2 ? 80 : double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [ 
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 6,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
          ),
          
        child: IconButton(
        icon: Icon(Icons.arrow_circle_up, color: kPrimaryColor,),
        color: kPrimaryColor,
        onPressed: (){},
        
      ),
      ),
    );
  }
}
