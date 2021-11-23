import 'dart:io';

main() {
  var a = List<Item>.filled(1024, Item(), growable: true);
  var b = List<Item>.filled(1024, Item(), growable: true);
  var missPenalty = 49;
  var accessTime = 7;
  var k = missPenalty~/accessTime;
  for (int i = 0; i < a.length; i++) {
    prefetch(a[i + k]);
  }
}

void prefetch(Item item) {
  sleep(Duration(seconds: 7));
}

class Item {
  bool inMemory = false;
  Item();
}
