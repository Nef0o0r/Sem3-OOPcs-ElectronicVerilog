namespace Duck
{
    class Program
    {
        static void Main(string[] args)
        {
            Duck mallard = new MallardDuck();
            mallard.performQuack();
            mallard.performFly();
            mallard.swim();
            Duck wood = new WoodDuck();
            wood.performQuack();
            wood.performFly();
            wood.swim();
            System.Console.ReadKey();
        }
    }
}