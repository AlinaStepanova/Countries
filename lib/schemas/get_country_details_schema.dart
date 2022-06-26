class GetCountryDetailsSchema {
  static String countryDetailsJson = """
    {
      country(code: "\$code") {
        code 
        name
        emoji
        capital
        currency
      }
    }
  """;
}
