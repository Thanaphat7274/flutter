import 'package:flutter/material.dart';

class PostFrid extends StatefulWidget {
  const PostFrid({super.key});

  @override
  State<PostFrid> createState() => _PostFridState();
}

class _PostFridState extends State<PostFrid> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.ondemand_video)),
              Tab(icon: Icon(Icons.assignment_ind_outlined)),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                // Tab 1: Grid
                GridView.builder(
                  padding: const EdgeInsets.all(1),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(color: Colors.grey[300]);
                  },
                ),
                // Tab 2: Videos placeholder
                const Center(child: Text('No videos yet')),
                // Tab 3: Tagged placeholder
                const Center(child: Text('No tagged posts')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
