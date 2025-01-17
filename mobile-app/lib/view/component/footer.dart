import 'package:flutter/material.dart';
import 'package:tts/value/asset.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Colors.white.withValues(alpha: 0.025),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Opacity(
        opacity: 0.25,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Powered By',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white70,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAsset.joshLogo,
                  width: 64.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0, left: 8.0),
                  child: Text(
                    'Innovation Lab',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
