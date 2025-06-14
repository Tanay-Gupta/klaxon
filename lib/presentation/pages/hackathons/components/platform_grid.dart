import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart'; // Required for context.go()

import '../../../../infrastructure/models/platform_model.dart';
import '../../../values/constants.dart';
import '../../../values/platform_master.dart';


class PlatformGrid extends StatelessWidget {
  const PlatformGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final platforms = hackathonPlatforms;

    return Container(
      height: 130,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(11),
      child: GridView.count(
        
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        children:
            platforms.map((platform) {
              return _PlatformIcon(
                name: platform['name']!,
                icon: platform['icon']!,
              );
            }).toList(),
      ),
    );
  }
}

class _PlatformIcon extends StatelessWidget {
  final String name;
  final String icon;

  const _PlatformIcon({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPlatformGridBGColor,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          color: kPlatformGridBGColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            // context.push('/platform/$name');
            context.push(
              '/platform',
              extra: {
                'platformName': name,
                'platformType': PlatformType.hackathon,
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, height: 30, width: 30),
              const SizedBox(height: 6),
              Text(
                platformDisplayNames[name] ?? "",
                style: gridIconTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
