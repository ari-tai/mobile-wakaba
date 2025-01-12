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
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  } @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('top-images/haikei.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
          ),


          Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset('top-images/title.png'),//タイトル画像
                SizedBox(
                  height:80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(//ルームを作るボタン
                        onPressed: () {
                          showDialog(
                            context:context,
                            builder:(BuildContext context){
                              return AlertDialog(
                                title:Text('ルームID'),
                                actions:<Widget>[
                                  Center(
                                    child:Text(
                                      '37169',//ルームID表示
                                      style: TextStyle(
                                        fontSize: 30,
                                        color:Colors.lightGreen,
                                      ),
                                    ) ,
                                  )

                                ]
                              );

                            },
                          );
                        },
                        child: Text("ルームを作る"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                          textStyle: const TextStyle(fontSize: 30),
                          foregroundColor: Colors.white,
                          fixedSize: Size(150, 150),
                          alignment: Alignment.center,
                        )
                    ),
                    SizedBox(
                      width:50,
                    ),
                    ElevatedButton(//ルームを作成ボタン------------------------------------------------------------
                        onPressed: () {
                          showDialog(//ダイアログ
                            context:context,
                            builder:(BuildContext context){
                              return AlertDialog(
                                title:Text('ルームIDを入力'),
                                actions:<Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      TextField(//ルームID入力フィールド
                                        controller: _controller,
                                        decoration: InputDecoration(
                                          hintText: '5文字',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide:  BorderSide(
                                                color: Colors.blue,
                                                width: 3.0,
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:10,
                                      ),
                                      ElevatedButton(//参加ボタン
                                        onPressed: (){
                                          int? roomID = int.tryParse(_controller.text);//入力内容をint型に変換し変数roomIDに代入
                                        },
                                        child: Text('参加'),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          textStyle: const TextStyle(fontSize: 20),
                                          foregroundColor: Colors.white,
                                          fixedSize: Size(90, 20),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                              );

                            },
                          );
                        },
                        child: Text("ルームに参加"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 30),
                          foregroundColor: Colors.black, // foreground
                          fixedSize: Size(150, 150),
                          alignment: Alignment.center,
                        )
                    ),
                  ],
                )


              ] ,
            ),
          ),
        ],
      )

      
    );
  }
}
