import 'package:flutter_art_gallery/gallery/model/artwork.dart';

enum GalleryStatus { initial, success, failure }

class GalleryState {
  const GalleryState({
    this.status = GalleryStatus.initial,
    this.artworks = const <Artwork>[],
  });

  final GalleryStatus status;
  final List<Artwork> artworks;

  GalleryState copyWith({
    GalleryStatus? status,
    List<Artwork>? artworks,
  }) {
    return GalleryState(
      status: status ?? this.status,
      artworks: artworks ?? this.artworks,
    );
  }
}
