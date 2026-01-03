final class Quota {
  final int usedMinutes;
  final int limitMinutes;
  final int remainingMinutes;
  final DateTime? resetDate;

  const Quota({
    required this.usedMinutes,
    required this.limitMinutes,
    required this.remainingMinutes,
    this.resetDate,
  });

  factory Quota.fromJson(Map<String, dynamic> json) {
    return Quota(
      usedMinutes: json['usedMinutes'] as int,
      limitMinutes: json['limitMinutes'] as int,
      remainingMinutes: json['remainingMinutes'] as int,
      resetDate:
          json['resetDate'] != null ? DateTime.parse(json['resetDate']) : null,
    );
  }

  bool get isExceeded => remainingMinutes <= 0;
}
