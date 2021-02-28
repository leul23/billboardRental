
class RequestsForListing {
  String boardID;
  String boardLocation;
  String boardPrice;
  String boardSize;
  String userName;
  String status;
  
  RequestsForListing({this.boardID, this.boardLocation, this.boardPrice, this.boardSize, this.userName, this.status});

  factory RequestsForListing.fromJson(Map<String, dynamic> item) {
    return RequestsForListing(
      boardID: item['boardId'],
      boardLocation: item['boardLocation'],
      boardPrice: item['boardPrice'],
      boardSize: item['boardSize'],
      userName: item['userName'],
      status: item['status'],
    );
  }
}
