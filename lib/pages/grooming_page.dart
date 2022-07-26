import 'package:adoptme/models/package.dart';
import 'package:adoptme/utils/layouts.dart';
import 'package:adoptme/utils/styles.dart';
import 'package:adoptme/widgets/back_button.dart';
import 'package:adoptme/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class GroomingPage extends StatefulWidget {
  const GroomingPage({Key? key}) : super(key: key);

  @override
  State<GroomingPage> createState() => _GroomingPageState();
}

class _GroomingPageState extends State<GroomingPage> {
  List groomingList = [
    {
      'name': 'Spa Bath',
      'services': 7,
      'bonus': 160,
      'price': 960,
    },
    {
      'name': 'Bath + Basic Grooming',
      'services': 10,
      'bonus': 239,
      'price': 1438,
    },
    {
      'name': 'Full Service',
      'services': 12,
      'bonus': 299,
      'price': 1798,
    },
  ];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List _packages = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      for (var i = 0; i < groomingList.length; i++) {
        setState(() {
          listKey.currentState!
              .insertItem(0, duration: Duration(milliseconds: 500 - i * 200));
          _packages.add(groomingList[i]);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, _) {
                      return Stack(
                        children: [
                          Container(
                            width: value * size.width,
                            height: value * size.width,
                            decoration: BoxDecoration(
                                color: Styles.bgColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(value * size.width / 2),
                                  bottomRight:
                                      Radius.circular(value * size.width / 2),
                                )),
                            child: Column(
                              children: [
                                Gap(value * 50),
                                AnimatedSize(
                                  curve: Curves.bounceInOut,
                                  duration: const Duration(seconds: 1),
                                  child: SvgPicture.asset(
                                    'assets/svg/person2.svg',
                                    height: value * 200,
                                  ),
                                ),
                                Gap(value * 20),
                                Text(
                                  'Select your pet',
                                  style: TextStyle(
                                      fontSize: value * 15, height: 2),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                          const Positioned(
                              left: 15, top: 50, child: PetBackButton()),
                          Positioned(
                              left: size.width * 0.3,
                              right: size.width * 0.3,
                              bottom: 40,
                              child: AnimatedScale(
                                scale: value,
                                curve: Curves.bounceInOut,
                                duration: const Duration(milliseconds: 400),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      fixedSize: Size(value * 150, value * 44),
                                      primary: Styles.bgWithOpacityColor,
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/dog_icon.svg',
                                            height: value * 30),
                                        const Spacer(),
                                        Text('Dog',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Styles.highlightColor,
                                                fontSize: value * 16)),
                                        const Spacer(),
                                        SvgPicture.asset(
                                            'assets/svg/arrow_down.svg',
                                            height: value * 30)
                                      ],
                                    )),
                              ))
                        ],
                      );
                    }),
              ],
            ),
            const Gap(5),
            TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                curve: Curves.easeInExpo,
                duration: const Duration(milliseconds: 500),
                builder: (context, value, _) {
                return Text(
                  'Dog Grooming Packages',
                  style: TextStyle(
                      color: Styles.blackColor,
                      fontSize: value*25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                );
              }
            ),
            const Gap(5),
            MediaQuery.removeViewPadding(
              context: context,
              removeTop: true,
              child: AnimatedList(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  initialItemCount: _packages.length,
                  key: listKey,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (c, i, animation) {
                    final package = Package.fromJson(groomingList[i]);
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-0.5, 0),
                        end: const Offset(0, 0),
                      ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeIn,
                      )),
                      child: PackageCard(package),
                    );
                  }),
            ),
            TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                curve: Curves.easeInExpo,
                duration: const Duration(seconds: 1),
                builder: (context, value, _) {
                  return AnimatedScale(
                    scale: value,
                    curve: Curves.bounceOut,
                    duration: const Duration(seconds: 1),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(215, 44),
                        primary: Styles.bgColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Gap(0),
                          Text('Select your package',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Styles.highlightColor,
                                  fontSize: 15)),
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Styles.bgWithOpacityColor,
                              child: SvgPicture.asset(
                                  'assets/svg/arrow_down2.svg',
                                  height: 7))
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
