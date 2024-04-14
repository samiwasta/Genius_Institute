//// Enumerations for readability

int REGULAR = 0;
int DROPOUT = 1;

Map<int, String> studentTypeStrings = {
  REGULAR: "Regular",
  DROPOUT: "Dropout"
};

int JEE = 0;
int NEET = 1;
int cetM = 2;
int cetB = 3;

int MATH = 0;
int PHY = 1;
int BIO = 2;
int CHEM = 3;

Map<int, String> examStrings = {
  JEE: "JEE Exam",
  NEET: "NEET Exam",
  cetB: "MHT CET (BIO)",
  cetM: "MHT CET (MATH)"
};

Map<int, String> subjectStrings = {
  MATH: "Mathematics",
  CHEM: "Chemistry",
  BIO: "Biology",
  PHY: "Physics"
};

// Preparation Length
// 8 - 12 Months
int LONG = 0; // Sundays Off

// 4 - 8 Months
int MEDIUM = 1; // Alternate Sundays Off

// 0 - 4 Months
int SHORT = 2; // No Sundays Off


int SUN = 0;
int MON = 1;
int TUE = 2;
int WED = 3;
int THU = 4;
int FRI = 5;
int SAT = 6;


Map<int, String> weekDayString = {
  SUN: "Sunday",
  MON: "Monday",
  TUE: "Tuesday",
  WED: "Wednesday",
  THU: "Thursday",
  FRI: "Friday",
  SAT: "Saturday",
};




//////// Input Variables //////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////


int studentType = DROPOUT;

// Reflects the college end time of a regular student or the start time of the time table
int startTimeHour = 12;
int startTimeMin =00;
List<int> examsPrep = [NEET, JEE];

List<int> subjectsDifficulty = [CHEM, BIO, PHY];



int? prepLength = MEDIUM;

int? dailyHoursIndex = 2; // 8 Hours

int? maxDailySubjects = 4;



/////// Output Variables to be displayed in the UI //////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// List of week wise timetables (stored as dart maps)

List<Map<dynamic, dynamic>> TimeTable = [];

int? slotLength;



// CLick the small green play button besides the function name to run
void getTimeTable() {


  // Subjects in the exams are sorted according to difficulty (default)
  Map<int, Set<int>> subjects = {
    JEE: {MATH, PHY, CHEM},
    NEET: {BIO, CHEM, PHY},
    cetB: {BIO, PHY, CHEM},
    cetM: {MATH, PHY, CHEM}
  };


  Set<int> subjectsPrep = {};

  // Finding the union of all subjects in the selected exams
  for (int exam in examsPrep){
    subjectsPrep = subjectsPrep.union(subjects[exam]!);
  }

  // Sunjects ranked according ascending order of thier difficulty
  // Defualt ranking
  if (subjectsDifficulty.length < 2) {
    subjectsDifficulty = subjectsPrep.toList();
  }


  List<int> dailyHoursChoice = [4, 6, 8];
  if (studentType == DROPOUT) {
    dailyHoursChoice.addAll([10, 12]);
  }


  int dailyHours = dailyHoursChoice[dailyHoursIndex!];

  // If totalHours calculated later < dailyHours then simply decrement dailyHoursIndex

  if (maxDailySubjects! > subjectsPrep.length) {
    maxDailySubjects = subjectsPrep.length;
  }



  Map subjectDifficultyProportion = {};

  int n = subjectsDifficulty.length;


  for (int pos=0; pos<n; pos++) {
    subjectDifficultyProportion[subjectsDifficulty[pos]] = ((pos + 1) / ((n * (n + 1)) / 2));
  }


  int sundaySlots = 1;
  int saturdaySlots = 1;
  int remainingDaySlots = 1;

  if (maxDailySubjects == 2) {
    sundaySlots = 2;
    saturdaySlots = 2;
  }

  else if  (maxDailySubjects == 3) {
    sundaySlots = 3;
    saturdaySlots = 2;
  }

  else if (maxDailySubjects == 4) {
    sundaySlots = 4;
    saturdaySlots = 3;
    remainingDaySlots = 2;
  }


  Map dailySlots = {
  SUN: sundaySlots,
  MON: remainingDaySlots,
  TUE: remainingDaySlots,
  WED: remainingDaySlots,
  THU: remainingDaySlots,
  FRI: remainingDaySlots,
  SAT: saturdaySlots
  };


  // Calculating the total number of slots in a week
  // We can directly assign them a static value using maxDailySubjects
  // Or calculate them dynamically by adding all the slots
  int totalSlotsWithSunday = 0;
  int totalSlotsWithoutSunday = 0;

  //

  dailySlots.forEach((day, slots) {
    totalSlotsWithSunday += slots as int;
    if (day != SUN) {
      totalSlotsWithoutSunday += slots;
    }
  });



  Map slotsPerSubjectWithSunday = {};
  Map slotsPerSubjectWithoutSunday = {};

  subjectDifficultyProportion.forEach((subject, difficultyProportion) {
    slotsPerSubjectWithSunday[subject] = (difficultyProportion * totalSlotsWithSunday).ceil();
    slotsPerSubjectWithoutSunday[subject] = (difficultyProportion * totalSlotsWithoutSunday).ceil();
  });





  // Allocating slots to weekdays
  List raffleBox = [];

  // Adding all slots to the raffleBox
  slotsPerSubjectWithSunday.forEach((subject, slots) {
    Iterable<int> range = Iterable.generate(slots);
    for (int i in range) {
      raffleBox.add(subject);
    }
  });



  raffleBox.shuffle();

  Map SundayTimeTable = {
  SUN: [],
  MON: [],
  TUE: [],
  WED: [],
  THU: [],
  FRI: [],
  SAT: [],
  };


  // Adding Sunday Slots

  for (int i=0; i<sundaySlots; i++) {
    SundayTimeTable[SUN].add(raffleBox[0]);
    raffleBox.removeAt(0);
  }



  // Adding Saturday Slots

  for (int i=0; i<saturdaySlots; i++) {
    SundayTimeTable[SAT].add(raffleBox[0]);
    raffleBox.removeAt(0);
  }


  // Adding Remaining Slots

  SundayTimeTable.forEach((day, value) {
    if (day != SUN && day != SAT) {
      for (int i=0; i<remainingDaySlots; i++) {
        SundayTimeTable[day].add(raffleBox[0]);
        raffleBox.removeAt(0);
      }
    }

  });



  // Allocating slots to weekdays
  raffleBox = [];

  // Adding all slots to the raffleBox
  slotsPerSubjectWithoutSunday.forEach((subject, slots) {
    for (int i=0; i<slots; i++) {
      raffleBox.add(subject);
    }
  });



  raffleBox.shuffle();

  Map NonSundayTimeTable = {
  SUN: [],
  MON: [],
  TUE: [],
  WED: [],
  THU: [],
  FRI: [],
  SAT: [],
  };


  // Adding Saturday Slots

  for (int i=0; i<saturdaySlots; i++) {
    NonSundayTimeTable[SAT].add(raffleBox[0]);
    raffleBox.removeAt(0);
  }


  // Adding Remaining Slots

  NonSundayTimeTable.forEach((day, value) {
    if (day != SUN && day != SAT) {
      for (int i=0; i<remainingDaySlots; i++) {
        NonSundayTimeTable[day].add(raffleBox[0]);
        raffleBox.removeAt(0);
      }
    }
  });


  DateTime now = DateTime.now();

  // Define the time of midnight (00:00) and start time (20:00)
  DateTime midnightDateTime = DateTime(now.year, now.month, now.day, 20, 0);
  DateTime startDateTime = DateTime(now.year, now.month, now.day, startTimeHour, startTimeMin);

  // Calculate total study hours on a week day
  double totalHours = (startDateTime.difference(midnightDateTime).inSeconds / 3600).abs();

  // If totalHours exceeds dailyHours
  if (totalHours > dailyHours) {
    totalHours = dailyHours as double;
  }

  // Adjust hours on Sunday automatically due to the increase in the number of slots
  slotLength = (totalHours / remainingDaySlots).floor(); // Use floor to get integer division result


  if (prepLength == SHORT) {
    TimeTable.add(NonSundayTimeTable);
  } else if  (prepLength == MEDIUM)
    for (int i=0; i<4; i++) {
      if (i%2 == 0) {
        TimeTable.add(SundayTimeTable);
      } else {
        TimeTable.add(NonSundayTimeTable);
      }
    }
  else
    TimeTable.add(SundayTimeTable);


  print(slotLength);
  print(TimeTable);



}


