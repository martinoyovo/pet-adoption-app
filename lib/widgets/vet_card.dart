import 'package:adoptme/models/package_details.dart';
import 'package:adoptme/utils/layouts.dart';
import 'package:adoptme/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'book_button.dart';

class VetCard extends StatelessWidget {
  final VeterinaryDetails vetItem;
  const VetCard(this.vetItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return FittedBox(
      child: Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Styles.bgColor,
              borderRadius: BorderRadius.circular(17)),
          padding: const EdgeInsets.only(
              left: 16, right: 12, top: 14, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Gap(5),
                      Text(
                        vetItem.title,
                        style: TextStyle(
                            color: Styles.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      const Gap(7),
                      vetItem.pet == null
                          ? const Gap(0)
                          : SvgPicture.asset(vetItem.pet!,
                          height: 30),
                    ],
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: vetItem.items.map<Widget>((i) {
                      if (vetItem.items.indexOf(i) == 0) {
                        return RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '• $i ',
                                  style: TextStyle(
                                      color: Styles.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: 'Poppins')),
                              TextSpan(
                                  text: vetItem.sub,
                                  style: TextStyle(
                                      color:
                                      Styles.highlightColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      fontFamily: 'Poppins')),
                            ]));
                      }
                      return Text('• $i',
                          style: TextStyle(
                              color: Styles.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: 'Poppins'));
                    }).toList(),
                  ),
                  const Gap(8),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, bottom: 12),
                    child: Column(
                      children: [
                        Text(
                          '₹${vetItem.price}',
                          style: TextStyle(
                              color: Styles.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          'starting cost',
                          style: TextStyle(
                              color: Styles.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 0.5),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const BookButton()
                ],
              ),
            ],
          )),
    );
  }
}
