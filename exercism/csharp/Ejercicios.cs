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
