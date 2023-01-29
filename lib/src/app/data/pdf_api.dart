// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class User {
  const User({
    required this.product,
    required this.jumlahItemSatuan,
    required this.harga,
  });
  final String product;
  final String jumlahItemSatuan;
  final String harga;
}

class PdfApi {
  static Future<File> generateTable(String text) async {
    final pdf = Document();
    final header = ['Product', 'JumlahItem/Satuan', 'Harga'];

    final users = [
      const User(
        product: 'Rodensida',
        jumlahItemSatuan: '6 buah',
        harga: 'Rp 7.500',
      ),
      const User(
        product: 'Spray Deterjen',
        jumlahItemSatuan: '1 liter',
        harga: 'Rp 25.000',
      ),
      const User(
        product: 'Vaksin ND',
        jumlahItemSatuan: '1090 cc',
        harga: 'Rp 130',
      ),
    ];

    final data = users.map((user) => [user.product, user.jumlahItemSatuan, user.harga]).toList();
    pdf.addPage(
      Page(
        build: (context) => Table.fromTextArray(
          headers: header,
          data: data,
        ),
      ),
    );

    return saveDocument(name: '$text.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<dynamic> openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}

// class PdfApi {
//   static Future<File> generateCenteredText(String text) async {
//     final pdf = Document();

//     pdf.addPage(
//       Page(
//         build: (context) => Center(
//           child: Text(text, style: const TextStyle(fontFamily: 'Montserrat',fontSize: 48)),
//         ),
//       ),
//     );

//     return saveDocument(name: '$text.pdf', pdf: pdf);
//   }

//   static Future<File> saveDocument({
//     required String name,
//     required Document pdf,
//   }) async {
//     final bytes = await pdf.save();
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');

//     await file.writeAsBytes(bytes);
//     return file;
//   }

//   static Future openFile(File file) async {
//     final url = file.path;
//     await OpenFile.open(url);
//   }
// }
