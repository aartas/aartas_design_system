
String getMonths(int? i, bool? full) {
  if (i == 1) {
    return full! ? "January" : "Jan";
  }
  if (i == 2) {
    return full! ? "February" : "Feb";
  }
  if (i == 3) {
    return full! ? "March" : "Mar";
  }
  if (i == 4) {
    return full! ? "April" : "Apr";
  }
  if (i == 5) {
    return full! ? "May" : "May";
  }
  if (i == 6) {
    return full! ? "June" : "Jun";
  }
  if (i == 7) {
    return full! ? "July" : "Jul";
  }
  if (i == 8) {
    return full! ? "August" : "Aug";
  }
  if (i == 9) {
    return full! ? "September" : "Sep";
  }
  if (i == 10) {
    return full! ? "October" : "Oct";
  }
  if (i == 11) {
    return full! ? "November" : "Nov";
  }
  if (i == 12) {
    return full! ? "December" : "Dec";
  }
  return "?";
}