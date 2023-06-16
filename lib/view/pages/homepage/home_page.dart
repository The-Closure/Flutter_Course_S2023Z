import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_and_go/data/local_data/local_storage.dart';
import 'package:plan_and_go/data/user_model/user_model.dart';
import 'package:plan_and_go/view/component/one_grid.dart';
import 'package:plan_and_go/view/component/textfield.dart';
import 'package:plan_and_go/view/res/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/home_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController data = TextEditingController();
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("List", style: TextStyle(fontSize: 32, color: BLACK)),
                myTextField(data),
                Expanded(
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    crossAxisCount: 2,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: OneGrid(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: OneGrid(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: OneGrid(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: OneGrid(),
                      )
                    ],
                  ),
                )
              ],
            ),
            floatingActionButton: InkWell(
              onTap: (){
                myMagic.get<SharedPreferences>().setString('key',data.text);
                // context.read<HomePageBloc>().add(LogIn(userdata: User(usrename: "tareq", password: "123", message: "test")));
              },
                child: Icon(Icons.add_circle_outline,
                    size: 55, color: SecondaryColor)),
          );
        }
      ),
    );
  }
}
