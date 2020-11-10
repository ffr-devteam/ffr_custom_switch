# ffr_custom_switch

Custom Swich Package created with flutter.

The source code is **100% Dart and Flutter**, and all necessary files are located in the [/lib](https://github.com/ffr-devteam/ffr_custom_switch/tree/main/lib) folder

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
ffr_custom_switch: <latest_version>
```

Import in your project:
```dart
import 'package:ffr_custom_switch/ffr_custom_switch.dart';
```

## Basic Ussage

```dart
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool like = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FFR Custom Switch Example'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FFRCustomSwitch(
                thumbColor: Colors.
                lable: 'Do you like this package?',
                inactiveColor: Colors.red,
                activeColor: Colors.green,
                value: like,
                onChanged: (newValue) {
                    setState(){
                        like = newValue;
                    }
                },
            );
          ],
        ),
    );
  }
}
```