import 'package:flutter/material.dart';

class AnimationSet {
  // Fade-in Animation
  static Widget fadeIn({
    required Widget child,
    required AnimationController controller,
    Curve curve = Curves.easeIn,
  }) {
    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    return FadeTransition(opacity: animation, child: child);
  }

  // Slide-in Animation
  static Widget slideIn({
    required Widget child,
    required AnimationController controller,
    Offset begin = const Offset(0.0, 0.2),
    Curve curve = Curves.easeOut,
  }) {
    final animation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    return SlideTransition(position: animation, child: child);
  }

  // Fade + Slide-in Animation
  static Widget fadeSlideIn({
    required Widget child,
    required AnimationController controller,
    Offset begin = const Offset(0.0, 0.2),
    Curve curve = Curves.easeOut,
  }) {
    final slideAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    final fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(opacity: fadeAnimation, child: child),
    );
  }

  // Scale Animation
  static Widget scale({
    required Widget child,
    required AnimationController controller,
    double begin = 0.5,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    final scaleAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    return ScaleTransition(scale: scaleAnimation, child: child);
  }

  // Rotation Animation
  static Widget rotate({
    required Widget child,
    required AnimationController controller,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    final rotateAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    return RotationTransition(turns: rotateAnimation, child: child);
  }

  // Bounce Animation
  static Widget bounce({
    required Widget child,
    required AnimationController controller,
    Curve curve = Curves.bounceInOut,
  }) {
    final bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    return ScaleTransition(scale: bounceAnimation, child: child);
  }

  // Staggered Fade + Slide-in
  static Widget staggeredFadeSlideIn({
    required Widget child,
    required AnimationController controller,
    Offset begin = const Offset(0.0, 0.2),
    Curve curve = Curves.easeOut,
  }) {
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    final slideAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final slide = slideAnimation.value;
        final opacity = fadeAnimation.value;
        return Transform.translate(
          offset: Offset(slide.dx, slide.dy),
          child: Opacity(opacity: opacity, child: child),
        );
      },
      child: child,
    );
  }

  // Zoom-in Animation
  static Widget zoomIn({
    required Widget child,
    required AnimationController controller,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    final zoomAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: controller, curve: curve));
    return ScaleTransition(scale: zoomAnimation, child: child);
  }

  // Slide + Rotate Animation
  static Widget slideRotate({
    required Widget child,
    required AnimationController controller,
    Offset begin = const Offset(0.0, 0.2),
    double angle = 0.5,
    Curve curve = Curves.easeInOut,
  }) {
    final slideAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    final rotateAnimation = Tween<double>(
      begin: 0.0,
      end: angle,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final slide = slideAnimation.value;
        final angleRotation = rotateAnimation.value;
        return Transform.translate(
          offset: slide,
          child: Transform.rotate(angle: angleRotation, child: child),
        );
      },
      child: child,
    );
  }
}
