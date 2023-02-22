import 'package:flutterwidgets/animation_success/animation_success.dart';
import 'package:flutterwidgets/features/Qrcode/scan_qr_code.dart';
import 'package:flutterwidgets/features/Qrcode/success_screen.dart';
import 'package:flutterwidgets/features/Qrcode/test.dart';
import 'package:flutterwidgets/features/pincodefiled/pin_code.dart';
import 'package:flutterwidgets/home_page.dart';
import 'package:flutterwidgets/ldb_qr_payment/ldb_qr_payment.dart';
import 'package:flutterwidgets/widgets/save_widget_widget.dart';

routes(context) => {
      '/homepage': (context) => const MyHomePage(),
      '/sucess': (context) => const SucessPage(),
      '/scanqr': (context) => const ScanQR(),
      '/success_screen': (context) => const CaptureWidget(),
      '/save': (context) => const SaveWidget(),
      '/ldb-payment': (context) => LDBPAY(),
      '/pin': (context) => const PinCodeVerificationScreen(),
      '/animation': (context) => AnimationSuccess(),
    };
