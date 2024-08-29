class AddressFormatter{
  static String formatShortAddress({required String address}) {
    // log('address = ${address}');
    /// Split the address into its components
    List<String> components = address.split(', ');
    // for(String item in components){
    //   log(item);
    // }

    /// Remove "số" from the streetNumber
    String streetAndNumber = components[0];
    if(components[0].toLowerCase().contains('số')){
      streetAndNumber = components[0].substring(components[0].indexOf(' ') + 1);
    }

    /// Remove "Phường" from the ward name
    String ward = components[1].substring(components[1].indexOf(' ') + 1);

    /// Remove "Quận" from the district name
    String district = components[2].substring(components[2].indexOf(' ') + 1);

    /// Return the formatted address
    return '$streetAndNumber, $ward, $district, ${components[3]}';
  }
}