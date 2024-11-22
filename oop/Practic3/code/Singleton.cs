using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pattern3
{
    public class Singleton
    {
        private static int counter = 0;

        // Защищенный конструктор предотвращает создание экземпляра извне
        protected Singleton()
        {
            Console.WriteLine($"Singleton instance created. Counter = {counter}");
            counter++;
        }

        private sealed class SingletonCreator
        {
            private static readonly Singleton instance = new Singleton();
            public static Singleton Instance { get { return instance; } }
        }

        public static Singleton Instance
        {
            get { return SingletonCreator.Instance; }
        }
    }
}

