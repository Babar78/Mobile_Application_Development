import 'dart:math';

class Matrix {
  List<List<int>> _data = [];
  int _rowCount = 0;
  int _colCount = 0;

  Matrix(List<List<int>> data) {
    _validateInput(data);
    _data = List<List<int>>.from(data);
    _rowCount = _data.length;
    _colCount = _data.isEmpty ? 0 : _data[0].length;
  }

  factory Matrix.random({int rows = 0, int cols = 0}) {
    if (rows <= 0 || cols <= 0) {
      throw ArgumentError("Rows and columns must be greater than zero.");
    }

    Random random = Random();
    List<List<int>> randomData = List.generate(
      rows,
      (i) => List.generate(cols, (j) => random.nextInt(10)),
    );

    return Matrix(randomData);
  }

  int get rowCount => _rowCount;
  int get colCount => _colCount;

  void _validateInput(List<List<int>> data) {
    if (data.isEmpty) {
      throw ArgumentError("Matrix must have at least one row.");
    }

    int firstColCount = data[0].length;

    for (var row in data) {
      if (row.length != firstColCount) {
        throw ArgumentError("All rows must have the same number of columns.");
      }
    }
  }

  Matrix add(Matrix other) {
    _validateInput(other._data);
    List<List<int>> resultData = List.generate(
      _rowCount,
      (i) => List.generate(_colCount, (j) => _data[i][j] + other._data[i][j]),
    );
    return Matrix(resultData);
  }

  Matrix subtract(Matrix other) {
    _validateInput(other._data);
    List<List<int>> resultData = List.generate(
      _rowCount,
      (i) => List.generate(_colCount, (j) => _data[i][j] - other._data[i][j]),
    );
    return Matrix(resultData);
  }

  Matrix multiply(Matrix other) {
    if (_colCount != other._rowCount) {
      throw ArgumentError("Number of columns in the first matrix must be equal to the number of rows in the second matrix.");
    }

    List<List<int>> resultData = List.generate(
      _rowCount,
      (i) => List.generate(
        other._colCount,
        (j) {
          int sum = 0;
          for (int k = 0; k < _colCount; k++) {
            sum += _data[i][k] * other._data[k][j];
          }
          return sum;
        },
      ),
    );

    return Matrix(resultData);
  }

  Matrix transpose() {
    List<List<int>> resultData = List.generate(
      _colCount,
      (i) => List.generate(
        _rowCount,
        (j) => _data[j][i],
      ),
    );
    return Matrix(resultData);
  }

  void printMatrix() {
    for (var row in _data) {
      print(row);
    }
  }

  static void main() {
    try {
      Matrix matrix1 = Matrix.random(rows: 2, cols: 3);
      Matrix matrix2 = Matrix.random(rows: 2, cols: 3);

      print("Matrix 1:");
      matrix1.printMatrix();

      print("\nMatrix 2:");
      matrix2.printMatrix();

      print("\nAddition:");
      Matrix additionResult = matrix1.add(matrix2);
      additionResult.printMatrix();

      print("\nSubtraction:");
      Matrix subtractionResult = matrix1.subtract(matrix2);
      subtractionResult.printMatrix();

      print("\nMultiplication:");
      Matrix multiplicationResult = matrix1.multiply(matrix2);
      multiplicationResult.printMatrix();

      print("\nTranspose of Matrix 1:");
      Matrix transposeResult = matrix1.transpose();
      transposeResult.printMatrix();

    } catch (e) {
      print("Error: $e");
    }
  }
}

void main() {
  Matrix.main();
}

