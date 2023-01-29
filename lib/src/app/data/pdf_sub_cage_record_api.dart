// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class User {

  const User({
    required this.tanggal,
    required this.umur,
    required this.deplesi,
    required this.panen,
    required this.sisa,

  });
  final String tanggal;
  final String umur;
  final String deplesi;
  final String panen;
  final String sisa;
}

class PdfSubCageRecordApi {
  static Future<File> generateTable(String text) async {
    final pdf = Document();
    final header = ['Tanggal', 'Umur', 'Deplesi', 'Panen', 'Sisa'];

    final users = [
      const User(
        tanggal: 'Sen, 01-01-2022',
        umur: '1',
        deplesi: '41',
        panen: '0',
        sisa: '16359',
      ),
      const User(
        tanggal: 'Sel, 02-02-2022',
        umur: '2',
        deplesi: '41',
        panen: '0',
        sisa: '16318',
      ),
      const User(
        tanggal: 'Rab, 03-01-2022',
        umur: '3',
        deplesi: '50',
        panen: '0',
        sisa: '16268',
      ),
      const User(
        tanggal: 'Kam, 04-01-2022',
        umur: '4',
        deplesi: '39',
        panen: '0',
        sisa: '16229',
      ),
      const User(
        tanggal: 'Jum, 05-01-2022',
        umur: '5',
        deplesi: '37',
        panen: '0',
        sisa: '16192',
      ),
      const User(
        tanggal: 'Sab, 06-01-2022',
        umur: '6',
        deplesi: '45',
        panen: '0',
        sisa: '16137',
      ),
      const User(
        tanggal: 'Min, 07-01-2022',
        umur: '7',
        deplesi: '38',
        panen: '0',
        sisa: '16099',
      ),
      
    ];

    final data = users
        .map((user) => [user.tanggal, user.umur, user.deplesi, user.panen, user.sisa])
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
