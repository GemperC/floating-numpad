import 'package:floating_numpad/providers/wrists_pos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumpadWidget extends StatelessWidget {
  final double spacing; // The space between the containers

  const NumpadWidget({
    super.key,
    this.spacing = 20.0, // Default spacing
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Stack(
        alignment: Alignment.center,
        children: [
          acticatorLine(),
          Provider.of<WristsPositionProvider>(context, listen: true)
                  .numpadActive
              ? numpad()
              : Container(),
        ],
      )),
    );
  }

  Widget acticatorLine() => Align(
        alignment: Alignment(0, -0.8),
        child: Container(
          height: 120,
          width: double.infinity,
          color: Color.fromARGB(72, 108, 244, 54),
        ),
      );

  Widget numpad() => Wrap(
        // Wrap the GridView to prevent it from taking the whole page
        children: [
          Container(
            child: GridView.builder(
              reverse: true,
              shrinkWrap: true, // Add this line
              physics: NeverScrollableScrollPhysics(), // And this one
              padding: EdgeInsets.all(spacing), // Use the spacing variable here
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing:
                    spacing, // Horizontal space between the containers
                mainAxisSpacing:
                    spacing, // Vertical space between the containers
                childAspectRatio: 1.0, // For square containers, keep this 1
              ),
              itemBuilder: (context, index) {
                return Container(
                  // You may want to add size to the container here if needed
                  decoration: BoxDecoration(
                    color: Provider.of<WristsPositionProvider>(context,
                                    listen: false)
                                .selectedPadNum ==
                            index + 1
                        ? Color.fromARGB(176, 54, 120, 244)
                        : Color.fromARGB(73, 54, 120, 244),
                    borderRadius: BorderRadius.circular(
                        8), // Optional: if you want rounded corners
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          fontSize: 50,
                          color: const Color.fromARGB(137, 255, 255, 255),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              },
              itemCount: 9, // Since you want a 3x3 grid
            ),
          ),
        ],
      );
}
