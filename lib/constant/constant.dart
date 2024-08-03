class Constants {
  static const String mapmycrop_url = "https://api.mapmycrop.com/satellite/field-imagery?api_key=84246efe39a445a99f5178ffee413eee&farm_id=11099a48c9514b44bcd9aaa1978ea236&index=NDVI&satellite=S1&satellite_date=2024-06-24";

  static const String appBarName="Sell Produce";
  static const String typeOfCrop="Type of Crop";
  static const String variety="Variety";
  static const String varietyOfProduct="Variety of Product";
  static const String expectedQuantity="Expected Quantity";
  static const String quantity="Quantity";
  static const String price="Price (per Kg)";
  static const String typeYourPrice="Type Your Price";
  static const String writeSomething="Write Something";
  static const String note="Note";
  static const String kg="kg";
  static const String images="Images";
  static const String image1="Image1";
  static const String image2="Image2";
  static const String addMyProduce="Add My Produce";
  static const String selectCrop="Select Crop";
  static const String polyGone="PolyGone Coordinate In GoogleMap";
  static const String byteImage="API Byte Image ";

}

String? selectedCrop;
List<String> crops = ['Wheat', 'Corn', 'Rice'];

String? selectedQuantity;
List<String> quantity = ['kg' , 'g'];