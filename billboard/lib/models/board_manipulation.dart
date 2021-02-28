import 'package:flutter/foundation.dart';

class BoardManipulation {
  String boardID;
  String boardLocation;
  String boardPrice;
  String boardSize;

  BoardManipulation(
    {
      @required this.boardID,
      @required this.boardLocation,
      @required this.boardPrice,
      @required this.boardSize,
    }
  );

  Map<String, dynamic> toJson() {
    return {
      "id": boardID,
      "location": boardLocation,
      "price": boardPrice,
      "size": boardSize
    };
  }
}