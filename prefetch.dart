import 'dart:collection';
import 'dart:io';

main() {
  var size = 1024;
  var a = List<int>.filled(size, 0);
  var b = List<int>.filled(size, 0);
  var total = 0;

  // var stride = Cache.missPenalty ~/ Cache.accessTime;

  var cache = Cache();

  //No prefetching
  noPrefetching(size, cache, a, b, total);
  print(cache.misses);
}

void noPrefetching(int size, Cache cache, List<int> a, List<int> b, int total) {
  for (int i = 0; i < size; i++) {
    if (cache.contains(a[i]) == false) {
      cache.add(a[i]);
    }

    if (cache.contains(b[i]) == false) {
      cache.add(b[i]);
    }

    total += sum(a[i], b[i]);
  }
}

int sum(int a, int b) {
  return a + b;
}

class Cache {
  static int accessTime = 7;
  static int missPenalty = 49;
  static int blockSize = 4;
  late List<int> storage;
  late int misses;

  Cache() {
    storage = <int>[];
    misses = 0;
  }

  bool contains(int item) {
    //loop through items and check for equality
  }

  add(int item) {
    storage.add(item);
    misses = misses + 1;
  }
}
