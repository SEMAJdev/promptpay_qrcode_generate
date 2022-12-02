import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:promptpay_qrcode_generate/promptpay_qrcode_generate.dart';

void main(){
  group('PromptPayQRCodeGenerate', () {
    testWidgets('should have a PromptPayQRCodeGenerate of images',
            (WidgetTester tester) async {

          Widget testWidget = const MediaQuery(
              data: MediaQueryData(size: Size(600, 800)),
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: QRCodeGenerate(
                    promptPayId: "YourPromptPay",
                    amount: 1234.56,
                    width: 400,
                    height: 400,
                  )));
          await tester.pumpWidget(testWidget);

        });
  });
}