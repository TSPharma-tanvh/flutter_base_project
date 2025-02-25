// // To parse this JSON data, do
// //
// //     final imagesListModel = imagesListModelFromJson(jsonString);

// import 'dart:convert';

// ImagesListModel imagesListModelFromJson(String str) => ImagesListModel.fromJson(json.decode(str));

// String imagesListModelToJson(ImagesListModel data) => json.encode(data.toJson());

// class ImagesListModel {
//     int total;
//     int totalPages;
//     List<Result> results;

//     ImagesListModel({
//         this.total,
//         this.totalPages,
//         this.results,
//     });

//     factory ImagesListModel.fromJson(Map<String, dynamic> json) => new ImagesListModel(
//         total: json["total"] == null ? null : json["total"],
//         totalPages: json["total_pages"] == null ? null : json["total_pages"],
//         results: json["results"] == null ? null : new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "total": total == null ? null : total,
//         "total_pages": totalPages == null ? null : totalPages,
//         "results": results == null ? null : new List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class Result {
//     String id;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int width;
//     int height;
//     String color;
//     String description;
//     String altDescription;
//     Urls urls;
//     ResultLinks links;
//     List<dynamic> categories;
//     int likes;
//     bool likedByUser;
//     List<dynamic> currentUserCollections;
//     User user;
//     List<Tag> tags;

//     Result({
//         this.id,
//         this.createdAt,
//         this.updatedAt,
//         this.width,
//         this.height,
//         this.color,
//         this.description,
//         this.altDescription,
//         this.urls,
//         this.links,
//         this.categories,
//         this.likes,
//         this.likedByUser,
//         this.currentUserCollections,
//         this.user,
//         this.tags,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => new Result(
//         id: json["id"] == null ? null : json["id"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//         width: json["width"] == null ? null : json["width"],
//         height: json["height"] == null ? null : json["height"],
//         color: json["color"] == null ? null : json["color"],
//         description: json["description"] == null ? null : json["description"],
//         altDescription: json["alt_description"] == null ? null : json["alt_description"],
//         urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
//         links: json["links"] == null ? null : ResultLinks.fromJson(json["links"]),
//         categories: json["categories"] == null ? null : new List<dynamic>.from(json["categories"].map((x) => x)),
//         likes: json["likes"] == null ? null : json["likes"],
//         likedByUser: json["liked_by_user"] == null ? null : json["liked_by_user"],
//         currentUserCollections: json["current_user_collections"] == null ? null : new List<dynamic>.from(json["current_user_collections"].map((x) => x)),
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//         tags: json["tags"] == null ? null : new List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "created_at": createdAt == null ? null : createdAt.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
//         "width": width == null ? null : width,
//         "height": height == null ? null : height,
//         "color": color == null ? null : color,
//         "description": description == null ? null : description,
//         "alt_description": altDescription == null ? null : altDescription,
//         "urls": urls == null ? null : urls.toJson(),
//         "links": links == null ? null : links.toJson(),
//         "categories": categories == null ? null : new List<dynamic>.from(categories.map((x) => x)),
//         "likes": likes == null ? null : likes,
//         "liked_by_user": likedByUser == null ? null : likedByUser,
//         "current_user_collections": currentUserCollections == null ? null : new List<dynamic>.from(currentUserCollections.map((x) => x)),
//         "user": user == null ? null : user.toJson(),
//         "tags": tags == null ? null : new List<dynamic>.from(tags.map((x) => x.toJson())),
//     };
// }

// class ResultLinks {
//     String self;
//     String html;
//     String download;
//     String downloadLocation;

//     ResultLinks({
//         this.self,
//         this.html,
//         this.download,
//         this.downloadLocation,
//     });

//     factory ResultLinks.fromJson(Map<String, dynamic> json) => new ResultLinks(
//         self: json["self"] == null ? null : json["self"],
//         html: json["html"] == null ? null : json["html"],
//         download: json["download"] == null ? null : json["download"],
//         downloadLocation: json["download_location"] == null ? null : json["download_location"],
//     );

//     Map<String, dynamic> toJson() => {
//         "self": self == null ? null : self,
//         "html": html == null ? null : html,
//         "download": download == null ? null : download,
//         "download_location": downloadLocation == null ? null : downloadLocation,
//     };
// }

// class Tag {
//     String title;

//     Tag({
//         this.title,
//     });

//     factory Tag.fromJson(Map<String, dynamic> json) => new Tag(
//         title: json["title"] == null ? null : json["title"],
//     );

//     Map<String, dynamic> toJson() => {
//         "title": title == null ? null : title,
//     };
// }

// class Urls {
//     String raw;
//     String full;
//     String regular;
//     String small;
//     String thumb;

//     Urls({
//         this.raw,
//         this.full,
//         this.regular,
//         this.small,
//         this.thumb,
//     });

//     factory Urls.fromJson(Map<String, dynamic> json) => new Urls(
//         raw: json["raw"] == null ? null : json["raw"],
//         full: json["full"] == null ? null : json["full"],
//         regular: json["regular"] == null ? null : json["regular"],
//         small: json["small"] == null ? null : json["small"],
//         thumb: json["thumb"] == null ? null : json["thumb"],
//     );

//     Map<String, dynamic> toJson() => {
//         "raw": raw == null ? null : raw,
//         "full": full == null ? null : full,
//         "regular": regular == null ? null : regular,
//         "small": small == null ? null : small,
//         "thumb": thumb == null ? null : thumb,
//     };
// }

// class User {
//     String id;
//     DateTime updatedAt;
//     String username;
//     String name;
//     String firstName;
//     String lastName;
//     String twitterUsername;
//     String portfolioUrl;
//     String bio;
//     String location;
//     UserLinks links;
//     ProfileImage profileImage;
//     String instagramUsername;
//     int totalCollections;
//     int totalLikes;
//     int totalPhotos;
//     bool acceptedTos;

//     User({
//         this.id,
//         this.updatedAt,
//         this.username,
//         this.name,
//         this.firstName,
//         this.lastName,
//         this.twitterUsername,
//         this.portfolioUrl,
//         this.bio,
//         this.location,
//         this.links,
//         this.profileImage,
//         this.instagramUsername,
//         this.totalCollections,
//         this.totalLikes,
//         this.totalPhotos,
//         this.acceptedTos,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => new User(
//         id: json["id"] == null ? null : json["id"],
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//         username: json["username"] == null ? null : json["username"],
//         name: json["name"] == null ? null : json["name"],
//         firstName: json["first_name"] == null ? null : json["first_name"],
//         lastName: json["last_name"] == null ? null : json["last_name"],
//         twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
//         portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
//         bio: json["bio"] == null ? null : json["bio"],
//         location: json["location"] == null ? null : json["location"],
//         links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
//         profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
//         instagramUsername: json["instagram_username"] == null ? null : json["instagram_username"],
//         totalCollections: json["total_collections"] == null ? null : json["total_collections"],
//         totalLikes: json["total_likes"] == null ? null : json["total_likes"],
//         totalPhotos: json["total_photos"] == null ? null : json["total_photos"],
//         acceptedTos: json["accepted_tos"] == null ? null : json["accepted_tos"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
//         "username": username == null ? null : username,
//         "name": name == null ? null : name,
//         "first_name": firstName == null ? null : firstName,
//         "last_name": lastName == null ? null : lastName,
//         "twitter_username": twitterUsername == null ? null : twitterUsername,
//         "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
//         "bio": bio == null ? null : bio,
//         "location": location == null ? null : location,
//         "links": links == null ? null : links.toJson(),
//         "profile_image": profileImage == null ? null : profileImage.toJson(),
//         "instagram_username": instagramUsername == null ? null : instagramUsername,
//         "total_collections": totalCollections == null ? null : totalCollections,
//         "total_likes": totalLikes == null ? null : totalLikes,
//         "total_photos": totalPhotos == null ? null : totalPhotos,
//         "accepted_tos": acceptedTos == null ? null : acceptedTos,
//     };
// }

// class UserLinks {
//     String self;
//     String html;
//     String photos;
//     String likes;
//     String portfolio;
//     String following;
//     String followers;

//     UserLinks({
//         this.self,
//         this.html,
//         this.photos,
//         this.likes,
//         this.portfolio,
//         this.following,
//         this.followers,
//     });

//     factory UserLinks.fromJson(Map<String, dynamic> json) => new UserLinks(
//         self: json["self"] == null ? null : json["self"],
//         html: json["html"] == null ? null : json["html"],
//         photos: json["photos"] == null ? null : json["photos"],
//         likes: json["likes"] == null ? null : json["likes"],
//         portfolio: json["portfolio"] == null ? null : json["portfolio"],
//         following: json["following"] == null ? null : json["following"],
//         followers: json["followers"] == null ? null : json["followers"],
//     );

//     Map<String, dynamic> toJson() => {
//         "self": self == null ? null : self,
//         "html": html == null ? null : html,
//         "photos": photos == null ? null : photos,
//         "likes": likes == null ? null : likes,
//         "portfolio": portfolio == null ? null : portfolio,
//         "following": following == null ? null : following,
//         "followers": followers == null ? null : followers,
//     };
// }

// class ProfileImage {
//     String small;
//     String medium;
//     String large;

//     ProfileImage({
//         this.small,
//         this.medium,
//         this.large,
//     });

//     factory ProfileImage.fromJson(Map<String, dynamic> json) => new ProfileImage(
//         small: json["small"] == null ? null : json["small"],
//         medium: json["medium"] == null ? null : json["medium"],
//         large: json["large"] == null ? null : json["large"],
//     );

//     Map<String, dynamic> toJson() => {
//         "small": small == null ? null : small,
//         "medium": medium == null ? null : medium,
//         "large": large == null ? null : large,
//     };
// }
import 'dart:convert';

ImagesListModel imagesListModelFromJson(String str) =>
    ImagesListModel.fromJson(json.decode(str));

String imagesListModelToJson(ImagesListModel data) =>
    json.encode(data.toJson());

class ImagesListModel {
  final int total;
  final int totalPages;
  final List<Result> results;

  ImagesListModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory ImagesListModel.fromJson(Map<String, dynamic> json) =>
      ImagesListModel(
        total: json["total"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        results: (json["results"] as List<dynamic>?)
                ?.map((x) => Result.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": results.map((x) => x.toJson()).toList(),
      };
}

class Result {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int width;
  final int height;
  final String color;
  final String? description;
  final String? altDescription;
  final Urls urls;
  final ResultLinks links;
  final List<String> categories;
  final int likes;
  final bool likedByUser;
  final List<String> currentUserCollections;
  final User user;
  final List<Tag> tags;

  Result({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    this.description,
    this.altDescription,
    required this.urls,
    required this.links,
    required this.categories,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.user,
    required this.tags,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? "",
        createdAt: DateTime.parse(json["created_at"] ?? ""),
        updatedAt: DateTime.parse(json["updated_at"] ?? ""),
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
        color: json["color"] ?? "",
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"] ?? {}),
        links: ResultLinks.fromJson(json["links"] ?? {}),
        categories:
            (json["categories"] as List<dynamic>?)?.cast<String>() ?? [],
        likes: json["likes"] ?? 0,
        likedByUser: json["liked_by_user"] ?? false,
        currentUserCollections:
            (json["current_user_collections"] as List<dynamic>?)
                    ?.cast<String>() ??
                [],
        user: User.fromJson(json["user"] ?? {}),
        tags: (json["tags"] as List<dynamic>?)
                ?.map((x) => Tag.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": categories,
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections,
        "user": user.toJson(),
        "tags": tags.map((x) => x.toJson()).toList(),
      };
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"] ?? "",
        full: json["full"] ?? "",
        regular: json["regular"] ?? "",
        small: json["small"] ?? "",
        thumb: json["thumb"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}

class ResultLinks {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  ResultLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"] ?? "",
        html: json["html"] ?? "",
        download: json["download"] ?? "",
        downloadLocation: json["download_location"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Tag {
  final String title;

  Tag({required this.title});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {"title": title};
}

class User {
  final String id;
  final String username;
  final String name;
  final UserLinks links;
  final ProfileImage profileImage;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.links,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? "",
        username: json["username"] ?? "",
        name: json["name"] ?? "",
        links: UserLinks.fromJson(json["links"] ?? {}),
        profileImage: ProfileImage.fromJson(json["profile_image"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
      };
}

class UserLinks {
  final String self;
  final String html;
  final String photos;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"] ?? "",
        html: json["html"] ?? "",
        photos: json["photos"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
      };
}

class ProfileImage {
  final String small;
  final String medium;
  final String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"] ?? "",
        medium: json["medium"] ?? "",
        large: json["large"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}
