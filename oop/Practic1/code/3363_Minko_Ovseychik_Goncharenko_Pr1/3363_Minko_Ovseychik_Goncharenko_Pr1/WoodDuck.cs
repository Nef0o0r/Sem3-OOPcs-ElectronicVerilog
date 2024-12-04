namespace Duck
{
    class WoodDuck : Duck
    {
        public WoodDuck()
        {
            quackbehavior = new Squeak();
            flybehavior = new FlyWithWings();
            swimbehavior = new Float();

            System.Console.WriteLine("I am a wood duck");
        }
    }
}