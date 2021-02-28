import 'package:equatable/equatable.dart';
import 'package:billboard/models/models.dart';

class RequestEvent extends Equatable{
  const RequestEvent();
  @override 
  List<Object> get props => [];

}
class RequestAdd extends RequestEvent {
  final RequestsForListing request;
  const RequestAdd(this.request);

  @override 
  List<Object> get props => [request];
}

class RequestDelete extends RequestEvent {
  final BoardsForListing request;
  const RequestDelete(this.request);

  @override 
  List<Object> get props => [request];
}
class RequestLoad extends RequestEvent {
  const RequestLoad();

  @override
  List<Object> get props => [];
}


class RequestAccept extends RequestEvent {
  final BoardsForListing requests;
  const RequestAccept(this.requests);

  @override 
  List<Object> get props => [requests];
}

class RequestDecline extends RequestEvent {
  final BoardsForListing request;
  const RequestDecline(this.request);

  @override 
  List<Object> get props => [request];
}