class MallardDuck : Duck
{
    public MallardDuck()
    {
        quackbehavior = new Quack();
        flybehavior = new FlyWithWings();
        System.Console.WriteLine("I MallardDuck");
    }
}
