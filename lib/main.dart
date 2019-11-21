import 'dart:async';

import 'models/blockworld.dart';
import 'search_methods/astar_search.dart';
import 'search_methods/breadth_first_search.dart';
import 'search_methods/depth_first_search.dart';
import 'search_methods/iterative_deepening_search.dart';
import 'search_methods/random_search.dart';

main() {
  print(aStarSearch(Blockworld.start()));
  print(iterativeDeepeningSearch(Blockworld.start()));
  print(randomSearch(Blockworld.start()));
  print(depthFirstSearch(Blockworld.start()));
  print(breadthFirstSearch(Blockworld.start()));
}