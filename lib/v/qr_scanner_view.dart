import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController();
  String? _scannedValue;
  bool _isDownloadable = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        controller.start();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        controller.stop();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.start();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture capture) {
    for (final barcode in capture.barcodes) {
      final String? rawValue = barcode.rawValue;
      if (rawValue != null) {
        debugPrint('Barkod bulundu! Değer: $rawValue');

        _isDownloadable = (rawValue == 'https://cokeurl.com/cappy23productqr');

        setState(() {
          _scannedValue = rawValue;
        });
        debugPrint('Barkod okundu! Değer: $_scannedValue');
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _handleBarcode,
            overlayBuilder: (context, constraints) {
              return LayoutBuilder(
                builder: (context, boxConstraints) {
                  return CustomPaint(
                    size: Size(
                      boxConstraints.maxWidth,
                      boxConstraints.maxHeight,
                    ),
                    painter: _ScannerOverlayPainter(),
                  );
                },
              );
            },
          ),
          if (_scannedValue != null)
            Positioned(
              bottom: 60,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: TweenAnimationBuilder<Color?>(
                      tween: ColorTween(
                        begin: Colors.red,
                        end: _isDownloadable ? Colors.blue : Colors.red,
                      ),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, color, _) {
                        return ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.file_download_outlined),
                              SizedBox(width: 8),
                              Text('Download'),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final screenRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final backgroundPath = Path()..addRect(screenRect);

    final holeWidth = size.width * 0.8;
    final holeHeight = holeWidth;
    final left = (size.width - holeWidth) / 2;
    final top = (size.height - holeHeight) / 2;

    final holeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, holeWidth, holeHeight),
      const Radius.circular(24),
    );

    final holePath = Path()..addRRect(holeRect);

    final finalPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      holePath,
    );

    final paint = Paint()..color = Colors.black.withValues(alpha: 0.5);
    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(_ScannerOverlayPainter oldDelegate) => false;
}
