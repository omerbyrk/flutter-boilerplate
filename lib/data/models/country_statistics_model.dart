import 'model_base.dart';

class CountryStatisticsModel implements ModelBase{
  String countryName;
  String cases;
  String deaths;
  String region;
  String totalRecovered;
  String newDeaths;
  String newCases;
  String seriousCritical;
  String activeCases;
  String totalCasesPer1mPopulation;
  String deathsPer1mPopulation;
  String totalTests;
  String testsPer1mPopulation;

  CountryStatisticsModel(
      {this.countryName,
      this.cases,
      this.deaths,
      this.region,
      this.totalRecovered,
      this.newDeaths,
      this.newCases,
      this.seriousCritical,
      this.activeCases,
      this.totalCasesPer1mPopulation,
      this.deathsPer1mPopulation,
      this.totalTests,
      this.testsPer1mPopulation});

  CountryStatisticsModel.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    cases = json['cases'];
    deaths = json['deaths'];
    region = json['region'];
    totalRecovered = json['total_recovered'];
    newDeaths = json['new_deaths'];
    newCases = json['new_cases'];
    seriousCritical = json['serious_critical'];
    activeCases = json['active_cases'];
    totalCasesPer1mPopulation = json['total_cases_per_1m_population'];
    deathsPer1mPopulation = json['deaths_per_1m_population'];
    totalTests = json['total_tests'];
    testsPer1mPopulation = json['tests_per_1m_population'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['region'] = this.region;
    data['total_recovered'] = this.totalRecovered;
    data['new_deaths'] = this.newDeaths;
    data['new_cases'] = this.newCases;
    data['serious_critical'] = this.seriousCritical;
    data['active_cases'] = this.activeCases;
    data['total_cases_per_1m_population'] = this.totalCasesPer1mPopulation;
    data['deaths_per_1m_population'] = this.deathsPer1mPopulation;
    data['total_tests'] = this.totalTests;
    data['tests_per_1m_population'] = this.testsPer1mPopulation;
    return data;
  }
}