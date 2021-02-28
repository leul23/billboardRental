import 'package:flutter/foundation.dart';

class RequestManipulation {
  String boardID;
  String boardLocation;
  String boardPrice;
  String boardSize;
  String userName;
  String status;

  RequestManipulation(
    {
      @required this.boardID,
      @required this.boardLocation,
      @required this.boardPrice,
      @required this.boardSize,
      @required this.userName,
      @required this.status,
    }
  );

  Map<String, dynamic> toJson() {
    return {
      "boardId": boardID,
      "boardLocation": boardLocation,
      "boardPrice": boardPrice,
      "boardSize": boardSize,
      "userName": userName,
      "status": status
    };
  }
}