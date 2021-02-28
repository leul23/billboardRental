import 'package:billboard/events/events.dart';
import 'package:billboard/repository/repository.dart';
import 'package:billboard/states/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BillboardBloc extends Bloc<BillboardEvent, BillboardState> {
  final BillboardRepository billboardRepository;

  BillboardBloc({@required this.billboardRepository})
  : assert(billboardRepository != null),
    super(BillboardLoading());
  

  @override 
  Stream<BillboardState> mapEventToState(BillboardEvent event) async* {
    if(event is BillboardLoad) {
      yield BillboardLoading();
      
        final billboards = await billboardRepository.getBoardsList();
        yield BillboardLoadSuccess(billboards);
      
    }

    if (event is BillboardAdd) {
      try {
        await billboardRepository.createBoardsList(event.billboard);
        final billboards = await billboardRepository.getBoardsList();
        yield BillboardLoadSuccess(billboards);
      } catch (_) {
        yield BillboardFailure();
      }
    }
    if (event is BillboardRent) {}
    if (event is BillboardDelete) {
      try {
        await billboardRepository.deleteBoardsList(event.billboard.boardID);
        final billboards = await billboardRepository.getBoardsList();
        yield BillboardLoadSuccess(billboards);
      } catch (_) {
        yield BillboardFailure();
      }
    
    }
    if (event is BillboardAccept) {}
    if (event is BillboardDecline) {}
    if (event is BillboardEdit) {
      try {
        await billboardRepository.updateBoardsList(event.billboard);
        final billboards = await billboardRepository.getBoardsList();
        yield BillboardLoadSuccess(billboards);
      } catch (_) {
        yield BillboardFailure();
      }
    }



  }

}