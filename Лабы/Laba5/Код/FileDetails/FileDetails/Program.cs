using System;
using System.IO;

class FileDetails
{
    static void Main(string[] args)
    {
        try
        {
            int length;
            string fileName;

            // Вывод длины массива args
            Console.WriteLine("Lengths of args: " + args.Length);

            // Вывод всех аргументов
            foreach (string arg in args)
            {
                Console.WriteLine(arg);
            }

            // Получение имени файла
            fileName = args[0];
            Console.WriteLine("Filename: " + fileName);

            // Открываем файл и читаем его содержимое
            FileStream stream = new FileStream(fileName, FileMode.Open);
            StreamReader reader = new StreamReader(stream);

            // Получаем длину файла
            length = (int)stream.Length;
            char[] contents = new char[length];

            // Читаем символы по одному и добавляем их в массив
            for (int i = 0; i < length; i++)
            {
                contents[i] = (char)reader.Read();
            }

            //Выводим символы в консоль
            /*foreach (char c in contents)
            {
                Console.WriteLine(c);
            }*/
            // Закрываем потоки
            reader.Close();
            stream.Close();
            Summarize(contents);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
    }
    static void Summarize(char[] chars)
    {
        int lineCount = 1;  // Начинаем с 1, так как первая строка уже существует
        int vowelCount = 0; // Счетчик гласных
        int consonantCount = 0; // Счетчик согласных

        foreach (char c in chars)
        {
            if ("AEIOUaeiouАУОИЭЫЁЕЮЯауоиеэыёеяю".IndexOf(c) != -1)
            {
                // Если символ гласный
                vowelCount++;
            }
            else if (char.IsLetter(c))  // Если это буква, но не гласная, значит согласная
            {
                consonantCount++;
            }

            if (c == '\n')
            {
                lineCount++; // Увеличиваем количество строк
            }
        }

        Console.WriteLine($"Гласные = {vowelCount}, согласные = {consonantCount}, строк = {lineCount}");
    }

}
//cd C:\Users\Nef0o0r\OneDrive\Study\Второй курс\ООП C#\Лабы\Laba5\Код\FileDetails\FileDetails\bin\Debug>
//FileDetails.exe text.txt
//Код работает только через консоль!!!
