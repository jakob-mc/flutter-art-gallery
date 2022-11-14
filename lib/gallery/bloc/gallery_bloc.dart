import 'dart:async';
import 'dart:convert';

import 'package:flutter_art_gallery/gallery/bloc/gallery_event.dart';
import 'package:flutter_art_gallery/gallery/bloc/gallery_state.dart';
import 'package:flutter_art_gallery/gallery/model/artwork.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required this.httpClient}) : super(const GalleryState()) {
    on<FetchArtworks>(_onFetchArtworks);

    add(FetchArtworks());
  }

  final http.Client httpClient;
  static const searchQuery = 'cats';

  Future<void> _onFetchArtworks(
    FetchArtworks event,
    Emitter<GalleryState> emit,
  ) async {
    try {
      final artworks = await _fetchArtworks(searchQuery);
      return emit(
        state.copyWith(
          status: GalleryStatus.success,
          artworks: artworks,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: GalleryStatus.failure));
    }
  }

  Future<List<Artwork>> _fetchArtworks(String query) async {
    final response = await httpClient.get(
      Uri.https(
        'api.artic.edu',
        '/api/v1/artworks/search',
        <String, String>{
          'q': query,
          'limit': '20',
          'fields': 'title,image_id,artist_display'
        },
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataList = body['data'] as List;
      return dataList.map((dynamic json) {
        final map = json as Map<String, dynamic>;

        final artistDisplay = map['artist_display'] as String? ?? '';
        final imageId = map['image_id'] as String? ?? '';
        final title = map['title'] as String? ?? '';

        final imageUrl =
            'https://www.artic.edu/iiif/2/$imageId/full/843,/0/default.jpg';

        return Artwork(title, artistDisplay, imageUrl);
      }).toList();
    }
    throw Exception('error fetching artworks');
  }
}
