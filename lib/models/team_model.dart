import 'package:json_annotation/json_annotation.dart';
part 'team_model.g.dart';

@JsonSerializable()
class TeamModel {
  String? idLiveScore;
  String? idEvent;
  String? strSport;
  String? idLeague;
  String? strLeague;
  String? idHomeTeam;
  String? idAwayTeam;
  String? strHomeTeam;
  String? strAwayTeam;
  String? strHomeTeamBadge;
  String? strAwayTeamBadge;
  String? intHomeScore;
  String? intAwayScore;
  String? strStatus;
  String? strProgress;
  String? strEventTime;
  String? dateEvent;
  String? updated;

  TeamModel(
      {this.idLiveScore,
      this.idEvent,
      this.strSport,
      this.idLeague,
      this.strLeague,
      this.idHomeTeam,
      this.idAwayTeam,
      this.strHomeTeam,
      this.strAwayTeam,
      this.strHomeTeamBadge,
      this.strAwayTeamBadge,
      this.intHomeScore,
      this.intAwayScore,
      this.strStatus,
      this.strProgress,
      this.strEventTime,
      this.dateEvent,
      this.updated});

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
