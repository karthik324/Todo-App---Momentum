import 'dart:io';

void main() {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j <= i; j++) {
      stdout.write('* ');
    }
    stdout.write('\n');
  }
}



  // var input = stdin.readLineSync();
  // int length = int.parse(input!);
  // int p;

  // for (int i = 0; i < length * 2; i++) {
  //   p = i;
  //   for (int j = 0; j < p; j++) {
  //     if (p > length) {
  //       p--;
  //     } else {
  //       stdout.write('*');
  //     }
  //   }
  //   stdout.write("\n");
  // }

  // List<Map<String, dynamic>> rooms = [
  //   {
  //     'roomNumber': 1,
  //     'roomBeds': 1,
  //     'roomColor': 1,
  //     'roomNumOfDwellers': 0,
  //     'roomDwellers': [9]
  //   },
  //   {
  //     'roomNumber': 2,
  //     'roomBeds': 3,
  //     'roomColor': 2,
  //     'roomNumOfDwellers': 0,
  //     'roomDwellers': [10, 12]
  //   },
  // ];

  // print('Enter the key');
  // var input = stdin.readLineSync();
  // print('Enter the value');
  // var val = stdin.readLineSync();

  // for (int i = 0; i < rooms.length; i++) {
  //   if (input == 'roomNumber' && rooms[i]['roomNumber'] != val) {
  //     rooms[i]['roomNumber'] = val;
  //   }
  // }

  // print(rooms);

  // List list = rooms[1]['roomDwellers'];
  // list.add(100);
