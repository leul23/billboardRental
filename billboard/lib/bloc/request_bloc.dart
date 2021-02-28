import 'package:billboard/events/events.dart';
import 'package:billboard/repository/repository.dart';
import 'package:billboard/states/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestRepository requestRepository;

  RequestBloc({@required this.requestRepository})
  : assert(requestRepository != null),
    super(RequestLoading());
  

  @override 
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if(event is RequestLoad) {
      yield RequestLoading();
      
        final requests = await requestRepository.getRequestsList();
        yield RequestLoadSuccess(requests);
      
    }

    if (event is RequestAdd) {
      try {
        await requestRepository.createRequest(event.request);
        final requests = await requestRepository.getRequestsList();
        yield RequestLoadSuccess(requests);
      } catch (_) {
        yield RequestFailure();
      }
    }
    
    if (event is RequestDelete) {
      try {
        await requestRepository.deleteRequest(event.request.boardID);
        final requests = await requestRepository.getRequestsList();
        yield RequestLoadSuccess(requests);
      } catch (_) {
        yield RequestFailure();
      }
    
    }
    if (event is RequestAccept) {}
    if (event is RequestDecline) {}
    
  }

}