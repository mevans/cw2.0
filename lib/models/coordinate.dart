class Coordinate {
  int x;
  int y;

  Coordinate(this.x, this.y);

  Coordinate clone() => Coordinate(this.x, this.y);

  void moveTo(Coordinate coordinate) {
    this.x = coordinate.x;
    this.y = coordinate.y;
  }

  Coordinate operator +(Coordinate other) => Coordinate(this.x + other.x, this.y + other.y);

  int distance(Coordinate coordinate) => (this.x - coordinate.x).abs() + (this.y - coordinate.y).abs();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Coordinate && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => 'Coordinate{x: $x, y: $y}';
}
