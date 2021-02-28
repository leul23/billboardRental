import 'package:meta/meta.dart';
import 'package:billboard/models/models.dart';
import 'package:billboard/services/services.dart';
//import 'package:billboard/models/api_response.dart';

class BillboardRepository {
  final BillboardDataProvider listing;

  BillboardRepository({@required this.listing})
  : assert(listing != null);
  Future<List<BoardsForListing>> getBoardsList() async {
    return await listing.getBoardsList();
  }
  Future<BoardsForListing> createBoardsList(BoardsForListing billboard) async {
    return await listing.createBoard(billboard);
  }
  Future<void> updateBoardsList(BoardsForListing billboard) async {
    return await listing.updateBoard(billboard);
  }
  Future<void> deleteBoardsList(String boardID) async {
    return await listing.deleteBoard(boardID);
  }

}