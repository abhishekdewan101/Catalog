import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/utils/navigation/routes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 750), () {
      context.goNamed(Routes.base);
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  'assets/landing_page_light.svg',
                  width: 350,
                  height: 275,
                ),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 110.0, top: 10.0),
                child: SvgPicture.asset(
                  'assets/landing_icon.svg',
                  width: 60,
                  height: 48,
                ),
              ),
              Text(
                "catalog",
                style: TextStyle(
                    fontFamily: 'Parisienne',
                    fontSize: 40.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/landing_page_light.svg',
                width: 350,
                height: 275,
              )
            ],
          )
        ],
      ),
    );
  }
}
