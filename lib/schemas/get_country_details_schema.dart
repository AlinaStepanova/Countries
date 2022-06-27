class GetCountryDetailsSchema {
  static String countryDetailsJson = """
    {
      country(code: "\$code") {
        code 
        name
        emoji
        capital
        currency
        languages {
          name
        }
        states {
          name
        }
        continent {
          name
        }
      }
    }
  """;
}
