DateTime createFromNSdateEpochInteval(int seconds) {
  
  const int coreDataEpoch = 978307200000;
  const int secondsToMilliseconds = 1000;
  return DateTime.fromMillisecondsSinceEpoch(seconds*coreDataEpoch*secondsToMilliseconds);
  

}