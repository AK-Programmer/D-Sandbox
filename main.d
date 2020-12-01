module main;
import std.stdio;
//import la_operations;
import matrix;

void main() {
    /*
    double** matrix;
    matrix = new double*[5];
    for(int i = 0; i < 5; i++)
    {
        matrix[i] = new int[5];
    }

    for(int i = 0; i < matrix.length; i++)
    {
        for(int j = 0; j < matrix.length; j++)
        {
            matrix[i][j] = 0;
        }
    }*/

    Matrix matrix = new Matrix(2,2);

    matrix.setAll(2);
    writeln(matrix.matrix);
    writeln(matrix.addScalarMult(0, 2, 1).matrix);
    writeln(matrix.matrix);
    //writeln(rowReduced(5, 5, matrix));
}