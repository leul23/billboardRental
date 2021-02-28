import 'package:billboard/models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BoardService {
  static const API = 'http://192.168.0.120:8080/api';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<List<BoardsForListing>>> getBoardsList() {
    return http.get(API + '/boards', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final boards = <BoardsForListing>[];
        for (var item in jsonData) {
          boards.add(BoardsForListing.fromJson(item));
        }
        return APIResponse<List<BoardsForListing>>(data: boards);
      }
      return APIResponse<List<BoardsForListing>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<BoardsForListing>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Board>> getBoard(String boardID) {
    return http.get(API + '/boards/' + boardID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Board>(data: Board.fromJson(jsonData));
      }
      return APIResponse<Board>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<Board>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createBoard(BoardManipulation item) {
    return http.post(API + '/boards', headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateBoard(String boardID, BoardManipulation item) {
    return http.put(API + '/boards/' + boardID, headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

 Future<APIResponse<bool>> deleteBoard(String boardID) {
    return http.delete(API + '/boards/' + boardID, headers: headers).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<List<RequestsForListing>>> getRequestsList() {
    return http.get(API + '/requests', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final requests = <RequestsForListing>[];
        for (var item in jsonData) {
          requests.add(RequestsForListing.fromJson(item));
        }
        return APIResponse<List<RequestsForListing>>(data: requests);
      }
      return APIResponse<List<RequestsForListing>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<RequestsForListing>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createRequest(RequestManipulation item) {
    return http.post(API + '/requests', headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

 Future<APIResponse<bool>> deleteRequest(String boardID2) {
    return http.delete(API + '/requests/' + boardID2, headers: headers).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateRequest(String boardID2, RequestManipulation item) {
    return http.put(API + '/requests/' + boardID2, headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
  
  Future<APIResponse<Request>> getRequest(String boardID2) {
    return http.get(API + '/requests/' + boardID2, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Request>(data: Request.fromJson(jsonData));
      }
      return APIResponse<Request>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<Request>(error: true, errorMessage: 'An error occured'));
  }
}