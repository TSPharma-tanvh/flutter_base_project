import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? username;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? accountType;
  final String? dayOfBirth;
  final String? avatarFileUrl;
  final String? avatarFileId;
  final String? address;
  final String? organizationId;

  const UserEntity({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.accountType,
    this.dayOfBirth,
    this.avatarFileUrl,
    this.avatarFileId,
    this.address,
    this.organizationId,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        fullName,
        email,
        phoneNumber,
        gender,
        accountType,
        dayOfBirth,
        avatarFileUrl,
        avatarFileId,
        address,
        organizationId,
      ];

  factory UserEntity.empty() => const UserEntity();

  UserEntity copyWith({
    String? id,
    String? username,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? gender,
    String? accountType,
    String? dayOfBirth,
    String? avatarFileUrl,
    String? avatarFileId,
    String? address,
    String? organizationId,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      accountType: accountType ?? this.accountType,
      dayOfBirth: dayOfBirth ?? this.dayOfBirth,
      avatarFileUrl: avatarFileUrl ?? this.avatarFileUrl,
      avatarFileId: avatarFileId ?? this.avatarFileId,
      address: address ?? this.address,
      organizationId: organizationId ?? this.organizationId,
    );
  }
}
