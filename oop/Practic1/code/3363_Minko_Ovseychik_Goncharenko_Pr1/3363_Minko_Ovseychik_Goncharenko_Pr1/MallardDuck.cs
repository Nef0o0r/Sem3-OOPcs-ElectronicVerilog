namespace Duck
{
    class MallardDuck : Duck
    {
        public MallardDuck()
        {
            quackbehavior = new Quack();
            flybehavior = new FlyWithWings();
            swimbehavior = new Row();

            System.Console.WriteLine("I am a mallard duck");
        }
    }
}