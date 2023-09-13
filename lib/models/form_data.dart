class FormData {
  String? title;
  String? content;
  String? imageUrl;
  String? email;
  bool? isBreaking;
  int? category;

  FormData({
    this.title,
    this.content,
    this.imageUrl,
    this.email,
    this.isBreaking = false,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'email': email,
      'isBreaking': isBreaking,
      'category': category,
    };
  }
}