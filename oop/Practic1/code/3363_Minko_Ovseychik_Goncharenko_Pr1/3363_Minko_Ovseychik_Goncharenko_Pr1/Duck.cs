namespace Duck
{
    class Duck
    {
        protected FlyBehavior flybehavior;
        protected QuackBehavior quackbehavior;
        protected SwimBehavior swimbehavior;

        public Duck() { }
        public void performFly()
        {
            flybehavior.fly();
        }
        public void performQuack()
        {
            quackbehavior.quack();
        }
        public void swim()
        {
            swimbehavior.swim();
        }
    }
}