// Bereich für das Einbinden von Bibliotheken und die Deklaration von Variablen.
#define INPUT_PIN   0
#define OUTPUT_PIN  0

#define INPUT_VOLT  HIGH
#define OUTPUT_VOLT HIGH

void setup() {
    pinMode(OUTPUT_PIN, OUTPUT);
}
 
void loop() {
    if (analogRead(INPUT_PIN) == INPUT_VOLT) {
        digitalWrite(OUTPUT_PIN, OUTPUT_VOLT);
    }
}