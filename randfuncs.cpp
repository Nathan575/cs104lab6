#include "randfuncs.h"
#include <cstdlib>
#include <ctime>

void seed_random() {
    srand(time(0));  // Seed random number generator
}

std::string flip_coin() {
    return (rand() % 2 == 0) ? "Heads" : "Tails";
}

int roll_six_sided_die() {
    return (rand() % 6) + 1;  // Random number between 1 and 6
}

int roll_twenty_sided_die() {
    return (rand() % 20) + 1; // Random number between 1 and 20
}
