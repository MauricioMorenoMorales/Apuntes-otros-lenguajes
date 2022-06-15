package lasagna

// TODO: define the 'OvenTime' constant
const (
	OvenTime             int = 40
	LayerPreparationTime int = 2
)

// RemainingOvenTime returns the remaining minutes based on the `actual` minutes already in the oven.
func RemainingOvenTime(actualMinutesInOven int) int {
	return OvenTime - actualMinutesInOven
}

// PreparationTime calculates the time needed to prepare the lasagna based on the amount of layers.
func PreparationTime(numberOfLayers int) int {
	return LayerPreparationTime * numberOfLayers
}

// ElapsedTime calculates the total time needed to create and bake a lasagna.
func ElapsedTime(numberOfLayers, actualMinutesInOven int) int {
	return actualMinutesInOven + PreparationTime(numberOfLayers)
}

// Booleans ==============================================================================================
// CanFastAttack can be executed only when the knight is sleeping
func CanFastAttack(knightIsAwake bool) bool {
	return !knightIsAwake
}

// CanSpy can be executed if at least one of the characters is awake
func CanSpy(knightIsAwake, archerIsAwake, prisonerIsAwake bool) bool {
	return (knightIsAwake || archerIsAwake || prisonerIsAwake)
}

// CanSignalPrisoner can be executed if the prisoner is awake and the archer is sleeping
func CanSignalPrisoner(archerIsAwake, prisonerIsAwake bool) bool {
	return (prisonerIsAwake && !archerIsAwake)
}

// CanFreePrisoner can be executed if the prisoner is awake and the other 2 characters are asleep
// or if Annalyn's pet dog is with her and the archer is sleeping
func CanFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent bool) bool {
	return (petDogIsPresent && !archerIsAwake ||
		(prisonerIsAwake && !knightIsAwake && !archerIsAwake))
}
//! You can simplify booleans picking the repeated statements
func CanFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent bool) bool {
	return (petDogIsPresent && !archerIsAwake ||
		(prisonerIsAwake && !knightIsAwake && !archerIsAwake))
}

