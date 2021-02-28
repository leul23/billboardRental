class Board {
  String boardID;
  String boardLocation;
  String boardPrice;
  String boardSize;
  
  Board({this.boardID, this.boardLocation, this.boardPrice, this.boardSize});

  factory Board.fromJson(Map<String, dynamic> item) {
    return Board(
      boardID: item['id'],
      boardLocation: item['location'],
      boardPrice: item['price'],
      boardSize: item['size'],
    );
  }
}