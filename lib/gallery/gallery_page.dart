import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_art_gallery/gallery/bloc/gallery_bloc.dart';
import 'package:flutter_art_gallery/gallery/view/gallery_view.dart';
import 'package:http/http.dart' as http;

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GalleryBloc(httpClient: http.Client()),
      child: const GalleryView(),
    );
  }
}
