import 'package:flutter/material.dart';
import 'package:template_project/screens/sign_in_screen.dart';
import 'package:template_project/screens/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Placeholder Gambar (Kotak dengan tanda silang diagonal)
              Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: CustomPaint(
                  painter: CrossPainter(),
                ),
              ),
              SizedBox(height: 20),
              // Coretan
              CustomPaint(
                size: Size(200, 20),
                painter: ScribblePainter(),
              ),
              SizedBox(height: 10),
              // Placeholder Teks
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              // Tombol Navigasi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text('Sign in'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text('Sign up'),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// Custom Painter untuk menggambar tanda silang (X)
class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // Garis diagonal dari kiri atas ke kanan bawah
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);

    // Garis diagonal dari kanan atas ke kiri bawah
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Custom Painter untuk menggambar coretan
class ScribblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 1.5,
      size.width * 0.5,
      size.height / 2,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      -size.height / 2,
      size.width,
      size.height / 2,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
