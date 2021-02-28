import 'package:billboard/bloc/blocs.dart';
import 'package:billboard/events/events.dart';
import 'package:billboard/repository/repository.dart';
import 'package:billboard/screens/screens.dart';
import 'package:billboard/services/services.dart';
import 'package:billboard/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => BoardService());
}
void main() {

Bloc.observer = SimpleBlocObserver();

 final BillboardRepository billboardRepository = BillboardRepository(
   listing: BillboardDataProvider(
     httpClient: http.Client(),
    ),
 );

  setupLocator();
  runApp(
    MyApp(billboardRepository: billboardRepository),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final BillboardRepository billboardRepository;
  final RequestRepository requestRepository;

  

  MyApp({@required this.billboardRepository, this.requestRepository})
  : assert(billboardRepository !=null);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.billboardRepository,
      child: MultiBlocProvider(                    //This addes the billboardbloc and the requestbloc main
        providers: [
          BlocProvider<BillboardBloc>(
        create: (context) => BillboardBloc(billboardRepository: this.billboardRepository)
        ..add(BillboardLoad()),),
          BlocProvider<RequestBloc>(
            create: (context) => RequestBloc(requestRepository: this.requestRepository)
            ..add(RequestLoad()),),
        ],
        child:MaterialApp(
      title: 'Billboard',      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.greenAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    ),
        ),) ;
        
        
        

      
      
      
   
  }
}
