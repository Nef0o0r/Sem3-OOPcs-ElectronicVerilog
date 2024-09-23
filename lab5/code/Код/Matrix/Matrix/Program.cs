using System;

namespace Matrix
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[,] arr1 = new int[2, 2];
            int[,] arr2 = new int[2, 2];
            int[,] result = new int[2, 2];
            string line;

            Console.WriteLine("Введите первую матрицу, каждый символ через Enter");
            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    line = Console.ReadLine();
                    arr1[i,j] = int.Parse(line);
                }
            }


            Console.WriteLine("Введите вторую матрицу, каждый символ через Enter");
            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    line = Console.ReadLine();
                    arr2[i, j] = int.Parse(line);
                }
            }

            Console.WriteLine("Первый массив:");
            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    Console.Write(arr1[i, j] + " ");
                }
                Console.Write("\n");
            }
            Console.WriteLine("Вторая массив:");
            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    Console.Write(arr2[i, j] + " ");
                }
                Console.Write("\n");
            }

            MatrixMultiply multiplier = new MatrixMultiply();
            multiplier.MatrixMultiplys(arr1, arr2, ref result);

            Console.WriteLine("Матрица полученная в результате умножения:");

            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    Console.Write(result[i, j] + " ");
                }
                Console.Write("\n");
            }

        }
    }
    internal class MatrixMultiply
    {
        public void MatrixMultiplys(int[,] arr1, int[,] arr2, ref int[,] result)
        {   
            for(int i = 0; i < arr1.GetLength(0); i++)
            {
                for(int j = 0; j < arr1.GetLength(1); j++)
                {
                    result[i,j] = 0;
                    for (int k = 0; k < arr1.GetLength(0); k++)
                        result[i,j] += arr1[i,k] * arr2[k,j];
                }
            }
        }
    }
}
