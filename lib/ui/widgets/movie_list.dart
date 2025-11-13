import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  
  Widget build(BuildContext context) { 

    
    final List<String> assetPaths = [
      'assets/images/kucing.jpg', 
      'assets/images/great.jpg',
      'assets/images/great.jpg',
      'assets/images/kucing.jpg',
      'assets/images/kucing.jpg',
      'assets/images/kucing.jpg',
      'assets/images/kucing.jpg',
      
    ];

    return Column(
      children: [
        
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10), 
          color: const Color.fromARGB(255, 7, 7, 7),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Trending',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('More >',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          ),
        ),
        
        
        Container(
          height: 150,
          color: const Color.fromARGB(255, 7, 7, 7),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
           
            itemCount: assetPaths.length, 
            
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 10 : 0, 
                
                right: index == assetPaths.length - 1 ? 10 : 0,
              ),
              child: Container(
                width: 100,
                
                color: Colors.grey[300], 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    fit: BoxFit.cover,
                    
                    image: AssetImage(
                      assetPaths[index], 
                    ),
                  ),
                ),
              ),
            ), 
            separatorBuilder: (context, index) => const SizedBox(width: 10), 
          ),
        ),
      ],
    );          
  }
}
