import 'dart:convert';

/// to sum string by utf8 return to int
int crc16(String data) {
  int crc = 0xFFFF;
  for (int i = 0; i < data.length; i++) {
    var x = ((crc >> 8) ^ utf8.encode(data[i])[0]) & 0xFF;
    x ^= x >> 4;
    crc = ((crc << 8) ^ (x << 12) ^ (x << 5) ^ x) & 0xFFFF;
  }
  return crc;
}
