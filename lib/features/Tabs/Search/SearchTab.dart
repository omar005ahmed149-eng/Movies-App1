import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/models/Movie_Model.dart';
import 'package:movies/core/models/Movies_Data.dart';
import 'package:movies/core/widgets/Category_card.dart';

class Searchtab extends StatefulWidget {
  const Searchtab({super.key});

  @override
  State<Searchtab> createState() => _SearchtabState();
}

class _SearchtabState extends State<Searchtab> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<MovieModel> filteredList = MovieData.featuredMovies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
            child: TextField(
              controller: _controller,
              autofocus: false,
              style: const TextStyle(color: Colors.white),
              onChanged: (text) =>MovieSearch(text),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(

            child:filteredList.isEmpty
                ? const _NoResults()
                : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredList.length,
              itemBuilder: (_, index)
              {
                return CategoryCard(rating: filteredList[index].rating, poster_image:  filteredList[index].poster_image);
              }
              ,
            ),
          ),
        ],
      ),
    );
  }
void MovieSearch(String text){
  if(text.isEmpty){
    filteredList=List.from(MovieData.featuredMovies);
  }
  else{
    filteredList=MovieData.featuredMovies.where((label)=>label.title.toLowerCase().contains(text.toLowerCase())).toList();
  }
  setState((){});
}
}


class _NoResults extends StatelessWidget {
  const _NoResults();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No results found',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}
