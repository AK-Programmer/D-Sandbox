module matrix;
import std.stdio;

//If implementing as generic, T must be a field (e.g., reals, complex numbers, Z_p)
class Matrix {

    int rows;
    int cols;
    double[][] matrix;

    this(int rows, int cols)
    {
        this.rows = rows;
        this.cols = cols;

        matrix = new double[][](rows, cols);
    }

    void setIdentity()
    {
        if(rows == cols)
        {
            for(int i = 0; i < rows; i++)
            {
                for(int j = 0; j < cols; j++)
                {
                    matrix[i][j] = i == j ? 1 : 0;
                }
            }
        }
        else 
        {
            throw new Exception("rows and columns must be equal to set identity");
        }
        writeln(matrix);
    }

    void setAll(double num)
    {
        for(int i = 0; i < rows; i++)
        {
            matrix[i][] = num;
        }
    }

    void setNewMatrix(double[][] matrix)
    {
        this.matrix = matrix;
    }


    //Row-reduce
    Matrix rowReduced()
    {
        Matrix rowEquivMatrix = new Matrix(rows, cols);

        for(int i = 0; i < rows; i++)
        {
            rowEquivMatrix.matrix[i][] = matrix[i][];
        }

        //Iterating through all rows
        for(int i = 0; i < rows; i++)
        {
            
            int nonZeroIndex = -1;
            //Finding the first instance of a non-zero value in the row
            for(int j = 0; j < cols && nonZeroIndex == -1; j++)
            {
                //When the first non-zero value is found, multiply the whole row by its inverse. Now the first non-zero value is one. 
                if(rowEquivMatrix.matrix[i][j] != 0)
                {
                    nonZeroIndex = j;
                    rowEquivMatrix.matrix[i][] *= (1/rowEquivMatrix.matrix[i][j]);
                }
            }

            //Setting the rest of the values in column nonZeroIndex to 0
            if(nonZeroIndex != -1)
            {
                for(int j = 0; j < rows; j++)
                {
                    //Skip the current row
                    if(j != i)
                    {
                       rowEquivMatrix.matrix[j][] += (-rowEquivMatrix.matrix[j][nonZeroIndex]) * rowEquivMatrix.matrix[i][];
                    }
                }
            }
        }

        return rowEquivMatrix;
    }

    //Elementary row operations
    Matrix scalarMult(int row, double scalar)
    {   
        Matrix rowEquivMatrix = new Matrix(rows, cols);

        for(int i = 0; i < rows; i++)
        {
            rowEquivMatrix.matrix[i][] = matrix[i][] * (i == row ? scalar : 1);
        }
        
        return rowEquivMatrix;
    }

    Matrix interchange(int row1, int row2)
    {
        Matrix rowEquivMatrix = new Matrix(rows, cols);

        for(int i = 0; i < rows; i++)
        {
            if(i == row1)
            {
                rowEquivMatrix.matrix[i][] = matrix[row2][];
            }
            else if (i == row2)
            {
                rowEquivMatrix.matrix[i][] = matrix[row1][];
            }
            else 
            {
                rowEquivMatrix.matrix[i][] = matrix[i][];
            }
        }
        
        return rowEquivMatrix;
    }

    Matrix addScalarMult(int row, int scalar, int rowToAdd)
    {
        Matrix rowEquivMatrix = new Matrix(rows, cols);

        for(int i = 0; i < rows; i++)
        {
            rowEquivMatrix.matrix[i][] = matrix[i][];
        }

        rowEquivMatrix.matrix[row][] += matrix[rowToAdd][] * scalar;

        return rowEquivMatrix;
    }



}