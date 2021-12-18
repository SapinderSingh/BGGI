import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ViewPdfScreen extends StatelessWidget {
  const ViewPdfScreen({
    Key? key,
    required this.pdfName,
    required this.pdfUrl,
  }) : super(key: key);

  final String pdfUrl, pdfName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pdfName),
      ),
      body: FutureBuilder<PDFDocument>(
        future: PDFDocument.fromURL(pdfUrl),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return PDFViewer(
              document: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
