/*
Gibt ein analoges Signal 1:1 als analoges Signal weiter
Pins sind:
    IN:     0 (analog)
    OUT:    9 (analog)
*/

void setup() {
    pinMode(9, OUTPUT);
}
 
void loop() {
    int current = analogRead(0);

    if (current < 0)
        current = 0;
    else if (current > 255)
        current = 255;

    analogWrite(9, current);
}
