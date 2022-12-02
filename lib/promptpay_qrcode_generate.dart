library promptpay_qrcode_generate;

import 'package:flutter/material.dart';
import 'package:promptpay_qrcode_generate/src/format_amount.dart';
import 'package:promptpay_qrcode_generate/src/generate_qrcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerate extends StatelessWidget {
  final String promptPayId;
  final double amount, width, height;
  final bool isShowAccountDetail;
  final Widget? promptPayDetailCustom;
  final bool isShowAmountDetail;
  final Widget? amountDetailCustom;

  const QRCodeGenerate({
    Key? key,
    required this.promptPayId,
    this.amount = 0,
    this.width = double.infinity,
    this.height = 400,
    this.isShowAccountDetail = true,
    this.promptPayDetailCustom,
    this.isShowAmountDetail = true,
    this.amountDetailCustom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String qrCodeGenerate = generateQRCode(promptPayID: promptPayId, amount: amount);

    return Container(
      color: Colors.white,
      width: width,
      height: height,
      // padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue.shade900,
              width: width,
              child: Image.asset(
                "assets/images/thai_qr_payment.png",
                package: "promptpay_qrcode_generate",
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              "assets/images/prompt_pay_logo.png",
              package: "promptpay_qrcode_generate",
            ),
          ),
          Expanded(
            flex: 4,
            child: qrCodeGenerate.isNotEmpty
                ? QrImage(
                    data: qrCodeGenerate,
                  )
                : const Align(
                    alignment: Alignment.center,
                    child: Text("PromptPay ID must have 10 or 13 character."),
                  ),
          ),
          if (isShowAccountDetail)
            promptPayDetailCustom == null ? Text("Account ($promptPayId)") : promptPayDetailCustom!,
          if (isShowAmountDetail)
            amountDetailCustom == null ? Text("Amount ${formatAmount(amount.toStringAsFixed(2))} Baht") : amountDetailCustom!,
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
