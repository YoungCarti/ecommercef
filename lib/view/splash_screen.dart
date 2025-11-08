import 'package:ecommerceapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
im

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // navigate based on auth state after 2.5 seconds
    Future.delayed(const Duration(milliseconds: 2500),(){
      if (authController.isFirstTime) {

      } else if (authController.isLoggedIn) {

      } else {

      }
    });




    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withValues(alpha: 0.7),
              Theme.of(context).primaryColor.withValues(alpha: 0.6), 
            ],
          ),
        ),
        child: Stack(
          children: [
            // background pattern
            Positioned.fill(
              child: Opacity(opacity: 0.05,
              child: GridPattern(
                color: Colors.white,
              )
              )),
              

             // main content
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated log1o container  
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1200),
                    builder: (context,value, child){
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              )
                            ]
                          ),
                          child: Icon(Icons.shopping_bag_outlined,
                          size: 48,
                          color: Theme.of(context).primaryColor,
                           ),
                        ),
                      );
                    },
                    ),
                    const SizedBox(height: 32),

                    //animated text
                    TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1200),
                    builder: (context,value, child){
                      return Opacity(opacity: value,
                       child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                       child: child,
                       ),
                       );
                    },
                    child: Column(
                      children: [
                        Text(
                          "FASHION",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 8,
                          ),
                        ),
                          Text(
                          "STORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                    ),
                ],
              )
             ),
        ],
        )
      ),
    );
  }
}

class GridPattern extends StatefulWidget {
  final Color color;
  const GridPattern({
    super.key,
    required this.color,
    });

  @override
  State<GridPattern> createState() => _GridPatternState();
}

class _GridPatternState extends State<GridPattern> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(color: widget.color),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color color;
  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = color
    ..strokeWidth = 0.5;

    final spacing = 20.0;

      for (var i=0.0; i< size.width; i += spacing) {
        canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
      }

      for (var i=0.0; i< size.height; i += spacing) {
        canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
      }
   
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}