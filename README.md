# autostart

Wrap native library to implement flutter jump from startup page

## Getting Started


step 1

    dependencies:
  	    autostart: ^0.0.1

step 2
    
    import 'package:autostart/autostart.dart';
    
   
step 3
        
    class MyApp extends StatefulWidget {
      @override
      _MyAppState createState() => _MyAppState();
    }
    
    class _MyAppState extends State<MyApp> {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('auto start manage test'),
            ),
            body: Center(
              child: GestureDetector(
                onTap: () => checkAutoStartManager(context),
                child: Text('to auto start manager'),
              ),
            ),
          ),
        );
      }
    
      void checkAutoStartManager(BuildContext context) async {
        bool isAutoStartPermissionAvailable = await Autostart.isAutoStartPermissionAvailable;
        if (isAutoStartPermissionAvailable) {
          print('test available ok');
          Autostart.getAutoStartPermission();
        } else {
          print('test available fail');
        }
      }
    }
 
 improt native project and thanks :
 
    https://github.com/judemanutd/AutoStarter