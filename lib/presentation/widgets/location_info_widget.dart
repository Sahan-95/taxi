import 'package:flutter/material.dart';

import '../utils/responsive/screen_size.dart';

class LocationInfoWidget extends StatelessWidget {
  final Color locationPinColor;
  final String locationPinPoint;
  final String distance;
  final String location;
  const LocationInfoWidget(
      {super.key,
      required this.locationPinColor,
      required this.locationPinPoint,
      required this.distance,
      required this.location});

  @override
  Widget build(BuildContext context) {
    double screenHeight = displayHeight(context);
    double screenWidth = displayWidth(context);

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.07,
            height: screenWidth * 0.07,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: locationPinColor, width: 4)),
            child: Icon(
              Icons.circle,
              color: locationPinColor,
              size: screenHeight * 0.015,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    locationPinPoint,
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.12),
                    child: Text(
                      distance,
                      style: TextStyle(
                        fontSize: screenHeight * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.012),
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: screenHeight * 0.016,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
