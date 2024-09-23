using System;

namespace Utils
{
    internal class Utils
    {
        static void Main(string[] args)
        {
            int x, y, greater, n;
            int answer = 0;
            string line;
           
            Console.WriteLine("Please enter first number");
            line = Console.ReadLine();
            x = int.Parse(line);
            Console.WriteLine("Please enter second number");
            line = Console.ReadLine();
            y = int.Parse(line);

            Console.WriteLine($"x = {x}, y = {y}");
            Test.Swap(ref x, ref y);
            Console.WriteLine($"x = {x}, y = {y}");
            greater = Greater(x, y);
            Console.WriteLine("Max number = {0}", greater);

            Console.WriteLine("Please enter a number for factorial!");
            line = Console.ReadLine();
            n = int.Parse(line);
            Factorial(n,ref answer);
            Console.WriteLine($"Result factorial = {answer}");

            Console.WriteLine("Please enter a number for factorial!");
            line = Console.ReadLine();
            n = int.Parse(line);
            answer = RecursiveFactorial(n);
            Console.WriteLine($"Result factorial = {answer}");
        }
        
       public static int Greater(int a, int b)
        {
            if (a >= b)
            {
                return a;
            }
            else
            {
                return b;
            }
        }

        public static bool Factorial(int n, ref int answer)
        {
            if (n < 0)
            {
                Exception exception = new Exception("Negative number!");
                throw exception;
            }
            answer = 1;
            for (int i = 0; i < n; i++)
            {
                answer = answer * (i + 1);
            }
            return true;

        }
        
        public static int RecursiveFactorial(int n)
        {
            if (n < 0)
            {
                Exception exception = new Exception("Negative number!");
               throw exception;
            }
            if (n == 0)
            {   
                return 1;
            }
            else
            {
                return n * RecursiveFactorial(n - 1);
            }

        }
    }
    internal class Test
    {
        public static void Swap(ref int a, ref int b)
        {
            int temp;
            temp = a;
            a = b;
            b = temp;
        }
    }
}
