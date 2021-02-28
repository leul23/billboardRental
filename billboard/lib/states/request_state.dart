import 'package:equatable/equatable.dart';
import 'package:billboard/models/models.dart';

class RequestState extends Equatable{
  const RequestState();

  @override
List<Object> get props => [];
}
class RequestLoading extends RequestState {}

class RequestLoadSuccess extends RequestState {
  final List<RequestsForListing> requests;

  RequestLoadSuccess([this.requests = const []]);

  @override
  List<Object> get props => [requests];
}
class RequestFailure extends RequestState {}