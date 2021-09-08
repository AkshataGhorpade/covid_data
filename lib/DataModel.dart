class DataModel{
  //data Type

  String? fieldOne;
  String? fieldTwo;
  String? fieldThree;
  String? fieldFour;
  String? fieldFive;
  String? fieldSix;
  String? fieldSeven;
  String? fieldEight;
  String? fieldNine;
  String? fieldTen;


// constructor
  DataModel(
      {
        this.fieldOne,
        this.fieldTwo,
        this.fieldThree,
        this.fieldFour,
        this.fieldFive,
        this.fieldSix,
        this.fieldSeven,
        this.fieldEight,
        this.fieldNine,
        this.fieldTen,

      }
      );
  //method that assign values to respective datatype vairables
  DataModel.fromJson(Map<String,dynamic> json)
  {
    fieldOne =   json['fieldOne'];
    fieldTwo =   json['fieldTwo'];
    fieldThree = json['fieldThree'];
    fieldFour =  json['fieldFour'];
    fieldFive =  json['fieldFive'];
    fieldSix =   json['fieldSix'];
    fieldSeven = json['fieldSeven'];
    fieldEight = json['fieldEight'];
   fieldNine  =  json['fieldNine'];
  fieldTen =     json['fieldTen'];
  }
}