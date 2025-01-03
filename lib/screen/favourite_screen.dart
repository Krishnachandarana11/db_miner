import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/quotes_controller.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final QuoteController controller = Get.find<QuoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade300, Colors.indigo.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            centerTitle: true,
            foregroundColor: Colors.white,
            title: Text(
              'Favorite Quotes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (controller.favoriteQuotes.isEmpty) {
            return Center(
              child: Text(
                'No favorite quotes yet!',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
            );
          }
          return ListView.separated(
            itemCount: controller.favoriteQuotes.length,
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.deepPurple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            itemBuilder: (context, index) {
              final quote = controller.favoriteQuotes[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                margin: EdgeInsets.only(bottom: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 12),
                  title: Text(
                    quote.quote,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    '- ${quote.author}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      controller.toggleFavorite(quote);
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
