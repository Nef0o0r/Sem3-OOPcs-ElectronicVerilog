using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pattern3
{
    public class RegularClass
    {
        private static int counter = 0;

        public RegularClass()
        {
            Console.WriteLine($"RegularClass instance created. Counter = {counter}");
            counter++;
        }
    }
}