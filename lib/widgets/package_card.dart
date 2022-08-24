import 'package:adoptme/models/package.dart';
import 'package:adoptme/pages/vet_page.dart';
import 'package:adoptme/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  const PackageCard(this.package, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const VetPage()));
      },
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              color: Styles.bgColor,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.only(
              left: 22, right: 12, top: 14, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package.name,
                    style: TextStyle(
                        color: Styles.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    'Total ${package.services} Services',
                    style: const TextStyle(
                        color: Color(0xFF04EA4B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 1.5),
                  ),
                  const Gap(20),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'extra',
                          style: TextStyle(
                              color: Styles.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: 'Poppins')),
                      TextSpan(
                        text: ' ${package.bonus}₹ ',
                        style: const TextStyle(
                            color: Color(0xFF04EA4B),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: 'off on prepaid payment ',
                        style: TextStyle(
                            color: Styles.blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                    ]),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '₹${package.price}',
                    style: TextStyle(
                        color: Styles.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const Gap(10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: const Size(90, 0),
                      primary: Styles.bgWithOpacityColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text('Services',
                            style: TextStyle(
                                color: Styles.highlightColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        const Gap(5),
                        SvgPicture.asset(
                          'assets/svg/arrow_down2.svg',
                          height: 7,
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
