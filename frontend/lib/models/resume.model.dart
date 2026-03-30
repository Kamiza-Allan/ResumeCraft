class Resume {
  final int id;
  final String title;
  final Map<String, dynamic> content;
  final String templateName;

  Resume({
    required this.id,
    required this.title,
    required this.content,
    required this.templateName,
  });

  // This "factory" converts the JSON from our Django API into a Dart Object
  factory Resume.fromJson(Map<String, dynamic> json) {
    return Resume(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      templateName: json['template_name'],
    );
  }
}