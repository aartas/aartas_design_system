String getWeekDays(int? i, bool? full) {
  if (i == 1) {
    return full! ? "Monday" : "Mon";
  }
  if (i == 2) {
    return full! ? "Tuesday" : "Tue";
  }
  if (i == 3) {
    return full! ? "Wednesday" : "Wed";
  }
  if (i == 4) {
    return full! ? "Thursday" : "Thu";
  }
  if (i == 5) {
    return full! ? "Friday" : "Fri";
  }
  if (i == 6) {
    return full! ? "Saturday" : "Sat";
  }
  if (i == 7) {
    return full! ? "Sunday" : "Sun";
  }
  return "?";
}
