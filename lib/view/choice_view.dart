import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../res/color.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model.dart';

class ChoiceView extends StatefulWidget {
  const ChoiceView({Key? key}) : super(key: key);

  @override
  State<ChoiceView> createState() => _ChoiceViewState();
}

class _ChoiceViewState extends State<ChoiceView> {

  List<dynamic> cities = [];
  List<dynamic> placesMasters = [];
  List<dynamic> places = [];
  List<dynamic> ages = [];

  String? cityId;
  String? placeId;
  String? ageId;


  @override
  void initState() {
    super.initState();

    cities.add({"id": 1, "name":"Kathmandu"});
    cities.add({"id": 2, "name":"Pokhara"});
    ages.add({"id": 3, "name": "under 15"});
    ages.add({"id": 4, "name": "between 15 to 64"});
    ages.add({"id": 5, "name": "above 65"});

    placesMasters = [
      {"ID": 1, "Name":"Pashupatinath", "ParentId": 1},
      {"ID": 2, "Name":"Syambhunath", "ParentId": 1},
      {"ID": 3, "Name":"Boudhanath stupa", "ParentId": 1},
      {"ID": 4, "Name":"Thamel", "ParentId": 1},
      {"ID": 5, "Name":"Kathmandu Durbar Square", "ParentId": 1},
      {"ID": 6, "Name":"kapan Monastry", "ParentId": 1},
      {"ID": 7, "Name":"Garden of Dreams", "ParentId": 1},
      {"ID": 8, "Name":"Crematoria", "ParentId": 1},
      {"ID": 9, "Name":"Shanti Yoga academy", "ParentId": 1},
      {"ID": 10, "Name":"Budhanilkantha", "ParentId": 1},
      {"ID": 11, "Name":"Saga", "ParentId": 1},
      {"ID": 12, "Name":"Godawari", "ParentId": 1},
      {"ID": 13, "Name":"Shivpuri Park", "ParentId": 1},
      {"ID": 1, "Name":"Fewa Lake", "ParentId": 2},
      {"ID": 2, "Name":"Mahendra Gufa", "ParentId": 2},
      {"ID": 3, "Name":"Devis Fall", "ParentId": 2},
      {"ID": 4, "Name":"pundi cot", "ParentId": 2},
      {"ID": 5, "Name":"Chamero Gufa", "ParentId": 2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          elevation: 0,
          title: const Text("Data Collection",style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: InkWell(
                onTap: (){
                  userPreference.remove().then((value){
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: const Text('Logout'),
              ),
            ),
            const SizedBox(width: 20,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20 ),
          child: Column(
            children: [
              FormHelper.dropDownWidgetWithLabel(
                  context,
                  "City you'd like to visit",
                  "Select City",
                  cityId,
                  cities,
                  (onChangedVal){
                    setState(() {
                    cityId = onChangedVal;
                    print("selected City: $onChangedVal");

                    places = placesMasters.where(
                        (stateItem) =>
                            stateItem["ParentId"].toString() ==
                        onChangedVal.toString(),
                    ).toList();
                    // print(places);
                    placeId = null;
                    });
                  },
                  (onValidateVal){
                    if(onValidateVal == null){
                      return "Please Select City";
                    }
                    return null;
                  },
                  borderColor: Theme.of(context).primaryColor,
                  borderFocusColor: Theme.of(context).primaryColor,
                  borderRadius: 10,
              ),
              const SizedBox(height: 20,),
              FormHelper.dropDownWidgetWithLabel(
                  context,
                  "Kind of Place you like",
                  "select Place",
                  placeId,
                  places,
                  (onChangedVal){
                    placeId = onChangedVal;
                    print("Selected Place : $onChangedVal");
                  },
                  (onValidate){
                    return null;
                  },
                  borderColor: Theme.of(context).primaryColor,
                  borderFocusColor: Theme.of(context).primaryColor,
                  borderRadius: 10,
                  optionValue: "ID",
                  optionLabel: "Name",
              ),
              const SizedBox(height: 20,),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Age Group",
                "select age group",
                ageId,
                ages,
                    (onChangedVal){
                  ageId = onChangedVal;
                  print("Selected age : $onChangedVal");
                },
                    (onValidate){
                  if(onValidate == null){
                    return "Please select age group";
                  }
                  return null;
                },
                borderColor: Theme.of(context).primaryColor,
                borderFocusColor: Theme.of(context).primaryColor,
                borderRadius: 10,
              ),
              const SizedBox(height: 20,),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Last Place you visited",
                "select Place",
                placeId,
                places,
                    (onChangedVal){
                  placeId = onChangedVal;
                  print("Selected Place : $onChangedVal");
                },
                    (onValidate){
                  return null;
                },
                borderColor: Theme.of(context).primaryColor,
                borderFocusColor: Theme.of(context).primaryColor,
                borderRadius: 10,
                optionValue: "ID",
                optionLabel: "Name",
              ),
              const SizedBox(height: 50,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20,right: 20),
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RoutesName.home);
                            // Navigator.pushNamed(context, RoutesName.botNavBar);
                          },
                          child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        )
    );
  }
}