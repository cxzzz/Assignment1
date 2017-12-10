class ShipInfo {
  String shipName;
  int year;
  float firingRate;
  float maxSpeed;
  float weight;
  
  ShipInfo(TableRow row) {
    shipName = row.getString("Name");
    year = row.getInt("Year");
    firingRate = row.getFloat("Firing Rate");
    maxSpeed = row.getFloat("Max Speed");
    weight = row.getFloat("Weight");
  }
}