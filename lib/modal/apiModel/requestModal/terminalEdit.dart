class UpdateTerminalRequestModel {
  String friently_name;
  String station_id;
  String token1;
  String created_at;
  String locked;

  UpdateTerminalRequestModel(
      {this.friently_name,
      this.station_id,
      this.token1,
      this.created_at,
      this.locked});
  Map<String, dynamic> toJson() {
    return {
      'friently_name': friently_name,
      'station_id': station_id,
      'token1': token1,
      'created_at': created_at,
      'locked': locked,
    };
  }
}
