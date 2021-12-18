import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViewPdfScreen extends StatelessWidget {
  const ViewPdfScreen({Key? key, required this.pdfName, required this.pdfUrl})
      : super(key: key);

  final String pdfUrl, pdfName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pdfName),
      ),
      body: const PDF(
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        fitEachPage: true,
      ).cachedFromUrl(
        pdfUrl,
        placeholder: (progress) => Center(
          child: Text('Loading: $progress %'),
        ),
        errorWidget: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
    );
  }
}
