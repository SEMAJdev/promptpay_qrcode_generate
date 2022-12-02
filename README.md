# PromptPayQRCodeGenerate

An easy way to generate Prompt-pay QR Code from prompt-pay id.

PromptPayQRCodeGenerate have package "qr_flutter: ^4.0.0" inside.

This version only support prompt-pay in thailand and currency in Thai Baht.

[![Pub](https://img.shields.io/pub/v/promptpay_qrcode_generate.svg)](https://pub.dartlang.org/packages/promptpay_qrcode_generate)
[![Tests](https://github.com/SEMAJdev/promptpay_qrcode_generate/actions/workflows/dart.yml/badge.svg)](https://github.com/SEMAJdev/promptpay_qrcode_generate/actions/workflows/dart.yml)

![Prompt-pay QR Code Generate Demo](https://github.com/SEMAJdev/promptpay_qrcode_generate/blob/main/demo_images/demo_promptpay_qrcode_generate.png?raw=true "Prompt-pay QR Code Generate Demo")

## Features

* Generate QR Code from Prompt-pay ID

## Usage

Show a QRCodeGenerate:
```dart
QRCodeGenerate(
  promptPayId: "YourPromptPay",
  amount: 1234.56,
  width: 400,
  height: 400,
),
```

## Credits
[SEMAJdev](https://github.com/SEMAJdev/)
