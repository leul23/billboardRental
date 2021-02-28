import 'package:meta/meta.dart';
import 'package:billboard/services/services.dart';
import 'package:billboard/models/models.dart';

class RequestRepository {
  final BillboardDataProvider requestlisting;

  RequestRepository({@required this.requestlisting})
  : assert(requestlisting != null);
  Future<List<RequestsForListing>> getRequestsList() async {
    return await requestlisting.getRequestsList();
  }
  Future<RequestsForListing> createRequest(RequestsForListing request) async {
    return await requestlisting.createRequest(request);
  }
  
  Future<void> deleteRequest(String boardID) async {
    return await requestlisting.deleteRequest(boardID);
  }

}