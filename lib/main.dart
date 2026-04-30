import 'package:flutter/material.dart';

void main(){
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext content){
    return MaterialApp( 
      debugShowCheckedModeBanner: false,    
      home: HomePage(), 
  );
  }
}
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void decrement(){
    setState(() {
      contador--;
    });       
      print(contador);
     }

   void increment(){
    setState(() {
      contador++;
    });     
      print(contador);
     }

    bool get isEmpty => contador == 0;
    bool get isFull => contador == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(         
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isFull ? 'Lotado' : 'Pode entrar',
          style: TextStyle(
            fontSize: 26,
            color: isFull ? Colors.red :  Color.fromARGB(255, 4, 87, 154),
            fontWeight: FontWeight.w700
          ),
          ),
        
          Padding(padding: EdgeInsets.all(24),
          child: Text(
            contador.toString(),
           style: TextStyle(
            fontSize: 26,
            color: isFull ? Colors.red : Color.fromARGB(255, 4, 87, 154),
            fontWeight: FontWeight.w700
          ),
          ),
          ),
           
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement,
              style: TextButton.styleFrom(
                  backgroundColor:isEmpty ? Colors.blue.withOpacity(0.2) : Colors.blue,
                  fixedSize: const Size(100, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),),
               child: Text('Saiu'),
              ),

              SizedBox(width: 32,),

              TextButton(
                onPressed: isFull ? null : increment,                 
                style: TextButton.styleFrom(
                  backgroundColor: isFull ? Colors.blue.withOpacity(0.2) : Colors.blue,
                  fixedSize: const Size(100, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),),
               child: Text('Entrar'),
              ),
            ],
          ),
        ],
      ),
      )
    );
  }
}