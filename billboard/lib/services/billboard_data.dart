import 'package:billboard/models/models.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class BillboardDataProvider {
  final _baseUrl = 'http://192.168.0.120:8080/api';
  final http.Client httpClient;

  BillboardDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<BoardsForListing> createBoard(BoardsForListing billboard) async {
    final response = await httpClient.post(
      Uri.http('192.168.0.120/api', '/boards'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': billboard.boardID,
        'location': billboard.boardLocation,
        'price': billboard.boardPrice,
        'size': billboard.boardSize,
      }),
    );

    if (response.statusCode == 200) {
      return BoardsForListing.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<BoardsForListing>> getBoardsList() async {
    final response = await httpClient.get('$_baseUrl/boards');

    if (response.statusCode == 200) {
      final boards = jsonDecode(response.body) as List;
      print('success');
      return boards.map((boards) => BoardsForListing.fromJson(boards)).toList();
    } else {
      print('NOT NOW');
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteBoard(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/boards/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateBoard(BoardsForListing billboard) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/boards/${billboard.boardID}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': billboard.boardID,
        'location': billboard.boardLocation,
        'price': billboard.boardPrice,
        'size': billboard.boardSize,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
   Future<List<BoardsForListing>> getBoard(String boardID) async {
    final response = await httpClient.get('$_baseUrl/boards' + boardID,);

    if (response.statusCode == 200) {
      final boards = jsonDecode(response.body) as List;
      print('success');
      return boards.map((boards) => BoardsForListing.fromJson(boards)).toList();
    } else {
      print('NOT NOW');
      throw Exception('Failed to load courses');
    }
  }
   Future<List<RequestsForListing>> getRequestsList() async {
    final response = await httpClient.get('$_baseUrl/requests');

    if (response.statusCode == 200) {
      final requests = jsonDecode(response.body) as List;
      print('success');
      return requests.map((boards) => RequestsForListing.fromJson(boards)).toList();
    } else {
      print('NOT NOW');
      throw Exception('Failed to load courses');
    }
  }
  Future<RequestsForListing> createRequest(RequestsForListing request) async {
    final response = await httpClient.post(
      Uri.http('192.168.0.120/api', '/requests'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'boardId': request.boardID,
        'boardLocation': request.boardLocation,
        'boardPrice': request.boardPrice,
        'boardSize': request.boardSize,
        'userName': request.userName,
        'status': request.status,
      }),
    );

    if (response.statusCode == 200) {
      return RequestsForListing.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }
  Future<void> deleteRequest(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/requests/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }
}
