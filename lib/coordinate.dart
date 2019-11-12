class Coordinate {
  int x;
  int y;

  Coordinate(this.x, this.y);

  Coordinate clone() {
    return Coordinate(this.x, this.y);
  }

  void moveTo(Coordinate coordinate) {
    this.x = coordinate.x;
    this.y = coordinate.y;
  }

  Coordinate operator +(Coordinate other) {
    return Coordinate(this.x + other.x, this.y + other.y);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Coordinate && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Coordinate{x: $x, y: $y}';
  }
}
