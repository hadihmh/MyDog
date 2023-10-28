import 'package:flutter/material.dart';

class MainItem extends StatelessWidget {
  const MainItem({
    super.key,
    required this.imageUrl,
    required this.titleContent,
    required this.onTap,
    required this.marginTop,
    required this.marginButton,
  });
  final String imageUrl;
  final String titleContent;

  final VoidCallback onTap;
  final double marginTop;
  final double marginButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop, bottom: marginButton),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width / 2, rect.height + 60));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    imageUrl,
                    height: 175,
                  )),
              const SizedBox(
                height: 30,
              ),
              Text(
                titleContent,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
