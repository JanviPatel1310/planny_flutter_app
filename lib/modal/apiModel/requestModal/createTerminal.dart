class CreateTerminalRequestModel {
  String friently_name;
  String station_id;
  String token1;
  String locked;

  CreateTerminalRequestModel(
      {this.friently_name, this.station_id, this.token1, this.locked});
  Map<String, dynamic> toJson() {
    return {
      'friently_name': friently_name,
      'station_id': station_id,
      'token1': token1,
      'locked': locked,
    };
  }
}
