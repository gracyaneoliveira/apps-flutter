import 'package:bloc/increment/increment-controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class PackageService {

  final IncrementController bloc = BlocProvider.getBloc<IncrementController>();

  showValue(){
    print("MEU SHOW");
    bloc.outCounter.listen((data){
      print("MEU OUT > $data");
    });
  }
}