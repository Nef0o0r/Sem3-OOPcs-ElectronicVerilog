class Duck
{
    protected FlyBehavior flybehavior;
    protected QuackBehavior quackbehavior;

    public Duck() { }
    public void performFly()
    {
        flybehavior.fly();
    }
    public void performQuack()
    {
        quackbehavior.quack();
    }
    public void swim() { }
}
