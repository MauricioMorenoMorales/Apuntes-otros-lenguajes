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
        if(speed == 0) return 0;
        else if(speed <= 4) return 1;
        else if(speed <= 8) return 0.9;
        else if(speed == 9) return 0.8;
        else return 0.77;
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

//! BUffers and bytes ======================================================


public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        var bytes = reading switch
        {
            < Int32.MinValue => BitConverter.GetBytes((long)reading).Prepend((byte)(256 - 8)),
            < Int16.MinValue => BitConverter.GetBytes((int)reading).Prepend((byte)(256 - 4)),
            < UInt16.MinValue => BitConverter.GetBytes((short)reading).Prepend((byte)(256 - 2)),
            <= UInt16.MaxValue => BitConverter.GetBytes((ushort)reading).Prepend((byte)2),
            <= Int32.MaxValue => BitConverter.GetBytes((int)reading).Prepend((byte)(256 - 4)),
            <= UInt32.MaxValue => BitConverter.GetBytes((uint)reading).Prepend((byte)4),
            _ => BitConverter.GetBytes((long)reading).Prepend((byte)(256 - 8)),
        };
        return bytes.Concat(new byte[9 - bytes.Count()]).ToArray();
    }

    public static long FromBuffer(byte[] buffer)
    => buffer[0] switch {
        256 - 8 or 4 or 2 => BitConverter.ToInt64(buffer, 1),
        256 - 4 => BitConverter.ToInt32(buffer, 1),
        256 - 2 => BitConverter.ToInt16(buffer, 1),
        _ => 0
    };
}

//! Lists ===========================================================================

public static class Languages
{
    public static List<string> NewList()
        => new List<string>();

    public static List<string> GetExistingLanguages()
    {
        var response = NewList();
        response.Add("C#");
        response.Add("Clojure");
        response.Add("Elm");
        return response;
    }

    public static List<string> AddLanguage(List<string> languages, string language)
    {
        languages.Add(language);
        return languages;
    }

    public static int CountLanguages(List<string> languages)
    {
        byte response = 0;
        foreach (string language in languages)
        {
            response++;
        }
        return response;
    }

    public static bool HasLanguage(List<string> languages, string language)
    {
        foreach(string element in languages)
            if(element == language) return true;
        return false;
    }

    public static List<string> ReverseList(List<string> languages)
    {
        languages.Reverse();
        return languages;
    }

    public static bool IsExciting(List<string> languages)
    {
        if(languages.Count() == 0) return false;
        if(languages[0] == "C#") return true;
        if(languages[1] == "C#" && (languages.Count() == 2 || languages.Count == 3)) return true;
        else return false;
    }

    public static List<string> RemoveLanguage(List<string> languages, string language)
    {
        List<string> response = NewList();
        foreach(string element in languages)
            if(element != language) response.Add(element);
        return response;
    }

    public static bool IsUnique(List<string> languages)
        => languages.Distinct().Count() == languages.Count();
}


public static class Languages
{
    public static List<string> NewList()
        => new List<string>();

    public static List<string> GetExistingLanguages()
    {
        List<string> response = new List<string>() {"C#", "Clojure", "Elm"};
        return response;
    }

    public static List<string> AddLanguage(List<string> languages, string language)
        => languages.Append(language).ToList();

    public static int CountLanguages(List<string> languages)
        => languages.Count();

    public static bool HasLanguage(List<string> languages, string language)
        => languages.Contains(language);

    public static List<string> ReverseList(List<string> languages)
        => languages.Reverse<string>().ToList();

    public static bool IsExciting(List<string> languages)
    {
        if(languages.Count() == 0) return false;
        else if(languages[0] == "C#") return true;
        else if(languages[1] == "C#" && (languages.Count() == 2 || languages.Count == 3)) return true;
        else return false;
    }

    public static List<string> RemoveLanguage(List<string> languages, string language)
        => languages.Where(element => element != language).ToList();

    public static bool IsUnique(List<string> languages)
        => languages.Distinct().Count() == languages.Count();
}

//! Dictionaries =============================================================================


public static class DialingCodes
{
    public static Dictionary<int, string> GetEmptyDictionary()
        => new Dictionary<int, string> {};

    public static Dictionary<int, string> GetExistingDictionary()
        => new Dictionary<int, string>{
            [1] = "United States of America",
            [55] = "Brazil",
            [91] = "India"
        };

    public static Dictionary<int, string> AddCountryToEmptyDictionary(int countryCode, string countryName)
    {
        Dictionary<int, string> response = new Dictionary<int, string> {};
        response[countryCode] = countryName;
        return response;
    }

    public static Dictionary<int, string> AddCountryToExistingDictionary(
        Dictionary<int, string> existingDictionary, int countryCode, string countryName)
    {
        existingDictionary[countryCode] = countryName;
        return existingDictionary;
    }

    public static string GetCountryNameFromDictionary(
        Dictionary<int, string> existingDictionary, int countryCode)
        => existingDictionary.ContainsKey(countryCode)
            ? existingDictionary[countryCode]
            : string.Empty;

    public static bool CheckCodeExists(Dictionary<int, string> existingDictionary, int countryCode)
        => existingDictionary.ContainsKey(countryCode);

    public static Dictionary<int, string> UpdateDictionary(
        Dictionary<int, string> existingDictionary, int countryCode, string countryName)
    {
        if(existingDictionary.ContainsKey(countryCode))
            existingDictionary[countryCode] = countryName;
        return existingDictionary;
    }

    public static Dictionary<int, string> RemoveCountryFromDictionary(
        Dictionary<int, string> existingDictionary, int countryCode)
    {
        existingDictionary.Remove(countryCode);
        return existingDictionary;
    }

    public static string FindLongestCountryName(Dictionary<int, string> existingDictionary)
    {
        string response = "";
        foreach (KeyValuePair<int, string> element in existingDictionary)
            if (element.Value.Length > response.Length)
                response = element.Value;
        return response;
    }
}

// More functional version ===============================================================


public static class DialingCodes
{
    public static Dictionary<int, string> GetEmptyDictionary()
        => new();

    public static Dictionary<int, string> GetExistingDictionary()
        => new Dictionary<int, string>{
            [1] = "United States of America",
            [55] = "Brazil",
            [91] = "India"
        };

    public static Dictionary<int, string> AddCountryToEmptyDictionary(int countryCode, string countryName)
        => new() {
            [countryCode] = countryName,
        };

    public static Dictionary<int, string> AddCountryToExistingDictionary(
        Dictionary<int, string> existingDictionary, int countryCode, string countryName)
    {
        existingDictionary.Add(countryCode, countryName);
        return existingDictionary;
    }

    public static string GetCountryNameFromDictionary(
        Dictionary<int, string> existingDictionary, int countryCode)
        => existingDictionary.ContainsKey(countryCode)
            ? existingDictionary[countryCode]
            : string.Empty;

    public static bool CheckCodeExists(Dictionary<int, string> existingDictionary, int countryCode)
        => existingDictionary.ContainsKey(countryCode);

    public static Dictionary<int, string> UpdateDictionary(
        Dictionary<int, string> existingDictionary, int countryCode, string countryName)
    {
        if(existingDictionary.ContainsKey(countryCode))
            existingDictionary[countryCode] = countryName;
        return existingDictionary;
    }

    public static Dictionary<int, string> RemoveCountryFromDictionary(
        Dictionary<int, string> existingDictionary, int countryCode)
    {
        existingDictionary.Remove(countryCode);
        return existingDictionary;
    }

    public static string FindLongestCountryName(Dictionary<int, string> existingDictionary)
        => existingDictionary.Count == 0
            ? string.Empty
            : existingDictionary.Values.Max();
}

//! Nullable values and default values from nullables

// Bad implementation
static class Badge
{
    public static string Print(int? id, string name, string? department)
        =>  (id != null && department == null) ? $"[{id}] - {name} - OWNER" :
            (department == null) ? $"{name} - OWNER" :
            (id == null) ? $"{name} - {department.ToUpper()}"
            : $"[{id}] - {name} - {department.ToUpper()}";
}

// Good implementation


static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        department = (department ?? "Owner").ToUpper();

        return id.HasValue switch {
            true => $"[{id}] - {name} - {department}",
            false => $"{name} - {department}",
        };
    }
}

// Alternative


static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        department = (department ?? "Owner").ToUpper();

        return id.HasValue
            ? $"[{id}] - {name} - {department}"
            : $"{name} - {department}";
    }
}

//! Switch =====================================================================


public static class PlayAnalyzer
{
    public static string AnalyzeOnField(int shirtNum)
    {
        string response;
        switch (shirtNum)
        {
            case 1:
                response = "goalie";
                break;
            case 2:
                response = "left back";
                break;
            case 3:
            case 4:
                response = "center back";
                break;
            case 5:
                response = "right back";
                break;
            case 6:
            case 7:
            case 8:
                response = "midfielder";
                break;
            case 9:
                response = "left wing";
                break;
            case 10:
                response = "striker";
                break;
            case 11:
                response = "right wing";
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
        return response;
    }

/* This switch casts the type of the object and declares variables that you can
aalso check using guards */
    public static string AnalyzeOffField(object report)
    {
        string message;
        switch (report)
        {
            case int:
                message = $"There are {report} supporters at the match.";
                break;
            case string:
                message = (string)report;
                break;
            case Foul foul:
                message = foul.GetDescription();
                break;
            case Injury injury:
                message = $"Oh no! {injury.GetDescription()} Medics are on the field.";
                break;
            case Incident incident:
                message = incident.GetDescription();
                break;
            case Manager manager when manager.Club == null:
                message = manager.Name;
                break;
            case Manager manager:
                message = $"{manager.Name} ({manager.Club})";
                break;
            default:
                throw new ArgumentException();
        }
        return message;
    }
}

// Compact version
public static class PlayAnalyzer
{
    public static string AnalyzeOnField(int shirtNum)
    => shirtNum switch {
        1 => "goalie",
        2 => "left back",
        3 or 4 => "center back",
        5 => "right back",
        6 or 7 or 8 => "midfielder",
        9 => "left wing",
        10 => "striker",
        11 => "right wing",
        _ => throw new ArgumentOutOfRangeException()
    };

    public static string AnalyzeOffField(object report)
    => report switch {
        int supporters => $"There are {supporters} supporters at the match.",
        string announcement => announcement,
        Injury injury => $"Oh no! {injury.GetDescription()} Medics are on the field.",
        Incident incident => incident.GetDescription(),
        Manager manager => manager.Club == null
            ? manager.Name
            : $"{manager.Name} ({manager.Club})",
        _ => throw new ArgumentException(nameof(report), $"Not expected data type: {report}")
    };
}

//! Random numbers ================================================================


public class Player
{
    private Random random = new Random();
    private static readonly double maxStrength = 100.0;
    public int RollDie() => random.Next(1, 18);

    public double GenerateSpellStrength()
        => random.NextDouble() * maxStrength;
}

//! Bitwise and flag enums ======================================================


// TODO: define the 'AccountType' enum
enum AccountType
{
    Guest,
    User,
    Moderator
}

// TODO: define the 'Permission' enum
[Flags]
enum Permission : byte
{
    Read = 1 << 0,
    Write = 1 << 1,
    Delete = 1 << 2,
    All = Read | Write | Delete,
    None = 0
}


static class Permissions
{
    public static Permission Default(AccountType accountType)
    => accountType switch {
        AccountType.Guest => Permission.Read,
        AccountType.User => Permission.Read | Permission.Write,
        AccountType.Moderator => Permission.All,
        _ => Permission.None
    };

    public static Permission Grant(Permission current, Permission grant)
    => current | grant;

    public static Permission Revoke(Permission current, Permission revoke)
    => current & ~revoke;

    public static bool Check(Permission current, Permission check)
    => current.HasFlag(check);
}

//! Typeofs =========================================================================


public class SecurityPassMaker
{
    public string GetDisplayName(TeamSupport support)
    => support switch {
        _ when support.GetType() == typeof(Security) => "Security Team Member Priority Personnel",
        _ when support is Manager => "Too Important for a Security Pass",
        _ => support.Title
    };
}
