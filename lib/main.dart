import 'dart:async';

import 'models/blockworld.dart';
import 'models/search_result.dart';
import 'search_methods/astar_search.dart';
import 'search_methods/breadth_first_search.dart';
import 'search_methods/depth_first_search.dart';
import 'search_methods/iterative_deepening_search.dart';

List<Function> searches = [aStarSearch, depthFirstSearch, iterativeDeepeningSearch, breadthFirstSearch];

main() {
  print(aStarSearch(Blockworld.start()));

//  Blockworld blockworld = Blockworld.start();
//  print(depthFirstSearch(blockworld));
//  print(blockworld);
//  print(iterativeDeepeningSearch(getDepth(14), graphSearch: false));
//  print(iterativeDeepeningSearch(getDepth(5)));
//  int totalExpanded = 0;
//  for(int i = 0; i < 1000; i++) {
//    totalExpanded += breadthFirstSearch(Blockworld.start()).nodesExpanded;
//    print("$i:");
//    print("Current: ${totalExpanded / (i + 1)}");
//  }
//  print("Average for iterative deepening: ${totalExpanded/1000}");
//  print(breadthFirstSearch(Blockworld.close()));

//  print(getDepth(14));

//  print(breadthFirstSearch(Blockworld.start()));

//
//  for (int d = 0; d < 15; d++) {
//    print("At Depth: $d");
//    List<int> expanded = [];
//
//    for (int i = 0; i < 1000; i++) {
//      expanded.add(depthFirstSearch(depths[14 - d]).finalState.findDepth());
//    }
//
//    int total = expanded.fold(0, (p, i) => p + i);
//
//    double average = total / expanded.length;
//
//    print("Average for depth $d : $average");
//  }

//  result(iterativeDeepeningSearch).timeout(Duration(seconds: 1), onTimeout: () => null).then((r) {
//    print(r);
//  });
  //  print(aStarSearch(Blockworld.close()));
//  print(aStarSearch(two));
//  print(randomSearch(Blockworld.close()));
//  print(depthFirstSearch(Blockworld.close()));
//  print(iterativeDeepeningSearch(Blockworld.close()));
}

Future<SearchResult> result(Function searchMethod) {
  return Future(() => searchMethod(Blockworld.start()));
}

Blockworld shallowClone(Blockworld blockworld) {
  return Blockworld(a: blockworld.a, b: blockworld.b, c: blockworld.c, agent: blockworld.agent, parent: null);
}

Blockworld getDepth(int depth) {
  final depths = iterativeDeepeningSearch(Blockworld.start()).finalState.generateSequence();
  return shallowClone(depths[14 - depth]);
}

void runWithDepth(int depth, List<Blockworld> depths) {
  searches.forEach((f) => print(f(shallowClone(depths[14 - depth]), graphSearch: true)));
}
