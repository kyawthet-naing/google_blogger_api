class BlogModel {
  final String? kind;
  final String? id;
  final String? status;
  final String? name;
  final String? description;
  final String? published;
  final String? updated;
  final String? url;
  final String? selfLink;
  final Posts? posts;
  final Pages? pages;
  final Locale? locale;

  BlogModel({
    this.kind,
    this.id,
    this.status,
    this.name,
    this.description,
    this.published,
    this.updated,
    this.url,
    this.selfLink,
    this.posts,
    this.pages,
    this.locale,
  });

  BlogModel copyWith({
    String? kind,
    String? id,
    String? status,
    String? name,
    String? description,
    String? published,
    String? updated,
    String? url,
    String? selfLink,
    Posts? posts,
    Pages? pages,
    Locale? locale,
  }) {
    return BlogModel(
      kind: kind ?? this.kind,
      id: id ?? this.id,
      status: status ?? this.status,
      name: name ?? this.name,
      description: description ?? this.description,
      published: published ?? this.published,
      updated: updated ?? this.updated,
      url: url ?? this.url,
      selfLink: selfLink ?? this.selfLink,
      posts: posts ?? this.posts,
      pages: pages ?? this.pages,
      locale: locale ?? this.locale,
    );
  }

  BlogModel.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        id = json['id'] as String?,
        status = json['status'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        published = json['published'] as String?,
        updated = json['updated'] as String?,
        url = json['url'] as String?,
        selfLink = json['selfLink'] as String?,
        posts = (json['posts'] as Map<String, dynamic>?) != null
            ? Posts.fromJson(json['posts'] as Map<String, dynamic>)
            : null,
        pages = (json['pages'] as Map<String, dynamic>?) != null
            ? Pages.fromJson(json['pages'] as Map<String, dynamic>)
            : null,
        locale = (json['locale'] as Map<String, dynamic>?) != null
            ? Locale.fromJson(json['locale'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'status': status,
        'name': name,
        'description': description,
        'published': published,
        'updated': updated,
        'url': url,
        'selfLink': selfLink,
        'posts': posts?.toJson(),
        'pages': pages?.toJson(),
        'locale': locale?.toJson()
      };
}

class Posts {
  final int? totalItems;
  final String? selfLink;

  Posts({
    this.totalItems,
    this.selfLink,
  });

  Posts copyWith({
    int? totalItems,
    String? selfLink,
  }) {
    return Posts(
      totalItems: totalItems ?? this.totalItems,
      selfLink: selfLink ?? this.selfLink,
    );
  }

  Posts.fromJson(Map<String, dynamic> json)
      : totalItems = json['totalItems'] as int?,
        selfLink = json['selfLink'] as String?;

  Map<String, dynamic> toJson() =>
      {'totalItems': totalItems, 'selfLink': selfLink};
}

class Pages {
  final int? totalItems;
  final String? selfLink;

  Pages({
    this.totalItems,
    this.selfLink,
  });

  Pages copyWith({
    int? totalItems,
    String? selfLink,
  }) {
    return Pages(
      totalItems: totalItems ?? this.totalItems,
      selfLink: selfLink ?? this.selfLink,
    );
  }

  Pages.fromJson(Map<String, dynamic> json)
      : totalItems = json['totalItems'] as int?,
        selfLink = json['selfLink'] as String?;

  Map<String, dynamic> toJson() =>
      {'totalItems': totalItems, 'selfLink': selfLink};
}

class Locale {
  final String? language;
  final String? country;
  final String? variant;

  Locale({
    this.language,
    this.country,
    this.variant,
  });

  Locale copyWith({
    String? language,
    String? country,
    String? variant,
  }) {
    return Locale(
      language: language ?? this.language,
      country: country ?? this.country,
      variant: variant ?? this.variant,
    );
  }

  Locale.fromJson(Map<String, dynamic> json)
      : language = json['language'] as String?,
        country = json['country'] as String?,
        variant = json['variant'] as String?;

  Map<String, dynamic> toJson() =>
      {'language': language, 'country': country, 'variant': variant};
}
