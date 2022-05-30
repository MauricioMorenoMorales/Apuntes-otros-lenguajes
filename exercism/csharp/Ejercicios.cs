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
    public static double SuccessRate(int speed)
    => speed switch {
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

//! Classes ============================================================
/* This is the implementation of a class with private values and logic */

// Mi solucion
class RemoteControlCar
{
    private int drivedDistance = 0;
    private int batteryCharge = 100;

    public static RemoteControlCar Buy() =>
        new RemoteControlCar();

    public string DistanceDisplay() =>
        $"Driven {this.drivedDistance} meters";

    public string BatteryDisplay() =>
        this.batteryCharge > 0
            ? $"Battery at {this.batteryCharge}%"
            : "Battery empty";

    public void Drive()
    {
        if(this.batteryCharge > 0)
        {
            this.drivedDistance += 20;
            this.batteryCharge -= 1;
        }
    }
}

//? Better solution

class RemoteControlCar
{
    private int _batteryLevel;
    private int _distanceDriven;

    public RemoteControlCar()
    {
        _batteryLevel = 100;
        _distanceDriven = 0;
    }

    public static RemoteControlCar Buy() => new();

    public string DistanceDisplay() =>

        $"Driven {_distanceDriven} meters";
    public string BatteryDisplay() =>
        _batteryLevel == 0 ? "Battery empty" : $"Battery at {_batteryLevel}%";

    public void Drive()
    {
        if (_batteryLevel <= 0) return;
        _batteryLevel--;
        _distanceDriven += 20;
    }
}

// In this solution we can specify better the type of the variables

class RemoteControlCar
{
    private static readonly int _startingDistance = 0;
    private static readonly int _startingBattery = 100;
    private readonly int _distancePerDrive = 20;
    private readonly int _batteryPerDrive = 1;

    private int _distanceDriven = _startingDistance;
    private int _batteryRemaining = _startingBattery;

    public RemoteControlCar()
    {
        _batteryRemaining = _startingBattery;
        _distanceDriven = _startingDistance;
    }

    public static RemoteControlCar Buy() => new();

    public string DistanceDisplay() => $"Driven {_distanceDriven} meters";

    public string BatteryDisplay() =>
        _batteryRemaining == 0 ? "Battery empty" : $"Battery at {_batteryRemaining}%";

        public void Drive()
    {
        if (_batteryRemaining <= 0) return;
        _batteryRemaining--;
        _distanceDriven += 20;
    }
}

// Classes interaction example ===================================================

class RemoteControlCar
{

    #region Class variables;
        private int speedPerMinute;
        private int batteryDrain;
        private int batteryTotal = 100;
        private int distanceDrived = 0;
    #endregion

    public RemoteControlCar(int speedPerMinute, int batteryDrain)
    {
        this.speedPerMinute = speedPerMinute;
        this.batteryDrain = batteryDrain;
    }
    public bool BatteryDrained() => batteryTotal < batteryDrain;

    public int DistanceDriven() => this.distanceDrived;

    public void Drive()
    {
        if(BatteryDrained()) return;
        this.batteryTotal -= batteryDrain;
        this.distanceDrived += speedPerMinute;
    }

    public static RemoteControlCar Nitro()
        => new RemoteControlCar(50, 4);
}

class RaceTrack
{
    // TODO: define the constructor for the 'RaceTrack' class
    #region Global values
    int distance;
    #endregion

    public RaceTrack(int distance)
    {
        this.distance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car)
    {
        bool response = false;
        while (!car.BatteryDrained())
        {
            car.Drive();
            if (car.DistanceDriven() >= this.distance)
            {
                response = true;
                break;
            }
        }
        return response;
    }
}

//? Classes inheritance ================================================================


abstract class Character
{
    private readonly string characterType;
    protected Character(string characterType)
    {
        this.characterType = characterType;
    }

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable()
        => false;

    public override string ToString()
        => $"Character is a {this.characterType}";
}

class Warrior : Character
{
    public Warrior() : base("Warrior") {}

    public override int DamagePoints(Character target)
        => target.Vulnerable()? 10 : 6;

    public override string ToString() => "Character is a Warrior";
}

class Wizard : Character
{
    private bool isSpellPrepared = false;
    public Wizard() : base("Wizard") {}

    public override int DamagePoints(Character target)
    {
        int damage = isSpellPrepared ? 12: 3;
        isSpellPrepared = false;
        return damage;
    }

    public override bool Vulnerable() => !isSpellPrepared;

    public void PrepareSpell()
        => this.isSpellPrepared = true;

	public override string ToString() => "Character is a Wizard";
}

//! Dates ==============================================================================

static class Appointment
{
    #region Constant values.
    private static readonly int _afternoonStartHour = 12;
    private static readonly int _afternoonEndHour = 18;
    private static readonly int _anniversaryMonth = 9;
    private static readonly int _anniversaryDay = 15;
    #endregion

    public static DateTime Schedule(string appointmentDateDescription)
        => DateTime.Parse(appointmentDateDescription);

    public static bool HasPassed(DateTime appointmentDate)
        => appointmentDate < DateTime.Now;

    public static bool IsAfternoonAppointment(DateTime appointmentDate)
        => (_afternoonStartHour <= appointmentDate.Hour) &&
            (_afternoonEndHour > appointmentDate.Hour);

    public static string Description(DateTime appointmentDate)
        => $"You have an appointment on {appointmentDate}.";

    public static DateTime AnniversaryDate()
        => new DateTime(DateTime.Now.Year, _anniversaryMonth, _anniversaryDay);
}

//! Manipulacion de arrays y metodos map filter =========================================
// Imperativo

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }


    public static int[] LastWeek() => new[] {0, 2, 5, 3, 7, 8, 4};

    public int Today()
        => birdsPerDay[birdsPerDay.Length - 1];

    public void IncrementTodaysCount()
        => birdsPerDay[birdsPerDay.Length - 1]++;

    public bool HasDayWithoutBirds()
    {
        bool response = false;
        foreach (int element in birdsPerDay)
            if(element == 0)
            {
                response = true;
                break;
            }
        return response;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int response = 0;
        for(int i = 0; i <= numberOfDays - 1; i++)
        {
            response += birdsPerDay[i];
        }
        return response;
    }

    public int BusyDays()
    {
        int response = 0;
        foreach(int element in birdsPerDay)
            if(element >= 5) response++;
        return response;
    }
}

// Functional


class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }


    public static int[] LastWeek() => new[] {0, 2, 5, 3, 7, 8, 4};

    public int Today()
        => birdsPerDay[^1];

    public void IncrementTodaysCount()
        => birdsPerDay[^1]++;

    public bool HasDayWithoutBirds()
        => birdsPerDay.Contains(0);

    public int CountForFirstDays(int numberOfDays)
        => birdsPerDay.Take(numberOfDays).Sum();

    public int BusyDays()
        => birdsPerDay.Count(element => element >= 5);
}

//! Char and a way way to filter and map elements

public static class Identifier
{
    #region Helper methods.
    private static bool IsGreekLowercase(char character)
        => (character >= 'α' && character <= 'ω');
    #endregion
    public static string Clean(string identifier)
    {
        var stringBuilder = new StringBuilder();
        var isAfterDash = false;

        foreach (char letter in identifier)
        {
            stringBuilder.Append(letter switch {
                _ when IsGreekLowercase(letter) => default,
                _ when isAfterDash => char.ToUpperInvariant(letter),
                _ when char.IsWhiteSpace(letter) => '_',
                _ when char.IsControl(letter) => "CTRL",
                _ when char.IsLetter(letter) => letter,
                _ => default,
            });
            isAfterDash = letter.Equals('-');
        }
        return stringBuilder.ToString();
    }
}
