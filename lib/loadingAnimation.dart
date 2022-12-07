import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingAnimation() {
  return Center(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      LoadingAnimationWidget.hexagonDots(
        color: Colors.black45,
        size: 50,
      ),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text("Loading ..."),
      )
    ],
  ));
}

Widget loadingAnimationWithAppbar() {
  return Scaffold(
      appBar: AppBar(
        title: const Text("loading"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.hexagonDots(
            color: Colors.black45,
            size: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Loading ..."),
          )
        ],
      )));
}
