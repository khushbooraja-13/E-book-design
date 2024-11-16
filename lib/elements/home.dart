import 'package:bookappdesign/elements/constants.dart';
import 'package:flutter/material.dart';

import 'bookdetail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;
  String selectedIcon = 'Home'; // Default selected icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2))),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/girl3.webp'),
                            radius: 25,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Sophia Johnson',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Beginner Level',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                          ),
                          child: Container(
                            // Adjust padding to control the space between the avatar and the border
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.message_outlined),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                          ),
                          child: Container(
                            // Adjust padding to control the space between the avatar and the border
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'images/notification-bell.png',
                                    height: 40,
                                  ),
                                  Positioned(
                                    right: 3,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search anything here...',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        hintText: 'Search here...',
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    height: 50,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Set the clicked item index
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 100,
                            height: MediaQuery.of(context).size.height * 0.075,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              color: _selectedIndex == index
                                  ? Colors.black
                                  : Colors
                                      .transparent, // Black background if selected
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                genreName[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 6,
                  ),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            // Perform navigation to the detail screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetail(
                                  bookName: bookName[index],
                                  authorName: authorName[index],
                                  imagePath: img[index],
                                  bookIdx: index,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      // Ensure the image follows the border radius
                                      child: Image.asset(
                                        width: 220,
                                        img[index],
                                        fit: BoxFit
                                            .fill, // Adjust the image fit property
                                      ),
                                    ),
                                    height: 240,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 108,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            bookName[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            authorName[index],
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            width: 250,
                          ),
                        ),
                      );
                    },
                    itemCount: 6,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Continue Reading',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Align(
                                    child: Text(
                                      authorname[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  width: 150,
                                  padding: EdgeInsets.only(left: 10),
                                ),
                                Container(
                                  width: 150,
                                  child: Image.asset(
                                    continueImg[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 6,
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.8),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconContainer('Home', Icons.home),
                  _buildIconContainer('Search', Icons.search_outlined),
                  _buildIconContainer('Book', Icons.book),
                  _buildIconContainer('Person', Icons.person_outline),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconContainer(String label, IconData icon) {
    bool isSelected = selectedIcon == label; // Check if the icon is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = label; // Update the selected icon
        });
      },
      child: Container(
        height: 35,
        width: isSelected ? 100 : 35, // Expand when selected
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.8) : null, // White when selected
          borderRadius: BorderRadius.circular(40),
          border: isSelected
              ? Border.all(color: Colors.black, width: 2) // Border only when selected
              : Border.all(color: Colors.transparent, width: 0), // No border initially
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 23, color: isSelected ? Colors.black : Colors.white), // Black icon when selected
            if (isSelected) // Only show text if it's selected
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black, // Black text when selected
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}