import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

var result= '';
var bgcolor =  Colors.white;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
        Row(children: [
          Image.asset('assets/images/icon_remove.png',height: 35),
          Text(' Body Mass Index',style: TextStyle(color: Colors.white),),
        ]),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 15,
            child: Container(
              width: 320,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI", style: TextStyle(
                    fontSize: 34,fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller:wtController,
                      decoration: InputDecoration(
                        label: Text("Your Weight(Kgs)"),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller:ftController,
                          decoration: InputDecoration(
                            label: Text("Your Height(ft)"),
                            prefixIcon: Icon(Icons.height),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller:inController,
                          decoration: InputDecoration(
                            label: Text("Your Height(In)"),
                            prefixIcon: Icon(Icons.height),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black,elevation: 8),
                      onPressed: (){
                    var wt = wtController.text.toString();   // abhi string form me hai
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!='' && ft!='' && inch!=''){
                      // bmi calculation
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iincn = int.parse(inch);

                      var tinch = (ift*12) + iincn;

                      var tcm = tinch*2.54;
                      var tmeter = tcm/100;

                      var bmi = iwt/(tmeter*tmeter);

                      var msg ='';
                      if(bmi>25){
                        msg = " You are OverWeight!!";
                        bgcolor = Colors.red.shade200;
                      }else if(bmi<18){
                        msg = "You are UnderWeight!!";
                        bgcolor = Colors.orange.shade200;
                      }else{
                        msg = "   You are Healthy!!";
                        bgcolor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "$msg\n Your BMI is ${bmi.toStringAsFixed(4)}";
                      });
                    }else{
                      setState(() {
                        result = 'Please fill all the required blanks!!';
                      });
                    }
                  }, child: Text('Calculate',style: TextStyle(color: Colors.white),)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(result,style: TextStyle(fontSize: 19),),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
