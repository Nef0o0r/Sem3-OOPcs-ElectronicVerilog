using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pattern3;

namespace Pattern3
{
    class Program
    {
        static void Main(string[] args)
        {
            // Проверяем Singleton
            Console.WriteLine("Testing Singleton:");
            Singleton s1 = Singleton.Instance;
            Singleton s2 = Singleton.Instance;

            Console.WriteLine("\nTesting RegularClass:");
            for (int i = 0; i < 11; i++)
            {
                RegularClass instance = new RegularClass();
            }

            Console.ReadKey();
        }
    }
}


