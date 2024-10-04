import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taxi/presentation/utils/extensions/color_extension.dart';

import '../../view_model/view_model.dart';
import '../utils/colors/color_coding.dart';
import '../utils/constants/strings.dart';
import '../utils/responsive/screen_size.dart';
import '../widgets/elevated_button_widget.dart';
import '../widgets/location_info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ViewModel>(context, listen: false).startCountdown();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = displayHeight(context);
    double screenWidth = displayWidth(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ViewModel>(context).isLoading
            ? Colors.grey.withOpacity(0.4)
            : Colors.white,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              booleanStringInDuty,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: screenHeight * 0.015),
            ),
            Consumer<ViewModel>(
              builder: (context, viewModel, child) {
                return Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: viewModel.isOnDuty,
                    activeColor: Colors.white,
                    activeTrackColor: pickupPointColor.toColor(),
                    onChanged: viewModel.isLoading
                        ? null
                        : (value) {
                            viewModel.setOnDuty(value);
                          },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: SizedBox(height: screenHeight * 0.9, child: const Drawer()),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.36,
                width: double.infinity,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/home_screen/google_map.svg",
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Consumer<ViewModel>(
                      builder: (context, viewModel, child) {
                        return viewModel.isLoading
                            ? Container(
                                color: Colors.grey.withOpacity(0.4),
                                child: Center(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.2,
                                        height: screenWidth * 0.2,
                                        child: const CircularProgressIndicator(
                                          value: null,
                                          strokeWidth: 10.0,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      ),
                                      Text(
                                        '${viewModel.countdown}',
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.03,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: vehicleContainerColor.toColor(),
                height: screenHeight * 0.15,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: SvgPicture.asset(
                        "assets/icons/home_screen/bike.svg",
                        width: screenWidth * 0.2,
                        color: vehicleColor.toColor(),
                      ),
                    ),
                    Text(
                      vehicleName,
                      style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          color: vehicleTextColor.toColor()),
                    ),
                  ],
                ),
              ),
              LocationInfoWidget(
                locationPinColor: pickupPointColor.toColor(),
                locationPinPoint: pickupPointTitleName,
                distance: distance,
                location: source,
              ),
              LocationInfoWidget(
                locationPinColor: dropOffPinPointColor.toColor(),
                locationPinPoint: dropOffPointTitleName,
                distance: distanceAway,
                location: destination,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButtonWidget(
                    backgroundColor: backgroundColorOfAcceptButton.toColor(),
                    buttonTitle: acceptButtonTitle,
                    foregroundColor: Colors.white,
                  ),
                  ElevatedButtonWidget(
                    backgroundColor: backgroundColorOfRejectButton.toColor(),
                    buttonTitle: rejectButtonTitle,
                    foregroundColor: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
