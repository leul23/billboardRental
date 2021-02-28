import 'package:billboard/models/models.dart';
import 'package:equatable/equatable.dart';

class BillboardEvent extends Equatable{
  const BillboardEvent();
  @override 
  List<Object> get props => [];

}
class BillboardAdd extends BillboardEvent {
  final BoardsForListing billboard;
  const BillboardAdd(this.billboard);

  @override 
  List<Object> get props => [billboard];
}
class BillboardRent extends BillboardEvent {
  final BoardsForListing billboards;
  const BillboardRent(this.billboards);

  @override 
  List<Object> get props => [billboards];
}
class BillboardDelete extends BillboardEvent {
  final BoardsForListing billboard;
  const BillboardDelete(this.billboard);

  @override 
  List<Object> get props => [billboard];
}
class BillboardLoad extends BillboardEvent {
  const BillboardLoad();

  @override
  List<Object> get props => [];
}
class BillboardEdit extends BillboardEvent {
  final BoardsForListing billboard;
  const BillboardEdit(this.billboard);

  @override 
  List<Object> get props => [billboard];
}

class BillboardAccept extends BillboardEvent {
  final BoardsForListing billboards;
  const BillboardAccept(this.billboards);

  @override 
  List<Object> get props => [billboards];
}

class BillboardDecline extends BillboardEvent {
  final BoardsForListing billboards;
  const BillboardDecline(this.billboards);

  @override 
  List<Object> get props => [billboards];
}