using System.Linq;
using System.Text;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Here we test the functions");
    }
    public static int SquareSum2(int[] numbers)
    {
        int response = 0;
        foreach (int number in numbers)
            response += (number * number);
        return response;
    }

    public static int SquareSum(int[] numbers)
    => numbers.Sum(x => x * x);

    public static long[] Digitize(long number)
        => number
            .ToString()
            .Reverse()
            .Select(x => Convert.ToInt64(x.ToString()))
            .ToArray();

    public static string greet(string name)
        => $"Hello, John how are you doing today?";

    public static string RepatStr1(int n, string s)
    {
        string response = "";
        for (int i = 0; i < n; i++) response += s;
        return response;
    }
    public static string RepeatStr2(int n, string s)
        => String.Concat(Enumerable.Repeat(s, n));
    // Using System.Text;
    public static string RepeatStr3(int n, string s)
        => new StringBuilder(s.Length * n).Insert(0, s, n).ToString();

    public static int ExpressionsMatter2(int a, int b, int c)
        => new int[]
        {
            a*b*c,
            a*b+c,
            a*(b+c),
            (a+b)*c,
            a+b*c,
            a+b+c
        }.Max();
    public static int ExpressionsMatter(int a, int b, int c)
    {
        var max = int.MinValue;
        max = Math.Max(max, a * (b + c));
        max = Math.Max(max, a * b * c);
        max = Math.Max(max, a + b * c);
        max = Math.Max(max, (a + b) * c);
        max = Math.Max(max, a + b + c);
        return max;
    }
}
