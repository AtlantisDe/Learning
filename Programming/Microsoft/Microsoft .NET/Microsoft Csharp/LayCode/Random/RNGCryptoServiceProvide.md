# RNGCryptoServiceProvide

- [RNGCryptoServiceProvider Class (System.Security.Cryptography)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.rngcryptoserviceprovider?view=net-5.0)
- [C#使用 RNGCryptoServiceProvider 生成强随机字符串 - Nullobj - 博客园](https://www.cnblogs.com/feiyuhuo/p/8903990.html)
- [关于 c＃：使用 RNGCryptoServiceProvider 生成随机字符串 | 码农家园](https://www.codenong.com/19298801/)
- [C#使用 RNGCryptoServiceProvider 生成强随机字符串 - Nullobj - 博客园](https://www.cnblogs.com/feiyuhuo/p/8903990.html)
- [How to Generate C# Random Numbers, Pseudo vs Secure Random Numbers](https://stackify.com/csharp-random-numbers/)
- [Use a cryptographic random number generator in C# - C# Helper](http://csharphelper.com/blog/2014/08/use-a-cryptographic-random-number-generator-in-c/)
- [Generate a random number in C# - Techie Delight](https://www.techiedelight.com/generate-random-number-csharp/)

## 1. QuickStart

- [RNGCryptoServiceProvider - Random Number Review](https://stackoverflow.com/questions/4892588/rngcryptoserviceprovider-random-number-review)

```c#
// C＃中有两种类型的随机数生成器：

// 伪随机数（System.Random）
// 安全随机数（System.Security.Cryptography.RNGCryptoServiceProvider）

// The random number provider.
private RNGCryptoServiceProvider Rand =
    new RNGCryptoServiceProvider();

// Return a random integer between a min and max value.
private int RandomInteger(int min, int max)
{
    uint scale = uint.MaxValue;
    while (scale == uint.MaxValue)
    {
        // Get four random bytes.
        byte[] four_bytes = new byte[4];
        Rand.GetBytes(four_bytes);

        // Convert that into an uint.
        scale = BitConverter.ToUInt32(four_bytes, 0);
    }

    // Add min to the scaled difference between max and min.
    return (int)(min + (max - min) *
        (scale / (double)uint.MaxValue));
}


using System;
using System.Security.Cryptography;

public class Example
{
 public static int GetRandomNumber()
 {
  using (RNGCryptoServiceProvider rngCrypt = new RNGCryptoServiceProvider())
  {
   byte[] tokenBuffer = new byte[4];  // int32 takes 4 bytes in C#
   rngCrypt.GetBytes(tokenBuffer);
   return BitConverter.ToInt32(tokenBuffer, 0);
  }
 }

 public static void Main()
 {
  int random = GetRandomNumber();
  Console.WriteLine(random);
 }
}

// 好吧，使用RNGCryptoServiceProvider给您带来了难以置信的加密强度种子，而Environment.TickCount在理论上是可以预测的。

// NextInt快速连续多次调用您的方法时，另一个至关重要的区别将显而易见。每次使用RNGCryptoServiceProvider都会为Random对象播种不同的加密强度数字，这意味着它将继续为每个调用返回不同的随机数。每次使用TickCount该Random对象时，都有使用相同编号播种该对象的风险（如果在同一“滴答”期间多次调用了该方法），这意味着它将继续为每个调用返回相同（假设是随机的）编号。

// 如果您确实需要真正的随机数，那么您根本不应该使用计算机来生成它们：您应该测量放射性衰变或类似的东西，这些东西确实是无法预测的。


//The following sample uses the Cryptography class to simulate the roll of a dice.

using System;
using System.IO;
using System.Text;
using System.Security.Cryptography;

class RNGCSP
{
    private static RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider();
    // Main method.
    public static void Main()
    {
        const int totalRolls = 25000;
        int[] results = new int[6];

        // Roll the dice 25000 times and display
        // the results to the console.
        for (int x = 0; x < totalRolls; x++)
        {
            byte roll = RollDice((byte)results.Length);
            results[roll - 1]++;
        }
        for (int i = 0; i < results.Length; ++i)
        {
            Console.WriteLine("{0}: {1} ({2:p1})", i + 1, results[i], (double)results[i] / (double)totalRolls);
        }
        rngCsp.Dispose();
    }

    // This method simulates a roll of the dice. The input parameter is the
    // number of sides of the dice.

    public static byte RollDice(byte numberSides)
    {
        if (numberSides <= 0)
            throw new ArgumentOutOfRangeException("numberSides");

        // Create a byte array to hold the random value.
        byte[] randomNumber = new byte[1];
        do
        {
            // Fill the array with a random value.
            rngCsp.GetBytes(randomNumber);
        }
        while (!IsFairRoll(randomNumber[0], numberSides));
        // Return the random number mod the number
        // of sides.  The possible values are zero-
        // based, so we add one.
        return (byte)((randomNumber[0] % numberSides) + 1);
    }

    private static bool IsFairRoll(byte roll, byte numSides)
    {
        // There are MaxValue / numSides full sets of numbers that can come up
        // in a single byte.  For instance, if we have a 6 sided die, there are
        // 42 full sets of 1-6 that come up.  The 43rd set is incomplete.
        int fullSetsOfValues = Byte.MaxValue / numSides;

        // If the roll is within this range of fair values, then we let it continue.
        // In the 6 sided die case, a roll between 0 and 251 is allowed.  (We use
        // < rather than <= since the = portion allows through an extra 0 value).
        // 252 through 255 would provide an extra 0, 1, 2, 3 so they are not fair
        // to use.
        return roll < numSides * fullSetsOfValues;
    }
}
```
