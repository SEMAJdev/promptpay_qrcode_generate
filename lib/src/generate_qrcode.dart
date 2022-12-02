import 'dart:convert';

String generateQRCode({
  String promptPayID = "",
  double amount = 0
}){
  if(promptPayID.length == 10 || promptPayID.length == 13){
    /// Start
    String start = "000201";

    /// Accept recycle
    String acceptRecycle = "010211";

    /// Merchant account information
    /// application ID
    String merchantInfo = "0016A000000677010111";
    /// PromptPay ID
    /// length 10 = phone
    /// length 13 = ID Card
    String merchantInfoType = promptPayID.length == 10 ? "2937${merchantInfo}01130066${promptPayID.substring(1)}" : "2937${merchantInfo}0213$promptPayID";

    /// Field 58 length 28 data TH is Thai baht
    String currency = "5802TH";

    /// Amount
    String dataAmount = "";
    if(amount > 0){
      String amountText = amount.toStringAsFixed(2);
      String amountLength = amountText.length < 10 ? "0${amountText.length}" : "${amountText.length}";
      dataAmount = "54$amountLength$amountText";
    }

    /// Field 53 length 03 data 764 is thai baht in ISO4217
    String currencyISO = "5303764";

    /// checksum Field 63 length 04
    String checkSum = "6304";

    String promptPayQR = "$start$acceptRecycle$merchantInfoType$currency$dataAmount$currencyISO$checkSum";

    String checkSumData = crc16(promptPayQR).toRadixString(16).toUpperCase();

    return "$promptPayQR$checkSumData";
  }
  return "";
}

int crc16(String data) {
  int crc = 0xFFFF;
  for (int i = 0; i < data.length; i++) {
    var x = ((crc >> 8) ^ utf8.encode(data[i])[0]) & 0xFF;
    x ^= x >> 4;
    crc = ((crc << 8) ^ (x << 12) ^ (x << 5) ^ x) & 0xFFFF;
  }
  return crc;
}