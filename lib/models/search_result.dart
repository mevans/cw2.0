import 'blockworld.dart';

// Model to hold information about a searches result
class SearchResult {
  final String searchMethod;
  Blockworld finalState;
  int nodesExpanded;
  int nodesGenerated;

  SearchResult({this.finalState, this.nodesExpanded, this.searchMethod, this.nodesGenerated});

  bool get solutionFound => finalState != null;

  @override
  String toString() {
    return '$searchMethod completed after $nodesExpanded node expansions, $nodesGenerated node generations, with a depth of ${finalState.findDepth()}';
  }

}
