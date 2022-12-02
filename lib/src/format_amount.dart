/// to convert string amount from 1000000 to 1,000,000.00
String formatAmount(String amount) {
  String number = amount.split(".")[0];
  String decimal = amount.split(".")[1].isEmpty ? "00" : amount.split(".")[1];
  String amountInText = "";
  int counter = 0;
  for (int i = (number.length - 1); i >= 0; i--) {
    counter++;
    String str = number[i];
    if ((counter % 3) != 0 && i != 0) {
      amountInText = "$str$amountInText";
    } else if (i == 0) {
      amountInText = "$str$amountInText";
    } else {
      amountInText = ",$str$amountInText";
    }
  }
  return "${amountInText.trim()}.$decimal";
}
