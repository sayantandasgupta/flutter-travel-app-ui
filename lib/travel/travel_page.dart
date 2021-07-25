import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 4, vsync: this);

  var anim = 1.0;
  double anim2 = 1.0;

  @override
  void initState() {
    super.initState();
    withAnimation(
        vsync: this,
        tween: Tween(begin: 1.0, end: 0.0),
        callBack: (animationVal, controllerVal) {
          anim = animationVal as double;
          setState(() {});
        });

    withRepeatAnimation(
        vsync: this,
        isRepeatReversed: true,
        tween: Tween(begin: 2.0, end: 3.0),
        callBack: (animationVal, controllerVal) {
          anim2 = animationVal as double;
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController.index;
    return Scaffold(
      backgroundColor: Vx.green500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20.0, 2.0).white.make(),
          5.heightBox,
          VxBox().size(28.0, 2.0).white.make(),
          5.heightBox,
          VxBox().size(15.0, 2.0).white.make(),
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack(
        [
          VxBox(
                  child: [
            VxBox()
                .square(100)
                .roundedFull
                .neumorphic(color: Vx.green500)
                .bgImage(const DecorationImage(
                    image: NetworkImage(
                        'https://wallpaperaccess.com/full/3433558.jpg')))
                .make(),
            "Hi , "
                .richText
                .withTextSpanChildren(["Kakashi".textSpan.bold.make()])
                .white
                .xl2
                .make()
                .p8()
                .offset(offset: Offset(-300.0 * anim, 0.0)),
            "Solo Traveller".text.white.make(),
            VxTextField(
              borderType: VxTextFieldBorderType.none,
              borderRadius: 18,
              contentPaddingTop: 15,
              hint: "Search",
              autofocus: false,
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
              fillColor: Vx.gray200.withOpacity(0.4),
            )
                .customTheme(
                  themeData: ThemeData(
                    brightness: Brightness.dark,
                  ),
                )
                .cornerRadius(10)
                .p16()
          ].column())
              .makeCentered()
              .h32(context),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: VxBox(
              child: VStack(
                [
                  TabBar(
                    tabs: [
                      Icon(Icons.map, size: 10)
                          .scale(scaleValue: tabIndex == 0 ? anim2 : 3.0),
                      Icon(Icons.pin_drop, size: 10)
                          .scale(scaleValue: tabIndex == 1 ? anim2 : 3.0),
                      Icon(Icons.restaurant, size: 10)
                          .scale(scaleValue: tabIndex == 2 ? anim2 : 3.0),
                      Icon(Icons.person, size: 10)
                          .scale(scaleValue: tabIndex == 3 ? anim2 : 3.0),
                    ],
                    controller: _tabController,
                    indicatorColor: Colors.green,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Vx.green500,
                    unselectedLabelColor: Vx.gray400,
                    labelPadding: Vx.m16,
                  ),
                  TabBarView(
                    controller: _tabController,
                    children: ["1", "2", "3", "4"]
                        .map(
                          (e) => VStack([
                            "Discover Places in Konoha"
                                .text
                                .gray600
                                .bold
                                .xl2
                                .make(),
                            20.heightBox,
                            PlaceCard(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm2l_O9F3RQjVaT_yTLCX2SijrUEpg9mg0sZBX2J0e9DPC-Bzp9rDqhhoAM5eb3YYsXt8&usqp=CAU',
                                    'Ichiraku Ramen')
                                .cornerRadius(10)
                                .backgroundColor(Vx.gray200),
                            20.heightBox,
                            PlaceCard(
                                    'https://i.ytimg.com/vi/o3Aitai0Vyk/hqdefault.jpg',
                                    'Valley of the End')
                                .cornerRadius(10)
                                .backgroundColor(Vx.gray200),
                          ]).p16(),
                        )
                        .toList(),
                  ).expand(),
                ],
              ),
            ).white.make(),
          ).expand()
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String imageURL;
  final String title;

  PlaceCard(this.imageURL, this.title);

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        Image.network(
          imageURL,
          fit: BoxFit.cover,
        ).wh(context.percentWidth * 35, 100).cornerRadius(10),
        20.widthBox,
        VStack(
          [
            title.text.semiBold.make(),
            3.heightBox,
            "Konoha".text.make().shimmer(),
            5.heightBox,
            [
              VxRating(
                onRatingUpdate: (value) {},
                size: 13,
              ),
              5.widthBox,
              "( 250 )".text.xs.gray600.make()
            ].row(),
          ],
          crossAlignment: CrossAxisAlignment.start,
        ).expand(),
      ],
    );
  }
}
