class Lasagna
{
    int timeInOven = 40;
    int layerPreparationTime = 2;
    public int ExpectedMinutesInOven()
    {
        return timeInOven;
    }

    public int RemainingMinutesInOven(int passedTime)
    {
        return timeInOven - passedTime;
    }

    public int PreparationTimeInMinutes(int layers)
    {
        return layers * layerPreparationTime;
    }

    public int ElapsedTimeInMinutes(int layers, int passedTime)
    {
        return PreparationTimeInMinutes(layers) + passedTime;
    }
}

class Lasagna2
{
    private readonly const int _timeInOven = 40;
    private readonly const int _layerPreparationTime = 2;
    public int ExpectedMinutesInOven() => _timeInOven;

    public int RemainingMinutesInOven(int passedTime) => _timeInOven - passedTime;

    public int PreparationTimeInMinutes(int layers) => layers * _layerPreparationTime;

    public int ElapsedTimeInMinutes(int layers, int passedTime) =>
        PreparationTimeInMinutes(layers) + passedTime;
}

// Booleanos

static class QuestLogic
{
    public static bool CanFastAttack(bool knightIsAwake) => !knightIsAwake;

    public static bool CanSpy(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake) =>
        (knightIsAwake || archerIsAwake || prisonerIsAwake);

    public static bool CanSignalPrisoner(bool archerIsAwake, bool prisonerIsAwake) =>
        prisonerIsAwake && !archerIsAwake;

    public static bool CanFreePrisoner(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake, bool petDogIsPresent) =>
        (petDogIsPresent && !archerIsAwake)
        || (!petDogIsPresent && !archerIsAwake && !knightIsAwake && prisonerIsAwake);
}

static class QuestLogic2
{
    public static bool CanFastAttack(bool knightIsAwake) => !knightIsAwake;

    public static bool CanSpy(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake) =>
        (knightIsAwake || archerIsAwake || prisonerIsAwake);

    public static bool CanSignalPrisoner(bool archerIsAwake, bool prisonerIsAwake) =>
        prisonerIsAwake && !archerIsAwake;

    public static bool CanFreePrisoner(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake, bool petDogIsPresent) =>
        petDogIsPresent
            ? !archerIsAwake
            : !knightIsAwake && !archerIsAwake && prisonerIsAwake;
}

// Manejo de strings


static class LogLine
{
    public static string Message(string logLine) =>
        logLine.Trim().Split(": ")[1].Trim();

    public static string LogLevel(string logLine) =>
        logLine.Trim().Split("]: ")[0].Substring(1).ToLower();

    public static string Reformat(string logLine) =>
        $"{Message(logLine)} ({LogLevel(logLine)})".Trim();
}

static class LogLine
{
    public static string Message(string logLine) =>
        logLine[(logLine.IndexOf(":") + 1)..].Trim();

    public static string LogLevel(string logLine) =>
        logLine[1..logLine.IndexOf("]")].ToLower();

    public static string Reformat(string logLine) =>
        $"{Message(logLine)} ({LogLevel(logLine)})".Trim();
}

//! Numbers And Coercion and switch ===============================================

static class AssemblyLine
{
    private const int BaseProductionRatePerHour = 221;
    public static double SuccessRate(int speed)
    {
        if(speed == 0)
        {
            return 0;
        }
        else if(speed <= 4)
        {
            return 1;
        }
        else if(speed <= 8)
        {
            return 0.9;
        }
        else if(speed == 9)
        {
            return 0.8;
        }
        else
        {
            return 0.77;
        }
    }
    public static double ProductionRatePerHour(int speed)
    {
        return speed * BaseProductionRatePerHour * SuccessRate(speed);
    }
    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)ProductionRatePerHour(speed) / 60;
    }
}

// In this way we can use switch case and arrow functions
static class AssemblyLine
{
    private const int BaseProductionRatePerHour = 221;
    public static double SuccessRate(int speed) => speed switch
    {
        < 1 => 0.0,
        <= 4 => 1.0,
        <= 8 => 0.9,
        9 => 0.8,
        10 => 0.77,
        _ => 0
    };
    public static double ProductionRatePerHour(int speed) =>
        speed * BaseProductionRatePerHour * SuccessRate(speed);
    public static int WorkingItemsPerMinute(int speed) =>
        (int)ProductionRatePerHour(speed) / 60;
}

//! Another switch implementation

static class AssemblyLine
{
    private const int BaseProductionRatePerHour = 221;
    public static double SuccessRate(int speed) =>
    speed switch {
        (> 0) and (< 5) => 1.0,
        (> 4) and (< 9) => 0.90,
        9 => .80,
        10 => .77,
        _ => 0
    };
    public static double ProductionRatePerHour(int speed) =>
        speed * BaseProductionRatePerHour * SuccessRate(speed);
    public static int WorkingItemsPerMinute(int speed) =>
        (int)ProductionRatePerHour(speed) / 60;
}
