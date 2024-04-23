import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:newflutter/core/constant/color.dart';
import 'package:newflutter/core/constant/imgaeasset.dart';

class BestOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Offer',
                style: TextStyle(
                  color: AppColor.mTitleTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppColor.mBodyTextColor.withOpacity(0.8),
                  fontSize: 14,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 66,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/best_house.jpeg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          'The Moon House',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'P455, Chhatak, Sylhet',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Positioned(
                  right: 0,
                  child:CircleAvatar(
                    child: SvgPicture.asset(AppImageAsset.profile),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}