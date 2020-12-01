module main;
import std.stdio;
import matrix;

void main() {
    Matrix matrix = new Matrix(3,3);

    matrix.setNewMatrix([[3, -1, 2], [2, 1, 1], [1, -3, 0]]);
    
    writeln(matrix.matrix);
    writeln(matrix.rowReduced().matrix);
    writeln(matrix.matrix);

}