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
    //! Calculate if you are above the average of a group =========================================
    public static bool BetterThanAverage1(int[] classPoints, int YourPoints)
    {
        #region Calculate average of class
        ushort totalPoints = 0;
        foreach (var point in classPoints)
            totalPoints += (ushort)point;
        ushort average = (ushort)(totalPoints / classPoints.Length);
        #endregion
        return YourPoints > average; 
    }

    public static bool BetterThanAverage2(int[] classPoints, int YourPoints)
    {
        int average = (classPoints.Sum() + YourPoints) / (classPoints.Length + 1);
        return YourPoints > average;
    }

    public static bool BetterThanAverage(int[] classPoints, int YourPoints)
    => YourPoints > classPoints.Average();

    //! Calculate the result of a piedra papel o tijeras game =======================================
    public static string Rps2(string player1, string player2)
    => player1 switch
    {
        "rock"     when player2 == "scissors" => "Player 1 won!",
        "rock"     when player2 == "paper"    => "Player 2 won!",
        "scissors" when player2 == "paper"    => "Player 1 won!",
        "scissors" when player2 == "rock"     => "Player 2 won!",
        "paper"    when player2 == "rock"     => "Player 1 won!",
        "paper"    when player2 == "scissors" => "Player 2 won!",
        _ => "Nobody wins"
    };
    
    public static string Rps(string player1, string player2)
    {
        if (player1 == player2) return "Draw!";
        string combination = (player1 + player2);
        int winner = combination == "scissorspaper"
                  || combination == "rockscissors"
                  || combination == "paperrock"
                  ? 1 : 2;
        return $"Player {winner} won!";
    }
