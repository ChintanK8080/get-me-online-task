class AudioData {
  final String audioName;
  final String audioDuration;

  AudioData({required this.audioName, required this.audioDuration});

  factory AudioData.fromJson(Map<String, dynamic> json) => AudioData(
        audioName: json['audioName'] as String,
        audioDuration: json['audioDuration'] as String,
      );

  Map<String, dynamic> toJson() => {
        'audioName': audioName,
        'audioDuration': audioDuration,
      };
}
