class Authentication {
  final String _announcemenetType;
  final String _announcementText;
  final String _announcementPublisher;
  final String _announcementColor;

  // Kurucu (Constructor)
  Authentication({
    required String announcementType,
    required String announcementText,
    required String announcementPublisher,
    required String announcementColor,
  })  : _announcemenetType = announcementType,
        _announcementText = announcementText,
        _announcementPublisher = announcementPublisher,
        _announcementColor = announcementColor;

  // Getter'lar
  String get announcemenetType => _announcemenetType;
  String get announcementText => _announcementText;
  String get announcementPublisher => _announcementPublisher;
  String get announcementColor => _announcementColor;

  // JSON'dan nesne oluşturma metodu
  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      announcementType: json['announcementType'],
      announcementText: json['announcementText'],
      announcementPublisher: json['announcementPublisher'],
      announcementColor: json['announcementColor'],
    );
  }

  // Nesneden JSON oluşturma metodu
  Map<String, dynamic> toJson() {
    return {
      'announcementId': _announcemenetType,
      'announcementText': _announcementText,
      'announcementPublisher': _announcementPublisher,
      'announcementColor': _announcementColor,
    };
  }
}
