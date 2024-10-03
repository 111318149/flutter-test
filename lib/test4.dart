import 'package:flutter/material.dart';

class ShowUserScreen extends StatefulWidget {
  const ShowUserScreen({super.key});

  @override
  ShowUserScreenState createState() => ShowUserScreenState();
}

class ShowUserScreenState extends State<ShowUserScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                  bottom: 10,
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                'https://www.gravatar.com/avatar/?d=mp',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '張書愷',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Jack90159@gmail.com',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        color: Colors.orangeAccent,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[700],
              ),
              Container(
                height: 50,
              ),
              Container(
                height: 10,
                color: Colors.grey,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.blue,
                      // 选中的标签文字颜色
                      unselectedLabelColor: Colors.blue[300],
                      // 未选中的标签文字颜色
                      indicatorColor: Colors.blue,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: const [
                        Tab(text: "Tab 1"),
                        Tab(text: "Tab 2"),
                        Tab(text: "Tab 3"),
                      ],
                    ),
                    Container(
                      height: 10,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 600, // 确保 TabBarView 的高度不会超出屏幕
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Tab1Page(),
                    Tab2Page(),
                    Tab3Page(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab1Page extends StatelessWidget {
  const Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: List.generate(
            20,
                (index) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Content for Tab 1 - Item $index'),
                ),
          ),
        ),
      ),
    );
  }
}

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: List.generate(
            20,
                (index) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Content for Tab 2 - Item $index'),
                ),
          ),
        ),
      ),
    );
  }
}

class Tab3Page extends StatelessWidget {
  const Tab3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: List.generate(
            20,
                (index) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Content for Tab 3 - Item $index'),
                ),
          ),
        ),
      ),
    );
  }
}
