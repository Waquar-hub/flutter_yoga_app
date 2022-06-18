import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://images.pexels.com/photos/3094230/pexels-photo-3094230.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
            ),
          ),
          const ListTile(
            title: Text(
              "Restart Progess",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 28,
            ),
          ),
          const ListTile(
            title: Text(
              "Restart Progess",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 28,
            ),
          ),
          const ListTile(
            title: Text(
              "Restart Progess",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 28,
            ),
          ),
          const ListTile(
            title: Text(
              "Restart Progess",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 28,
            ),
          ),
          const ListTile(
            title: Text(
              "Restart Progess",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 28,
            ),
          ),
          const Divider(
            color: Colors.black54,
            endIndent: 20,
            indent: 20,
          ),
          const Text("version 1.8.0"),
        ],
      ),
    );
  }
}
