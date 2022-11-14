import 'package:flutter/material.dart';
import 'package:flutter_art_gallery/gallery/bloc/gallery_bloc.dart';
import 'package:flutter_art_gallery/gallery/bloc/gallery_state.dart';
import 'package:flutter_art_gallery/gallery/view/artwork_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter Art Gallery'),
          backgroundColor: Colors.black),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          switch (state.status) {
            case GalleryStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case GalleryStatus.failure:
              return const Center(child: Text('failed to fetch artworks'));
            case GalleryStatus.success:
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ArtworkListItem(artwork: state.artworks[index]);
                },
                itemCount: state.artworks.length,
              );
          }
        },
      ),
    );
  }
}
