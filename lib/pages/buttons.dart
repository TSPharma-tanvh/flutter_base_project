import 'package:flutter/material.dart';

class ButtonPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Example'),
        actions: <Widget>[
          Icon(Icons.new_releases),
          Container(
            margin: EdgeInsets.all(12),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            padding: EdgeInsets.all(4),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI5TDjHkXbNGlduL7AEVMwGn4bc-QosNt7IRcp9fBJ4qN6N0pmHg',
                  ),
                  fit: BoxFit.cover,
                ),
                // borderRadius: BorderRadius.circular(45)
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Icon Buttons',
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Normal Raised Button'),
            ),
            MaterialButton(
              color: Colors.blueGrey,
              onPressed: () {},
              child: Text(
                'Colured Raised Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(45),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Rounded Raised Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              elevation: 15,
              color: Colors.green,
              highlightElevation: 30,
              onPressed: () {},
              onHighlightChanged: (value) {
                print(value);
              },
              child: Text(
                'Rounded Raised Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Flat Button',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text('Colored Flat Button'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text('Rounded Flat Button'),
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //   foregroundColor: Colors.blue,
            //   side: BorderSide(color: Colors.blue),
            //   overlayColor: MaterialStateProperty.resolveWith((states) {
            //     if (states.contains(MaterialState.pressed)) {
            //     return Colors.yellowAccent;
            //     }
            //     return Colors.deepOrange;
            //   }),
            //   ),
            //   onPressed: () {},
            //   child: Text('Flat Button'),
            // ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.blue),
                side: WidgetStateProperty.all(
                    const BorderSide(color: Colors.blue)),
                overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.yellowAccent;
                  }
                  return Colors.deepOrange;
                }),
              ),
              onPressed: () {},
              child: const Text('Flat Button'),
            ),
            ElevatedButton(
              onPressed: () {},
              // color: Colors.red,
              child: Text('data'),
            ),
            Text(
              'Icon Buttons',
            ),
            IconButton(
              color: Colors.red,
              onPressed: () {},
              icon: Icon(Icons.new_releases),
            ),
            IconButton(
              splashColor: Colors.teal,
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.no_encryption),
            )
          ],
        ),
      ),
    );
  }
}
