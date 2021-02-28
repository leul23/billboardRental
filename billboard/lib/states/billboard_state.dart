import 'package:billboard/models/models.dart';
import 'package:equatable/equatable.dart';

class BillboardState extends Equatable{
  const BillboardState();

  @override
List<Object> get props => [];
}
class BillboardLoading extends BillboardState {}

class BillboardLoadSuccess extends BillboardState {
  final List<BoardsForListing> billboards;

  BillboardLoadSuccess([this.billboards = const []]);

  @override
  List<Object> get props => [billboards];
}
class BillboardFailure extends BillboardState {}