using System;
using System.IO;
public class CopyFileUpper
{
    public static void Main()
    {
        try
        {
            string sFrom, sTo;
            StreamReader srFrom;
            StreamWriter swTo;
            Console.WriteLine("Введите имя входного файла");
            sFrom = Console.ReadLine();
            Console.WriteLine("Введите имя выходного файла");
            sTo = Console.ReadLine();
            srFrom = new StreamReader(sFrom);
            swTo = new StreamWriter(sTo);
            while (srFrom.Peek() != -1)
            {
                string sBuffer = srFrom.ReadLine();
                swTo.WriteLine(sBuffer.ToUpper());
            }
            srFrom.Close();
            swTo.Close();
        }
        catch (FileNotFoundException e)
        {
            Console.WriteLine("Файл не существует");
        }
        catch (Exception e)
        {
            Console.WriteLine("Произошла ошибка");
        }
    }
}
