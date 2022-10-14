// To parse required this JSON data, do
//
//     final wallpaperModel = wallpaperModelFromJson(jsonString);

import 'dart:convert';

List<WallpaperModel> wallpaperModelFromJson(String str) =>
    List<WallpaperModel>.from(
        json.decode(str).map((x) => WallpaperModel.fromJson(x)));

String wallpaperModelToJson(List<WallpaperModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WallpaperModel {
  WallpaperModel({
    required this.id,
    required this.createdAt,
    required this.color,
    required this.urls,
    required this.links,
  });

  String id;
  DateTime createdAt;
  String color;
  Urls urls;
  WallpaperModelLinks links;

  factory WallpaperModel.fromJson(Map<String, dynamic> json) => WallpaperModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        color: json["color"],
        urls: Urls.fromJson(json["urls"]),
        links: WallpaperModelLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "color": color,
        "urls": urls.toJson(),
        "links": links.toJson(),
      };
}

class WallpaperModelLinks {
  WallpaperModelLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory WallpaperModelLinks.fromJson(Map<String, dynamic> json) =>
      WallpaperModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}
