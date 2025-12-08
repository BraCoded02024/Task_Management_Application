import 'package:flutter/material.dart';

void main() {
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LibraryHome(),
    );
  }
}

class LibraryHome extends StatefulWidget {
  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  List<String> books = [];
  TextEditingController bookController = TextEditingController();

  void addBook() {
    String title = bookController.text.trim();

    if (title.isNotEmpty) {

      setState(() {
        books.add(title);
      });

      bookController.clear();

      // Close dialog AFTER updating UI
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }
  void removeBook(String title) {
    setState(() {
      books.remove(title);
    });
  }

  void openAddBookDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Book"),
        content: TextField(
          controller: bookController,
          decoration: InputDecoration(hintText: "Enter book title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: addBook,
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library System"),
      ),
      body: books.isEmpty
          ? Center(child: Text("No books available"))
          : ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => removeBook(books[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddBookDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
