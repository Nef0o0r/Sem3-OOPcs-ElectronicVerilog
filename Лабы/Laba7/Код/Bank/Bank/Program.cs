using System;

namespace Bank
{
    internal class Program
    {

        enum AccountType
        {
            Checking,
            Deposit
        }

        class BankAccount
        {
            private long accNo;
            private decimal accBal;
            private AccountType accType;

            private static long nextNumber = 123;

            public void Populate(decimal balance)
            {
                accNo = NextNumber();
                accBal = balance;
                accType = AccountType.Checking;
            }

            public bool Withdraw(decimal amount)
            {
                bool sufficientFunds = accBal >= amount;
                if (sufficientFunds)
                {
                    accBal -= amount;
                }
                return sufficientFunds;
            }

            public decimal Deposit(decimal amount)
            {
                accBal += amount;
                return accBal;
            }

            public long Number()
            {
                return accNo;
            }

            public decimal Balance()
            {
                return accBal;
            }

            public string Type()
            {
                return accType.ToString();
            }

            private static long NextNumber()
            {
                return nextNumber++;
            }

            public void TransferFrom(BankAccount accFrom, decimal amount)
            {
                if (accFrom.Withdraw(amount))
                {
                    Deposit(amount);
                }
            }
            public void InfoBank()
            {   

                Console.WriteLine("Идентификатор пользователя: {0}", accNo);
                Console.WriteLine("Баланс: {0}",accBal);
                Console.WriteLine("Статус аккаунта: {0}\n", accType);

            }
        }

        public class Test
        {
            public static void Main()
            {
                // insert testing code here
                BankAccount b1 = new BankAccount();
                BankAccount b2 = new BankAccount();
                b1.Populate(100);
                b2.Populate(100);

                b1.InfoBank();
                b2.InfoBank();

                b2.TransferFrom(b1, 10);

                b1.InfoBank();
                b2.InfoBank();
            }
        }
    }
}
