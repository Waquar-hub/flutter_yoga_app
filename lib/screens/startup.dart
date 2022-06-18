import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/screens/r_u_ready.dart';

class CustomSliverAppbar extends StatefulWidget {
  const CustomSliverAppbar({super.key});

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              (context), MaterialPageRoute(builder: (context) => RuReady()));
        },
        child: const Text("START"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: Text("Yoga For Beginners"),
              background: Image.network(
                "https://images.pexels.com/photos/906097/pexels-photo-906097.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "16 Minutes || 26 Workouts",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                            leading: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Image.network(
                                "https://i.pinimg.com/originals/58/f2/1d/58f21d5094f151aac2bea68cc4f9e873.gif",
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              "Yoga Name $index",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text((index % 2 == 0) ? "00:20" : "x20"),
                          ),
                      separatorBuilder: (context, index) => const Divider(
                            thickness: 1,
                          ),
                      itemCount: 10)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
