class Request {
  String boardID;
  String boardLocation;
  String boardPrice;
  String boardSize;
  String userName;
  String status;
  
  Request({this.boardID, this.boardLocation, this.boardPrice, this.boardSize, this.userName, this.status});

  factory Request.fromJson(Map<String, dynamic> item) {
    return Request(
      boardID: item['boardId'],
      boardLocation: item['boardLocation'],
      boardPrice: item['boardPrice'],
      boardSize: item['boardSize'],
      userName: item['userName'],
      status: item['status'],
    );
  }
}