class Size {
  final double _w;
  final double _h;

  // Const constructor named Zero
  const Size.zero() : _w = 0, _h = 0;

  // a) Properties can be modified by using cascading
  Size(this._w, this._h);

  // b) Optional positional constructor with optional value 0 for W & H
  Size.optional([this._w = 0, this._h = 0]);

  // c) Getters for W & H
  double get w => _w;
  double get h => _h;

  // d) Factory constructor
  factory Size.noNegative(double w, double h) {
    if (w < 0 || h < 0) {
      throw ArgumentError("Width and height must not be negative.");
    }
    return Size(w, h);
  }

  // e) Named constructor
  Size.fromMap(Map<String, double> values)
      : _w = values['w'] ?? 0,
        _h = values['h'] ?? 0;

  @override
  String toString() {
    return 'Size{Width: $_w, Height: $_h}';
  }
}
