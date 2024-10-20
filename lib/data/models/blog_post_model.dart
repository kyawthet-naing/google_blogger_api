class BlogPostModel {
  final String? kind;
  final String? id;
  final Blog? blog;
  final String? published;
  final String? updated;
  final String? url;
  final String? selfLink;
  final String? title;
  final String? content;
  final Author? author;
  final Replies? replies;
  final String? etag;

  BlogPostModel({
    this.kind,
    this.id,
    this.blog,
    this.published,
    this.updated,
    this.url,
    this.selfLink,
    this.title,
    this.content,
    this.author,
    this.replies,
    this.etag,
  });

  BlogPostModel copyWith({
    String? kind,
    String? id,
    Blog? blog,
    String? published,
    String? updated,
    String? url,
    String? selfLink,
    String? title,
    String? content,
    Author? author,
    Replies? replies,
    String? etag,
  }) {
    return BlogPostModel(
      kind: kind ?? this.kind,
      id: id ?? this.id,
      blog: blog ?? this.blog,
      published: published ?? this.published,
      updated: updated ?? this.updated,
      url: url ?? this.url,
      selfLink: selfLink ?? this.selfLink,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author,
      replies: replies ?? this.replies,
      etag: etag ?? this.etag,
    );
  }

  BlogPostModel.fromJson(Map<String, dynamic> json)
    : kind = json['kind'] as String?,
      id = json['id'] as String?,
      blog = (json['blog'] as Map<String,dynamic>?) != null ? Blog.fromJson(json['blog'] as Map<String,dynamic>) : null,
      published = json['published'] as String?,
      updated = json['updated'] as String?,
      url = json['url'] as String?,
      selfLink = json['selfLink'] as String?,
      title = json['title'] as String?,
      content = json['content'] as String?,
      author = (json['author'] as Map<String,dynamic>?) != null ? Author.fromJson(json['author'] as Map<String,dynamic>) : null,
      replies = (json['replies'] as Map<String,dynamic>?) != null ? Replies.fromJson(json['replies'] as Map<String,dynamic>) : null,
      etag = json['etag'] as String?;

  Map<String, dynamic> toJson() => {
    'kind' : kind,
    'id' : id,
    'blog' : blog?.toJson(),
    'published' : published,
    'updated' : updated,
    'url' : url,
    'selfLink' : selfLink,
    'title' : title,
    'content' : content,
    'author' : author?.toJson(),
    'replies' : replies?.toJson(),
    'etag' : etag
  };
}

class Blog {
  final String? id;

  Blog({
    this.id,
  });

  Blog copyWith({
    String? id,
  }) {
    return Blog(
      id: id ?? this.id,
    );
  }

  Blog.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id
  };
}

class Author {
  final String? id;
  final String? displayName;
  final String? url;
  final Image? image;

  Author({
    this.id,
    this.displayName,
    this.url,
    this.image,
  });

  Author copyWith({
    String? id,
    String? displayName,
    String? url,
    Image? image,
  }) {
    return Author(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      url: url ?? this.url,
      image: image ?? this.image,
    );
  }

  Author.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?,
      displayName = json['displayName'] as String?,
      url = json['url'] as String?,
      image = (json['image'] as Map<String,dynamic>?) != null ? Image.fromJson(json['image'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'displayName' : displayName,
    'url' : url,
    'image' : image?.toJson()
  };
}

class Image {
  final String? url;

  Image({
    this.url,
  });

  Image copyWith({
    String? url,
  }) {
    return Image(
      url: url ?? this.url,
    );
  }

  Image.fromJson(Map<String, dynamic> json)
    : url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'url' : url
  };
}

class Replies {
  final String? totalItems;
  final String? selfLink;

  Replies({
    this.totalItems,
    this.selfLink,
  });

  Replies copyWith({
    String? totalItems,
    String? selfLink,
  }) {
    return Replies(
      totalItems: totalItems ?? this.totalItems,
      selfLink: selfLink ?? this.selfLink,
    );
  }

  Replies.fromJson(Map<String, dynamic> json)
    : totalItems = json['totalItems'] as String?,
      selfLink = json['selfLink'] as String?;

  Map<String, dynamic> toJson() => {
    'totalItems' : totalItems,
    'selfLink' : selfLink
  };
}