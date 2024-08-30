import 'dart:io';

import 'package:equatable/equatable.dart';

final class ImageType {
  ImageType._();

  static const String local = 'local';
  static const String network = 'network';
}

class ImageEntity extends Equatable {
  final String? id;
  final String? path;
  final File? file;
  final IllustrationFileEntity? networkData;
  final String type;

  const ImageEntity({
    this.id,
    this.path,
    this.file,
    this.networkData,
    this.type = ImageType.local,
  });

  ImageEntity copyWith({
    String? id,
    String? path,
    File? file,
    IllustrationFileEntity? networkData,
    String? type,
  }) {
    return ImageEntity(
      id: id ?? this.id,
      path: path ?? this.path,
      file: file ?? this.file,
      networkData: networkData ?? this.networkData,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [id, path, file, networkData, type];
}

class IllustrationFileEntity {
  String? complaintId;
  String? createdBy;
  int? createdAt;
  String? lastModifiedBy;
  int? lastModifiedAt;
  String? id;
  String? ticketId;
  String? fileId;
  String? fileType;
  bool? deleted;
  String? originalName;
  String? viewUrl;
  String? downloadUrl;

  IllustrationFileEntity({
    this.complaintId,
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.ticketId,
    this.fileId,
    this.fileType,
    this.deleted,
    this.originalName,
    this.viewUrl,
    this.downloadUrl,
  });
}
