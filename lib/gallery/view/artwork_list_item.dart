import 'package:flutter/material.dart';
import 'package:flutter_art_gallery/gallery/model/artwork.dart';

class ArtworkListItem extends StatelessWidget {
  const ArtworkListItem({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 2,
      child: Column(
        children: [
          Image.network(artwork.imageUrl),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Text(
              artwork.title,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 32),
            child: Text(
              artwork.description,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
