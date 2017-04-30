const int countDownS = 10;
int countDownMs = countDownS * 1000;

#define OUTPUT_PIN          9
#define SEGMENTS            10
#define BLINKS_PER_SEGMENT  5

class Segment {
public:
  Segment(float targetTime)
    : targetTime_(targetTime) {
  }

  float getCurrentTime() const {
    return currentTime_;
  }

  float getTargetTime() const {
    return targetTime_;
  }

  float getBlinkPeriodTime() const {
    return getTargetTime() / BLINKS_PER_SEGMENT;
  }

  void tick() {
    while (!elapsed()) {
      digitalWrite(OUTPUT_PIN, HIGH);
      digitalWrite(OUTPUT_PIN, LOW);
      delay(getBlinkPeriodTime());
      currentTime_ += getBlinkPeriodTime();
    }
  }

  bool elapsed() const {
    return currentTime_ >= targetTime_;
  }

private:
    float currentTime_ = 0.f;
    float targetTime_ = 0.f;
}

int currentSegment = 0;
Segment segments[SEGMENTS];

void setup() {
  pinMode(OUTPUT_PIN, OUTPUT);

  float j = static_cast<float>(countDownMs);

  for (int i = 0; i < SEGMENTS; ++i)
    segments[i] = j /= 2.f;
}

void loop() {
  for (int i = 0; i < SEGMENTS; ++i)
    segments[i].tick();
}
