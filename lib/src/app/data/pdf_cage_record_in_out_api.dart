// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class User {

  const User({
    required this.no,
    required this.subCage,
    required this.qtyIn,
    required this.qtyOut,
    required this.qty,
    required this.price,

  });
  final String no;
  final String subCage;
  final String qtyIn;
  final String qtyOut;
  final String qty;
  final String price;
}

class PdfCageRecordInOutApi {
  static Future<File> generateTable(String text) async {
    final pdf = Document();
    final header = ['No.', 'Sub Cage', 'Qty In', 'Qty Out', 'Qty', 'Price'];

    final users = [
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
      const User(
        no: '1',
        subCage: 'Citayam-01',
        qtyIn: '30',
        qtyOut: '3',
        qty: '27',
        price: '30000',
      ),
    ];

    final data = users
        .map((user) => [user.no, user.subCage, user.qtyIn, user.qtyOut, user.qty, user.price])
        .toList();
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

  static Future<void> openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
