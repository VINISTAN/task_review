/*
This is Dashboard screen.
This is the root of the application
 */

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../icons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#1E1E1E'),
        body:
        /// Custom widget for main body
        const DashboardBody(),
        /// Bottomnavigation widget
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.black12,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: const TextStyle(color: Colors.black54))),
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            ///Calling custom bottomnavigation widget
            child: Mybottomnavigation()
          ),
        ));
  }
}

/// Custom widget for dashboard page (body view)

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: myheight/20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                  height: myheight/25,
                  width : mywidth/10,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(child: Text("JB",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                ),
                const Icon(Icons.notifications,color: Colors.blue,)
              ],
            ),
            SizedBox(
              height: myheight/60,
            ),
            SizedBox(
              height: myheight/5,
              child: const ScrollableContainer(),
            ),

            SizedBox(height: myheight/20,),
            Container(
              height: myheight/7,
                decoration: BoxDecoration(
                    color: HexColor('#00455B'),
                  borderRadius: BorderRadius.circular(15),

                ),
              child: const InfoContainer(),
            ),
            SizedBox(height: myheight/20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: mywidth/15.5,),
                const Text("Recent transactions",style: TextStyle(color: Colors.grey,fontSize: 17,letterSpacing: 1)),
                SizedBox(width: mywidth/3.5,),
                Text("See all",style: TextStyle(color: HexColor('#0CABDF'),fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: myheight/30,),
            ListviewContainer(bottomcolor: HexColor('#FFB6BA'), arrowimage: const AssetImage("assets/images/arrow.png"),),
            SizedBox(height: myheight/80,),
            ListviewContainer(bottomcolor: HexColor('#FFB6BA'),arrowimage: const AssetImage("assets/images/arrow.png")),
            SizedBox(height: myheight/80,),
            ListviewContainer(bottomcolor: HexColor('#AFE2BD'),arrowimage: const AssetImage("assets/images/down.JPG")),
            SizedBox(height: myheight/80,),
            ListviewContainer(bottomcolor: HexColor('#AFE2BD'),arrowimage: const AssetImage("assets/images/down.JPG")),
          ],
        ),
      ),
    );
  }
}

///Horizontal list view. It calls custom scrollable containers with required parameters

class ScrollableContainer extends StatefulWidget {
   const ScrollableContainer({Key? key}) : super(key: key);

  @override
  State<ScrollableContainer> createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableContainer> {

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;


    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        const ScrollableContainerWidget(labelname: r'$15,286,486.00', firstsublabel: 'Main  ', secondsublebel: ' GBP', labelImage: AssetImage('assets/images/Ellipse 1.png'),),
        SizedBox(width: mywidth/20,),
        const ScrollableContainerWidget(labelname: r'$14,897,421.60', firstsublabel: '', secondsublebel: 'USD', labelImage: AssetImage('assets/images/Ellipse 9.png'),),
        SizedBox(width: mywidth/20,),
        const ScrollableContainerWidget(labelname: r'$18,585,421.00', firstsublabel: '', secondsublebel: 'CAD', labelImage: AssetImage('assets/images/Ellipse 10.png'),),
        SizedBox(width: mywidth/20,),
      ],
    );
  }
}

///Custom scrollable container widgets - it has contry flag and label names and all

class ScrollableContainerWidget extends StatefulWidget {
  final AssetImage labelImage;
  final String labelname;
  final String firstsublabel;
  final String secondsublebel;
  const ScrollableContainerWidget({Key? key, required this.labelname, required this.firstsublabel, required this.secondsublebel, required this.labelImage}) : super(key: key);

  @override
  State<ScrollableContainerWidget> createState() => _ScrollableContainerWidgetState();
}

class _ScrollableContainerWidgetState extends State<ScrollableContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
        height: myheight/8,
        width: mywidth/3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: HexColor('#161618'),
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: myheight/60,),
            Center(
              child: Container(
                height: myheight/10,
                width: mywidth/5,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white54,
                    image: DecorationImage(image: widget.labelImage,fit: BoxFit.fill)
                ),
              ),
            ),
            SizedBox(height: myheight/60,),
            Center(child: Text(widget.labelname,style: TextStyle(color: HexColor('#F4F4F4')),)),
            SizedBox(height: myheight/60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(widget.firstsublabel,style: TextStyle(color: HexColor('#F4F4F4')),),
                Text(widget.secondsublebel,style: const TextStyle(color: Colors.grey),)
              ],
            )


          ],
        )
    );
  }
}

///This is custom container having info about action with complete button

class InfoContainer extends StatelessWidget {
  const InfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top : 6.0,left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: myheight/50,),
                    const Text("Action required",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    SizedBox(height: myheight/40,),
                    const Text("Lorem Ipsum is simply dummy text of the printing and",style: TextStyle(fontSize: 14,color: Colors.white),)

                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor('#0CABDF'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          textStyle: const TextStyle(
                              fontSize: 16,
                            letterSpacing: 1
                              )),
                      child: const Text('Complete'),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

/// List view container. It has image with rent and date and amount and all.
class ListviewContainer extends StatefulWidget {
  final HexColor bottomcolor;
  final AssetImage arrowimage;
  const ListviewContainer({Key? key, required this.bottomcolor, required this.arrowimage}) : super(key: key);

  @override
  State<ListviewContainer> createState() => _ListviewContainerState();
}

class _ListviewContainerState extends State<ListviewContainer> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Container(
      height: myheight/12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: HexColor('#161618'),),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration : BoxDecoration(borderRadius: BorderRadius.circular(25),color: widget.bottomcolor)
              ,),
          ),
          SizedBox(width: mywidth/30,),
          Expanded(
            flex: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                     color: HexColor('#161618'),
                    child:  Center(child: Image(image: widget.arrowimage)),),
                ),
                SizedBox(width: mywidth/30,),
                Expanded(
                  flex: 7,
                  child: Container(color:  HexColor('#161618'),
                  child: Padding(
                    padding: const EdgeInsets.only(left : 10,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Rent",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: myheight/100,),
                        Text("Sat-16 Jul-09.00pm",style: TextStyle(color: HexColor('#8C8C8E')),)
                      ],

                    ),
                  ),),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: HexColor('#161618'),
                  ),
                    child: const Text(r"-$850.00",style: TextStyle(color: Colors.white,fontSize: 16,)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Bottom Navigation widget
class Mybottomnavigation extends StatelessWidget {
  const Mybottomnavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    return Container(
      height: myheight/10,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
      ),
      child: const DefaultTabController(
        length: 5,
        child: TabBar(
          //indicator: BoxDecoration(color: Colors.blue),
          indicatorColor: Colors.black,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(
              icon: Icon(MyFlutterAppIcon.myhome),
              child: Text("Home"),
            ),
            Tab(
              icon: Icon(MyFlutterApp.loan),
              child: Text("Loan"),
            ),
            Tab(
              icon: Icon(MyFlutterApp.contacts),
              child: Text("Contac"),
            ),
            Tab(
              icon: Icon(MyFlutterApp.team),
              child: Text("Team"),
            ),
            Tab(
              icon: Icon(MyFlutterApp.chat),
              child: Text("Chats"),
            )
          ],
        ),
      ),
    );
  }
}

/// Custom APP ICons class
class MyFlutterAppIcon {
  MyFlutterAppIcon._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData myhome = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}






