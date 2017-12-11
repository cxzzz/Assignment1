public class StarMap {
  String displayName;
  float distance;
  float mag;
  PVector screenXY;
  PVector starPos;
  
  StarMap(TableRow row) {
    displayName = row.getString("Display Name");
    distance = row.getFloat("Distance");
    starPos = new PVector(row.getFloat("Xg"), row.getFloat("Yg"));
    mag = row.getFloat("AbsMag");
    screenXY = new PVector(
      map(starPos.x, -5, 5, 50, width / 2 + 150),
      map(starPos.y, -5, 5, 50, height / 2 + 100));  
  }

}