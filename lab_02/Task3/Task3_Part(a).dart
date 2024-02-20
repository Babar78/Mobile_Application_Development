class Point {
  final int _x;
  final int _y;

  // a) Properties can only be modified via a constructor
  Point(this._x, this._y);

  // b) Optional positional constructor with optional value 0 for X & Y
  Point.optional([this._x = 0, this._y = 0]);

  // c) Getters for properties X & Y
  int get X => _x;
  int get Y => _y;

  // d) Named constructor
  Point.named(int x, int y) : this(x, y);

  // Constant constructor named Origin
  const Point.Origin() : _x = 0, _y = 0;

  @override
  String toString() {
    return 'Point{X: $_x, Y: $_y}';
  }
}
