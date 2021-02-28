class BoardsForListing {
  String boardID;
  String boardLocation;
  String boardPrice;
  String boardSize;
  
  BoardsForListing({this.boardID, this.boardLocation, this.boardPrice, this.boardSize});

  factory BoardsForListing.fromJson(Map<String, dynamic> item) {
    return BoardsForListing(
      boardID: item['id'],
      boardLocation: item['location'],
      boardPrice: item['price'],
      boardSize: item['size'],
    );
  }
}
