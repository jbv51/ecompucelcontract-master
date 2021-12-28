import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'SessionManager.dart';


class LocaleBase {
  Map<String, dynamic> _data;

  Future<void> load(String path) async {
    // final strJson = await rootBundle.loadString(path);
    // _data = jsonDecode(strJson);
    // initAll();
  }

  Localemain _main;

  Localemain get main => _main;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data));
  }
}

class Localemain {
  final Map<String, String> _data;

  Localemain(this._data);

  Future<String> getString(String name) async {
    return _data[name];
  }

  String get RowNumber => _data["RowNumber"];
  String get variable => _data["variable"];
  String get ExpenseDetails => _data["ExpenseDetails"];
  String get ScanSuccessful => _data["Scan Successful"];
  String get AddedSuccessfully => _data["Added Successfully"];
  String get Stickernotfoundpleasescan => _data["Sticker not found please scan"];
  String get SeasondoesnotMatch => _data["Season does not Match"];
  String get CropdoesnotMatch => _data["Crop does not Match"];
  String get Pleasescansamestickernumber => _data["Please scan same sticker number"];
  String get ScanningofstickerscannotbemorethanPrintedStickers => _data["Scanning of stickers cannot be more than Printed Stickers"];
  String get TotalStickersscanned => _data["Total Stickers scanned"];
  String get PleasescanatleastoneSticker => _data["Please scan at least one Sticker"];
  String get PleaseselecttheSeason => _data["Please select the Season"];
  String get PleaseselecttheCrop => _data["Please select the Crop"];
  String get ScanSticker => _data["ScanSticker"];
  String get Upload => _data["Upload"];
  String get Scan => _data["Scan"];
  String get ScannedStickers => _data["ScannedStickers"];
  String get StickerNumber => _data["StickerNumber"];
  String get MachineDetails => _data["MachineDetails"];
  String get TotalNoofRows => _data["TotalNoofRows"];
  String get CreateTaskDetails => _data["CreateTaskDetails"];
  String get StartDate => _data["StartDate"];
  String get AssetName => _data["AssetName"];
  String get AssetType => _data["AssetType"];
  String get MachineType => _data["MachineType"];
  String get Own => _data["Own"];
  String get Rented => _data["Rented"];
  String get MaintenanceType => _data["MaintenanceType"];
  String get Internal => _data["Internal"];
  String get External => _data["External"];
  String get FarmerSurvey => _data["FarmerSurvey"];
  String get MachineMaintenance => _data["MachineMaintenance"];
  String get HarvestingDetails => _data["Harvesting Details"];
  String get HarvestForecastByGrower => _data["Harvest Forecast By Grower"];
  String get Expenses => _data["Expenses"];
  String get LabourMale => _data["Labour (Male)"];
  String get LabourFemale => _data["Labour (Female)"];
  String get OvertimeHrs => _data["Overtime (Hrs)"];
  String get HarvestedQtyKg => _data["Harvested Qty (Kg)"];

  String get LabourDetails => _data["LabourDetails"];
  String get ContractorName => _data["Contractor Name"];

  String get ContractorContractName => _data["Contractor >> Contract Name"];

  String get OwnedRented => _data["OwnedRented"];

  String get PleaseselectToRowfirst => _data["PleaseselectToRowfirst"];

  String get PleaseselectFromTreefirst => _data["PleaseselectFromTreefirst"];

  String get PleaseselectFromRowfirst => _data["Please select From Row first."];

  String get RowsCovered => _data["RowsCovered"];

  String get TreesCovered => _data["TreesCovered"];

  String get AreaCovered => _data["AreaCovered"];

  String get AreaCoveredUnit => _data["AreaCoveredUnit"];

  String get Task => _data["Task"];

  String get hhmm => _data["hhmm"];

  String get NumberofDaysTaskToBePerform =>
      _data["NumberofDaysTaskToBePerform"];

  String get CreateTask => _data["CreateTask"];

  String get AllocatedTo => _data["AllocatedTo"];

  String get EndDate => _data["EndDate"];

  String get NoofDaysRequired => _data["NoofDaysRequired"];

  String get More => _data["More"];

  String get Messaging => _data["Messaging"];

  String get ChatBot => _data["ChatBot"];

  String get SampleSize => _data["SampleSize"];

  String get QCTemplateName => _data["QC Template Name"];

  String get QCParameters => _data["QCParameters"];

  String get FieldQC => _data["FieldQC"];

  String get GRNNumber => _data["GRNNumber"];

  String get Pleaseselectatleastthreecoordinates =>
      _data["Please select at least three co ordinates."];

  String get Save => _data["Save"];

  String get Undo => _data["Undo"];

  String get ApproxArea => _data["ApproxArea"];

  String get Youcangeotagplotbymovingyourself =>
      _data["Youcangeotagplotbymovingyourself"];

  String get EmployeeRegistration => _data["Employee Registration"];

  String get MultiplotRecordKeeping => _data["Multiplot Record Keeping"];

  String get SchemeRegistration => _data["Scheme Registration"];

  String get Somethingwentwrong => _data["Something went wrong"];

  String get Retry => _data["Retry"];

  String get ConnectionLost => _data["Connection Lost"];

  // String get getStringL => _data[name];
  String get SalesBooking => _data["SalesBooking"];

  String get InitialisingProcessPleaseBeSteady =>
      _data["InitialisingProcessPleaseBeSteady"];

  String get Scannedplotdoesnotexits =>
      _data["2) Scanned plot does not exits."];

  String get Scannedplotsnotapprovedorconfirmed =>
      _data["3) Scanned plot not approved or confirmed."];

  String get Plotscropmaybedifferentfromselected =>
      _data["4) Plot's crop may be different from selected."];

  String get Latitude => _data["Latitude"];

  String get Longitude => _data["Longitude"];

  String get ExpectedFirstHarvestDate => _data["Expected First Harvest Date"];

  String get SowingPruningDate => _data["Sowing Pruning Date"];

  String get CropNameCropVariety => _data["Crop_Name_Crop_Variety"];

  String get RemoveGeotagging => _data["Remove Geo tagging"];

  String get DefaultLayer => _data["Default Layer"];

  String get Transactions => _data["Transactions"];

  String get CropAgeDays => _data["Crop Age (Days)"];

  String get PlantingSowingDate => _data["Planting/Sowing Date"];

  String get CropNameVariety => _data["CropNameVariety"];

  String get FieldOfficer => _data["Field Officer"];

  String get WaterResourceDetails => _data["Water Resource Details"];

  String get PropertyDetails => _data["Property Details"];

  String get CropProfileDetails => _data["Crop Profile Details"];

  String get FarmerPlotDetails => _data["Farmer Plot Details"];

  String get ContractNo => _data["Contract No."];

  String get Surveillance => _data["Surveillance"];

  String get Selected => _data["Selected"];

  String get SelectLayer => _data["SelectLayer"];

  String get Please => _data["Please"];

  String get SelectCategory => _data["SelectCategory"];

  String get SelectSubCategory => _data["SelectSubCategory"];

  String get ProductionDetails => _data["ProductionDetails"];

  String get Pleaseselectplot => _data["Pleaseselectplot"];

  String get InvalidTotalWeight => _data["InvalidTotalWeight"];

  String get Pleaseselectpackhouse => _data["Pleaseselectpackhouse"];

  String get InvalidActualWeight => _data["InvalidActualWeight"];

  String get NoStockAvailable => _data["No Stock Available"];

  String get Weight => _data["Weight"];

  String get PlotSubPlot => _data["PlotSubPlot"];

  String get ActualWeight => _data["ActualWeight"];

  String get PostProductionProcess => _data["PostProductionProcess"];

  String get CollectionPointDefault => _data["Collection Point/Default"];

  String get EstimateProduction => _data["EstimateProduction"];

  String get NumberOfTrees => _data["NumberOfTrees"];

  String get LabourNotFoundPleaseSync => _data["LabourNotFoundPleaseSync"];

  String get LabourisnotActive => _data["Labour is not Active"];

  String get Noaccesstothesite => _data["No access to the site"];

  String get Labouriscurrentlyworking => _data["Labour is currently working."];

  String get Qrcodenotvalid => _data["Qr code not valid."];

  String get SearchLabour => _data["Search Labour"];

  String get Cantselectlaboursfromdifferentsites =>
      _data["Can't select labours from different sites."];

  String get SelectAll => _data["Select All"];

  String get SelectLabour => _data["Select Labour"];

  String get LaboursSelected => _data["Labours Selected"];

  String get SuperVisorHours => _data["Super Visor Hours"];

  String get Other => _data["Other"];

  String get Cloudy => _data["Cloudy"];

  String get WaterResource => _data["Water Resource"];

  String get Pleaseselecttimegreaterthanstarttime =>
      _data["Please select time greater than start time !"];

  String get SupervisorList => _data["Supervisor List"];

  String get ClimateCondition => _data["Climate Condition"];

  String get InvalidFlowRateQuantity => _data["Invalid Flow Rate Quantity !"];

  String get Pleaseselectunit => _data["Please select unit !"];

  String get InvalidWaterUsedQuantity => _data["Invalid Water Used Quantity !"];

  String get WaterUsedquantitycantbeEmpty =>
      _data["Water Used quantity can't be Empty !"];

  String get InvalidTotalHours => _data["Invalid Total Hours !"];

  String get FlowrateperAcre => _data["Flow rate per Acre"];

  String get InvalidSupervisorHours => _data["Invalid Supervisor Hours !"];

  String get nodot => _data["no."];

  String get PackHouse => _data["PackHouse"];

  String get ProductName => _data["Product Name"];

  String get NoCases => _data["No. Cases"];

  String get MethodUsed => _data["Method Used"];

  String get GrossWeight => _data["Gross Weight"];

  String get NetWeight => _data["Net Weight"];

  String get FlowRate => _data["Flow Rate"];

  String get IrrigationSystem => _data["Irrigation System"];

  String get WaterUsedQTY => _data["Water Used QTY"];

  String get Climatecondition => _data["Climate condition"];

  String get Totalhours => _data["Total hours"];

  String get Taskendtime => _data["Task end time"];

  String get Taskstarttime => _data["Task start time"];

  String get Hours => _data["Hours"];

  String get SupervisorName => _data["Supervisor Name"];

  String get AlreadyaddedasFavoriteWouldyouliketoremoveasFavorite => _data[
      "Already added as Favorite . Would you like to remove as Favorite ?"];

  String get Removedasfavorite => _data["Removed as favorite!"];

  String get Addedasfavorite => _data["Added as favorite!"];

  String get Favouritethisitemtothelist =>
      _data["Favourite this item to the list?"];

  String get DoyouwanttoEditRemove => _data["Do you want to Edit/Remove/"];

  String get EditRemoveFavourite => _data["Edit/Remove/Favourite"];

  String get Lowstockitems => _data["Low stock items"];

  String get Highstockitems => _data["High stock items"];

  String get TOP5STOCKS => _data["TOP 5 STOCKS"];

  String get TOPFIVESELECTEDITEMS => _data["TOP FIVE SELECTED ITEMS"];

  String get TOP5LOWSTOCKITEMS => _data["TOP 5 LOW STOCK ITEMS"];

  String get TOP5HIGHSTOCKITEMS => _data["TOP 5 HIGH STOCK ITEMS"];

  String get Cannotselectmorethan12attachements =>
      _data["Can not select more than 12 attachements."];

  String get ActualYieldKg => _data["Actual Yield (Kg)"];

  String get FarmerCountNo => _data["Farmer Count (No)"];

  String get FarmerContractNo => _data["Farmer Contract (No)"];

  String get ContractedAreaAcre => _data["Contracted Area (Acre)"];

  String get EstimatedYieldKg => _data["Estimated Yield (Kg)"];

  String get RevisedYieldKg => _data["Revised Yield (Kg)"];

  String get SubplotareaAcre => _data["Subplot area (Acre)"];

  String get TotalCropsNo => _data["Total Crop's (No)"];

  String get TotalSubplotNo => _data["Total Subplot (No)"];

  String get TotalPlotNo => _data["Total Plot (No)"];

  String get PlotContractDetails => _data["Plot/Contract Details"];

  String get NextWeek => _data["Next Week"];

  String get Tomorrow => _data["Tomorrow"];

  String get LABOURREQUIREMENTBASEDONPLAN =>
      _data["LABOUR REQUIREMENT - BASED ON PLAN"];

  String get MATERIALREQUIREMENTBASEDONPLAN =>
      _data["MATERIAL REQUIREMENT BASED ON PLAN"];

  String get TotalLabour => _data["Total Labour"];

  String get RaiseTicket => _data["RaiseTicket"];

  String get NeedHelp => _data["Need Help?"];

  String get DoyouwanttoexitanApp => _data["Do you want to exit an App"];

  String get Closedialoguefirst => _data["Close dialogue first!"];

  String get PLOTDETAILSCONTRACTDETAILS =>
      _data["PLOT DETAILS/CONTRACT DETAILS"];

  String get TASK => _data["TASK"];

  String get Allfieldscannotbeempty => _data["All fields can not be empty"];

  String get SelectStatus => _data["Select Status"];

  String get SelectCrop => _data["Select Crop"];

  String get PartiallyCompleted => _data["Partially Completed"];

  String get Planned => _data["Planned"];

  String get History => _data["History"];

  String get Upcoming => _data["Upcoming"];

  String get Today => _data["Today"];

  String get StandardFarming => _data["Standard Farming"];

  String get ContractFarming => _data["Contract Farming"];

  String get Doyouwanttocompletefuturetask =>
      _data["Do you want to complete future task ?"];

  String get RecordKeeping => _data["Record Keeping"];

  String get Taskiscompleted => _data["Task is completed"];

  String get Taskiscancelled => _data["Task is cancelled"];

  String get Tasknotfound => _data["Task not found"];

  String get Directory => _data["Directory"];

  String get Camera => _data["Camera"];

  String get Gallery => _data["Gallery"];

  String get Audio => _data["Audio"];

  String get Services => _data["Services"];

  String get Logout => _data["Logout"];

  String get Setting => _data["Setting"];

  String get AboutApp => _data["AboutApp"];

  String get Settings => _data["Settings"];

  String get SynchronizationMode => _data["SynchronizationMode"];

  String get SynchronizationTime => _data["SynchronizationTime"];

  String get Language => _data["Language"];

  String get AppInfo => _data["AppInfo"];

  String get Backup => _data["Backup"];

  String get Restore => _data["Restore"];

  String get Employee => _data["Employee"];

  String get SelectLocation => _data["Select Location"];

  String get Hrs => _data["Hrs"];

  String get TotalHours => _data["Total Hours"];

  String get Out => _data["Out"];

  String get In => _data["In"];

  String get SelectPerson => _data["Select Person"];

  String get Selectlocation => _data["Select location"];

  String get TryAgain => _data["Try Again"];

  String get FaceNotRecognized => _data["Face Not Recognized!"];

  String get Attempt => _data["Attempt"];

  String get CheckOut => _data["Check Out"];

  String get CheckIn => _data["Check In"];

  String get Face => _data["Face"];

  String get Manual => _data["Manual"];

  String get CardScanning => _data["Card Scanning"];

  String get Barcode => _data["Barcode"];

  String get FaceRecording => _data["Face Recording"];

  String get FetchingCoordinates => _data["Fetching Coordinates."];

  String get CoOrdinates => _data["Co-Ordinates"];

  String get AttendanceSubmitted => _data["Attendance Submitted."];

  String get CoOrdinatesnotfound => _data["Co-Ordinates not found."];

  String get AttendanceRecording => _data["Attendance Recording"];

  String get LabourInformation => _data["Labour Information"];

  String get LabourType => _data["Labour Type"];

  String get LabourName => _data["Labour Name"];

  String get Poweredby => _data["Powered by"];

  String get PhNo => _data["Ph. No"];

  String get Dateofbirth => _data["Date of birth"];

  String get LabourCard => _data["Labour Card"];

  String get PersonalDetails => _data["Personal Details"];

  String get AddressDetails => _data["Address Details"];

  String get Skip => _data["Skip"];

  String get BankDetailsNotfound => _data["Bank Details Not found."];

  String get IFSCCodecantbeEmpty => _data["IFSC Code can't be Empty."];

  String get PleaseConnecttointernetfirst =>
      _data["Please Connect to internet first."];

  String get LoadingBankDetailsdotdotdot => _data["Loading Bank Details..."];

  String get Back => _data["Back"];

  String get PinZipCode => _data["Pin/Zip Code"];

  String get SubdashDistrict => _data["Sub-District"];

  String get CountryName => _data["Country Name"];

  String get LabourCode => _data["Labour Code"];

  String get MobileNo => _data["Mobile No"];

  String get MoreInfodotdotdot => _data["More Info..."];

  String get LabourRegistration => _data["Labour Registration"];

  String get PleaseenterName => _data["Please enter Name."];

  String get PleaseenterMobileNumber => _data["Please enter Mobile Number."];

  String get PleaseselectLocation => _data["Please select Location."];

  String get andnowlookdownwards => _data["and now look downwards"];

  String get Nowlookupwards => _data["Now look upwards"];

  String get VeryGood => _data["Very Good"];

  String get NowSlowlylooktowardsleft => _data["Now Slowly look towards left"];

  String get Slowlylooktowardsright => _data["Slowly look towards right"];

  String get RotateYourFaceSlightDownward =>
      _data["Rotate Your Face Slight Downward"];

  String get RotateYourFaceSlightUp => _data["Rotate Your Face Slight Up"];

  String get RotateYourFaceSlightLeft => _data["Rotate Your Face Slight Left"];

  String get RotateYourFaceSlightRight =>
      _data["Rotate Your Face Slight Right"];

  String get PlaceYourFaceintheOrangecircle =>
      _data["Place Your Face in the Orange circle"];

  String get SearchParameter => _data["SearchParameter"];

  String get SelectQualityParameterValue =>
      _data["SelectQualityParameterValue"];

  String get SubPlotNumber => _data["SubPlotNumber"];

  String get Scannedcontractnotapprovedorconfirmed =>
      _data["3) Scanned contract not approved or confirmed."];

  String get Scannedcontractdoesnotexits =>
      _data["2) Scanned contract does not exits."];

  String get Farmermaybeinactive => _data["2) Farmer may be inactive."];

  String get QRCodeisinvalid => _data["1) QR Code is invalid."];

  String get Farmer => _data["Farmer"];

  String get Deficiency => _data["Deficiency"];

  String get Disease => _data["Disease"];

  String get Pest => _data["Pest"];

  String get Moredotdotdot => _data["Moredotdotdot"];

  String get PleaseentermandatoryFields => _data["PleaseentermandatoryFields"];

  String get Pleaseentervaluelessthan100 =>
      _data["Pleaseentervaluelessthan100"];

  String get Pleaseentervaluelessthan => _data["Pleaseentervaluelessthan"];

  String get ActualDate => _data["Actual Date"];

  String get PlannedDate => _data["Planned Date"];

  String get PlotSubplotName => _data["PlotSubplotName"];

  String get NA => _data["NA"];

  String get Done => _data["Done"];

  String get ActivityRepetitionNo => _data["ActivityRepetitionNo"];

  String get RepetitionIntervalDays => _data["RepetitionIntervalDays"];

  String get ActivitySelection => _data["ActivitySelection"];

  String get ActivityRecommended => _data["ActivityRecommended"];

  String get ObservationPhoto => _data["ObservationPhoto"];

  String get Observation => _data["Observation"];

  String get ObservationItem => _data["ObservationItem"];

  String get ObservationDetails => _data["ObservationDetails"];

  String get Dosage => _data["Dosage"];

  String get WaterUsedLTR => _data["WaterUsedLTR"];

  String get FreeOfCharge => _data["FreeOfCharge"];

  String get Chargeable => _data["Chargeable"];

  String get NoRecordsFound => _data["NoRecordsFound"];

  String get FIN => _data["FIN"];

  String get Female => _data["Female"];

  String get Male => _data["Male"];

  String get DateofBirth => _data["DateofBirth"];

  String get SubDistrict => _data["SubDistrict"];

  String get District => _data["District"];

  String get State => _data["State"];

  String get Select => _data["Select"];

  String get ChoosefromLibrary => _data["ChoosefromLibrary"];

  String get TakePhoto => _data["TakePhoto"];

  String get SelectMainIncomeSource => _data["SelectMainIncomeSource"];

  String get SelectState => _data["SelectState"];

  String get SelectDistrict => _data["SelectDistrict"];

  String get SelectSubDistrict => _data["SelectSubDistrict"];

  String get SelectVillage => _data["SelectVillage"];

  String get Location => _data["Location"];

  String get Clear => _data["Clear"];

  String get Irrigation => _data["Irrigation"];

  String get Fertilizer => _data["Fertilizer"];

  String get LandPreparation => _data["LandPreparation"];

  String get Harvesting => _data["Harvesting"];

  String get Transplanting => _data["Transplanting"];

  String get Weeding => _data["Weeding"];

  String get PleaseenterFINNumber => _data["PleaseenterFINNumber"];

  String get Pleaseselectentrydate => _data["Pleaseselectentrydate"];

  String get PleaseselectcollectionCenter =>
      _data["PleaseselectcollectionCenter"];

  String get PleaseselectFieldsupervisor =>
      _data["PleaseselectFieldsupervisor"];

  String get PleaseentermobileofFieldsupervisor =>
      _data["PleaseentermobileofFieldsupervisor"];

  String get PleaseenterFirstName => _data["PleaseenterFirstName"];

  String get PleaseentermiddleName => _data["PleaseentermiddleName"];

  String get PleaseenterlastName => _data["PleaseenterlastName"];

  String get Pleaseentermobilenumber => _data["Pleaseentermobilenumber"];

  String get Pleaseselectgender => _data["Pleaseselectgender"];

  String get Pleaseselectcountry => _data["Pleaseselectcountry"];

  String get Pleaseselectstate => _data["Pleaseselectstate"];

  String get Pleaseselectdistrict => _data["Pleaseselectdistrict"];

  String get Pleaseselectsubdistrict => _data["Pleaseselectsubdistrict"];

  String get Pleaseselectvillage => _data["Pleaseselectvillage"];

  String get AgeYears => _data["AgeYears"];

  String get HowfarisyourfarmtothenearestP =>
      _data["HowfarisyourfarmtothenearestP"];

  String get AgriLoanAmountVND => _data["AgriLoanAmountVND"];

  String get PleaseSelectDistrictFirst => _data["PleaseSelectDistrictFirst"];

  String get Referenceno => _data["Referenceno"];

  String get NoofReferences => _data["NoofReferences"];

  String get NomineeInformation => _data["NomineeInformation"];

  String get CropInformation => _data["CropInformation"];

  String get NomineeDetails => _data["NomineeDetails"];

  String get IssueBy => _data["IssueBy"];

  String get IdProofno => _data["IdProofno"];

  String get TotalNoofIdProof => _data["TotalNoofIdProof"];

  String get FarmerReference => _data["FarmerReference"];

  String get LivestockActivities => _data["LivestockActivities"];

  String get Livestockno => _data["Livestockno"];

  String get NoofLivestock => _data["NoofLivestock"];

  String get IncomeVND => _data["IncomeVND"];

  String get PreviewClicked => _data["PreviewClicked"];

  String get NoRecordAvailable => _data["NoRecordAvailable"];

  String get SelectCollectionCenter => _data["SelectCollectionCenter"];

  String get FromDatecantbegreaterthanToDate =>
      _data["FromDatecantbegreaterthanToDate"];

  String get SelectRelationwithFarmer => _data["SelectRelationwithFarmer"];

  String get SelectCountry => _data["SelectCountry"];

  String get SelectLabourType => _data["SelectLabourType"];

  String get LastName => _data["LastName"];

  String get MiddleName => _data["MiddleName"];

  String get FirstName => _data["FirstName"];

  String get SelectStateProvince => _data["SelectStateProvince"];

  String get PleaseSelectCountryFirst => _data["PleaseSelectCountryFirst"];

  String get SelectDistrictCountry => _data["SelectDistrictCountry"];

  String get PleaseSelectStateProvinceFirst =>
      _data["PleaseSelectStateProvinceFirst"];

  String get SelectSubDistrictBlockTehsil =>
      _data["SelectSubDistrictBlockTehsil"];

  String get PleaseSelectDistrictCountryFirst =>
      _data["PleaseSelectDistrictCountryFirst"];

  String get SelectCityVillage => _data["SelectCityVillage"];

  String get PleaseSelectSubDistrictBlockTehsilFirst =>
      _data["PleaseSelectSubDistrictBlockTehsilFirst"];

  String get LiveStockDetails => _data["LiveStockDetails"];

  String get CropSeason => _data["CropSeason"];

  String get Activities => _data["Activities"];

  String get Income => _data["Income"];

  String get TotalNoofReferences => _data["TotalNoofReferences"];

  String get FarmerReferenceDetails => _data["FarmerReferenceDetails"];

  String get FarmerRecommendedBy => _data["FarmerRecommendedBy"];

  String get ShareholderName => _data["ShareholderName"];

  String get TotalNoofShareholders => _data["TotalNoofShareholders"];

  String get IdProofName => _data["IdProofName"];

  String get TotalNoofIDProof => _data["TotalNoofIDProof"];

  String get IdProofDetails => _data["IdProofDetails"];

  String get IDType => _data["IDType"];

  String get IDNumber => _data["IDNumber"];

  String get IssueDate => _data["Issue Date"];

  String get IssuedBy => _data["IssuedBy"];

  String get TotalNoofActivities => _data["TotalNoofActivities"];

  String get IrrigatedLand => _data["IrrigatedLand"];

  String get Totalland => _data["Totalland"];

  String get PinCode => _data["PinCode"];

  String get RelationwithFarmer => _data["RelationwithFarmer"];

  String get NomineeName => _data["NomineeName"];

  String get CountofChild => _data["CountofChild"];

  String get HowFarisyourFarmtothenearestFactoryKM =>
      _data["HowFarisyourFarmtothenearestFactoryKM"];

  String get MainIncomeSource => _data["MainIncomeSource"];

  String get AgriLoanAmount => _data["AgriLoanAmount"];

  String get TotalAnnualIncome => _data["TotalAnnualIncome"];

  String get TotalArea => _data["TotalArea"];

  String get Address => _data["Address"];

  String get FarmerType => _data["FarmerType"];

  String get FarmerCategory => _data["FarmerCategory"];

  String get AadharNumber => _data["AadharNumber"];

  String get CityVillage => _data["CityVillage"];

  String get FarmerOrVendor => _data["FarmerOrVendor"];

  String get FarmerSupport => _data["FarmerSupport"];

  String get FarmerSupportType => _data["FarmerSupportType"];

  String get FarmerHarvestType => _data["FarmerHarvestType"];

  String get HarvestMachineType => _data["HarvestMachineType"];

  String get FundRequestAmt => _data["FundRequestAmt"];

  String get SubDistrictBlockTehsil => _data["SubDistrictBlockTehsil"];

  String get DistrictCountry => _data["DistrictCountry"];

  String get StateProvince => _data["StateProvince"];

  String get Country => _data["Country"];

  String get MobileNumberofHusbandWife => _data["MobileNumberofHusbandWife"];

  String get FullNameofHusbandWife => _data["FullNameofHusbandWife"];

  String get MarriedorUnmarried => _data["MarriedorUnmarried"];

  String get DateOfBirth => _data["DateOfBirth"];

  String get Age => _data["Age"];

  String get Gender => _data["Gender"];

  String get MobileNumber => _data["MobileNumber"];

  String get Name => _data["Name"];

  String get MobileNumberofFieldSupervisor =>
      _data["MobileNumberofFieldSupervisor"];

  String get FieldSupervisor => _data["FieldSupervisor"];

  String get Fin => _data["Fin"];

  String get Unmarried => _data["Unmarried"];

  String get Married => _data["Married"];

  String get ExpectedHarvestDate => _data["ExpectedHarvestDate"];

  String get ProgramName => _data["ProgramName"];

  String get LiveStock => _data["LiveStock"];

  String get PleaseentervalidTotalLandorIrrigatedLandArea =>
      _data["PleaseentervalidTotalLandorIrrigatedLandArea"];

  String get PleaseenterFarmAddress => _data["PleaseenterFarmAddress"];

  String get IrrigatedLandAreaCanNotBeGreaterThanTotalLandArea =>
      _data["IrrigatedLandAreaCanNotBeGreaterThanTotalLandArea"];

  String get PleaseenterIrrigatedLandAreaGreaterThan0 =>
      _data["PleaseenterIrrigatedLandAreaGreaterThan0"];

  String get PleaseenterTotalLandAreaGreaterThan0 =>
      _data["PleaseenterTotalLandAreaGreaterThan0"];

  String get SelectSoilType => _data["SelectSoilType"];

  String get SelectWaterSource => _data["SelectWaterSource"];

  String get SelectIrrigationType => _data["SelectIrrigationType"];

  String get SoilType => _data["SoilType"];

  String get FarmAddress => _data["FarmAddress"];

  String get WaterSource => _data["WaterSource"];

  String get IrrigationType => _data["IrrigationType"];

  String get CropDuration => _data["CropDuration"];

  String get DaystoHarvest => _data["DaystoHarvest"];

  String get ExpectedHarvestingDate => _data["ExpectedHarvestingDate"];

  String get PleaseSelectContractname => _data["PleaseSelectContractname"];

  String get PleaseSelectRateProfilename =>
      _data["PleaseSelectRateProfilename"];

  String get PleaseSelectCropName => _data["PleaseSelectCropName"];

  String get PleaseSelectCropVariety => _data["PleaseSelectCropVariety"];

  String get PleaseEnterCropArea => _data["PleaseEnterCropArea"];

  String get PleaseSelectCropAreaUnit => _data["PleaseSelectCropAreaUnit"];

  String get PleaseinsertPlotNumber => _data["PleaseinsertPlotNumber"];

  String get PleaseSelectPlantingDate => _data["PleaseSelectPlantingDate"];

  String get PleaseSelectSeason => _data["PleaseSelectSeason"];

  String get PleaseentervalidDaystoHarvestDecimalValuenotAccepted =>
      _data["PleaseentervalidDaystoHarvestDecimalValuenotAccepted"];

  String get FarmInformation => _data["FarmInformation"];

  String get SelectContractName => _data["SelectContractName"];

  String get SelectRateProfile => _data["SelectRateProfile"];

  String get PleaseSelectContractNameFirst =>
      _data["PleaseSelectContractNameFirst"];

  String get SelectCropName => _data["SelectCropName"];

  String get PleaseSelectRateProfileFirst =>
      _data["PleaseSelectRateProfileFirst"];

  String get SelectCropVariety => _data["SelectCropVariety"];

  String get PleaseSelectCropNameFirst => _data["PleaseSelectCropNameFirst"];

  String get SelectSeason => _data["SelectSeason"];

  String get Season => _data["Season"];

  String get PlantingSowingTransplantingDate =>
      _data["PlantingSowingTransplantingDate"];

  String get PlotNumber => _data["PlotNumber"];

  String get PlotCode => _data["PlotCode"];

  String get PlotArea => _data["PlotArea"];

  String get CropArea => _data["CropArea"];

  String get CropVariety => _data["CropVariety"];

  String get Infestation => _data["Infestation"];

  String get Area => _data["Area"];

  String get RateProfile => _data["RateProfile"];

  String get ContractName => _data["ContractName"];

  String get AccountNumber => _data["AccountNumber"];

  String get AccountType => _data["AccountType"];

  String get Add => _data["Add"];

  String get update => _data["update"];

  String get IDProofDetails => _data["IDProofDetails"];

  String get SwiftCode => _data["SwiftCode"];

  String get IFSCCodeIBANNumber => _data["IFSCCodeIBANNumber"];

  String get BranchName => _data["BranchName"];

  String get BankName => _data["BankName"];

  String get ShareHolderName => _data["ShareHolderName"];

  String get BankDetailsofShareHolder => _data["BankDetailsofShareHolder"];

  String get BankDetails => _data["BankDetails"];

  String get FarmerLog => _data["FarmerLog"];

  String get FarmerRegistration => _data["FarmerRegistration"];

  String get FarmerInformation => _data["FarmerInformation"];

  String get ShareHolderNumber => _data["ShareHolderNumber"];

  String get CompanyManufacturerName => _data["CompanyManufacturerName"];

  String get SelectItemSubtype => _data["SelectItemSubtype"];

  String get SelectItemType => _data["SelectItemType"];

  String get OtherItemAdd => _data["OtherItemAdd"];

  String get ItemSubtype => _data["ItemSubtype"];

  String get ItemNameItemCode => _data["ItemNameItemCode"];

  String get ItemType => _data["ItemType"];

  String get ItemTypeSubType => _data["ItemTypeSubType"];

  String get ActiveIngredient => _data["ActiveIngredient"];

  String get Batch => _data["Batch"];

  String get AvailableQuantity => _data["AvailableQuantity"];

  String get AvailableArea => _data["AvailableArea"];

  String get IssueQuantity => _data["IssueQuantity"];

  String get TotalIssuedQuantity => _data["TotalIssuedQuantity"];

  String get Remark => _data["Remark"];

  String get FreeofChargeChargeable => _data["FreeofChargeChargeable"];

  String get liter => _data["liter"];

  String get WaterusedQty => _data["WaterusedQty"];

  String get Machinecost => _data["Machinecost"];

  String get Labourhours => _data["Labourhours"];

  String get Nooflabours => _data["Nooflabours"];

  String get INR => _data["INR"];

  String get ItemCost => _data["ItemCost"];

  String get ItemCode => _data["ItemCode"];

  String get TotalNoofItem => _data["TotalNoofItem"];

  String get Details => _data["Details"];

  String get Items => _data["Items"];

  String get TotalNoofItems => _data["TotalNoofItems"];

  String get ActivityName => _data["ActivityName"];

  String get ApplicationSpecificDetails => _data["ApplicationSpecificDetails"];

  String get ItemDetails => _data["ItemDetails"];

  String get PlotDetails => _data["PlotDetails"];

  String get Yes => _data["Yes"];

  String get No => _data["No"];

  String get AreyousuretoDeletethisRecord =>
      _data["AreyousuretoDeletethisRecord"];

  String get HomePage => _data["HomePage"];

  String get PleaseentervalidQuantity => _data["PleaseentervalidQuantity"];

  String get Cost => _data["Cost"];

  String get Rate => _data["Rate"];

  String get Quantity => _data["Quantity"];

  String get ItemName => _data["ItemName"];

  String get ItemAdd => _data["ItemAdd"];

  String get Previoustaskisavailable => _data["Previoustaskisavailable"];

  String get SelectActivity => _data["SelectActivity"];

  String get Nexttaskisnotavailable => _data["Nexttaskisnotavailable"];

  String get Previoustaskisnotavailable => _data["Previoustaskisnotavailable"];

  String get SelectGrowthStage => _data["SelectGrowthStage"];

  String get Offlinedatasaved => _data["Offlinedatasaved"];

  String get Edit => _data["Edit"];

  String get Remove => _data["Remove"];

  String get Favourite => _data["Favourite"];

  String get Areyousure => _data["Areyousure"];

  String get Method => _data["Method"];

  String get WaterUsedQty => _data["WaterUsedQty"];

  String get Unit => _data["Unit"];

  String get HarvestQty => _data["HarvestQty"];

  String get OtherCost => _data["OtherCost"];

  String get MachineCost => _data["MachineCost"];

  String get MachineHours => _data["MachineHours"];

  String get MachineName => _data["MachineName"];

  String get SelectMachine => _data["SelectMachine"];

  String get LabourCost => _data["LabourCost"];

  String get LabourHours => _data["LabourHours"];

  String get NoofLabour => _data["NoofLabour"];

  String get OtherItem => _data["OtherItem"];

  String get Itemname => _data["Itemname"];

  String get SelectItem => _data["SelectItem"];

  String get AgroChemical => _data["AgroChemical"];

  String get GrowthStage => _data["GrowthStage"];

  String get CropAge => _data["CropAge"];

  String get Activity => _data["Activity"];

  String get CropName => _data["CropName"];

  String get Selectcrop => _data["Selectcrop"];

  String get PlotName => _data["PlotName"];

  String get SelectPlots => _data["SelectPlots"];

  String get SelectFarmerFirst => _data["Select Farmer First!"];

  String get Template => _data["Template"];

  String get CropAreaAcre => _data["CropAreaAcre"];

  String get Village => _data["Village"];

  String get VillageName => _data["VillageName"];

  String get ContractCode => _data["ContractCode"];

  String get FarmerNameFin => _data["FarmerNameFin"];

  String get CreatedBy => _data["CreatedBy"];

  String get DocumentNo => _data["DocumentNo"];

  String get Date => _data["Date"];

  String get InTime => _data["InTime"];

  String get OutTime => _data["OutTime"];

  String get TotalWorking => _data["TotalWorking"];

  String get FarmerDetails => _data["FarmerDetails"];

  String get ScoreDetails => _data["ScoreDetails"];

  String get OK => _data["OK"];

  String get Score => _data["Score"];

  String get ComplianceName => _data["ComplianceName"];

  String get CriteriaName => _data["CriteriaName"];

  String get ClearAll => _data["ClearAll"];

  String get Submit => _data["Submit"];

  String get TemplateName => _data["TemplateName"];

  String get SelectTemplate => _data["SelectTemplate"];

  String get FarmerName => _data["FarmerName"];

  String get FarmerContract => _data["FarmerContract"];

  String get SelectFarmer => _data["SelectFarmer"];

  String get ToDate => _data["ToDate"];

  String get FromDate => _data["FromDate"];

  String get AttachmentDetails => _data["AttachmentDetails"];

  String get AttendanceDetails => _data["AttendanceDetails"];

  String get Attachment => _data["Attachment"];

  String get Attachments => _data["Attachments"];

  String get ParameterSelection => _data["ParameterSelection"];

  String get TemplateSelection => _data["TemplateSelection"];

  String get FarmerSelection => _data["FarmerSelection"];

  String get PleaseSelectFirstTemplate => _data["PleaseSelectFirstTemplate"];

  String get PleaseSelectFirstFarmer => _data["PleaseSelectFirstFarmer"];

  String get Previous => _data["Previous"];

  String get SearchFarmer => _data["Search Farmer"];

  String get Instructions => _data["Instructions"];

  String get SelectCompliance => _data["SelectCompliance"];

  String get Next => _data["Next"];

  String get TotalScore => _data["TotalScore"];

  String get Dashboard => _data["Dashboard"];

  String get AnalyticsDashboard => _data["AnalyticsDashboard"];

  String get FarmerAssessment => _data["FarmerAssessment"];

  String get Approved => _data["Approved"];

  String get Pending => _data["Pending"];

  String get Search => _data["Search"];

  String get ConectToInternetFirst => _data["ConectToInternetFirst"];

  String get FieldScouting => _data["FieldScouting"];

  String get LoadingPleaseWait => _data["LoadingPleaseWait"];

  String get Cancel => _data["Cancel"];

  String get Delete => _data["Delete"];

  String get All => _data["All"];

  String get AreYouSure => _data["AreYouSure"];

  String get YouWantToDeleteRecord => _data["YouWantToDeleteRecord"];

  String get index => _data["index"];

  String get save => _data["save"];

  String get FarmerRecordKeeping => _data["FarmerRecordKeeping"];

  String get ObservationRecording => _data["ObservationRecording"];

  String get sample => _data["sample"];

  String get CollectionCenter => _data["CollectionCenter"];

  String get farmer_log => _data["farmer_log"];

  String get contract_name_astrick => _data["contract_name_astrick"];

  String get rate_profile_astrick => _data["rate_profile_astrick"];

  String get crop_name_astrick => _data["crop_name_astrick"];

  String get crop_variety_astrick => _data["crop_variety_astrick"];

  String get crop_area_astrick => _data["crop_area_astrick"];

  String get unit_astrick => _data["unit_astrick"];

  String get plot_number_astrick => _data["plot_number_astrick"];

  String get season_astrick => _data["season_astrick"];

  String get crop_duration => _data["crop_duration"];

  String get days_to_harvest => _data["days_to_harvest"];

  String get expected_harvesting_date => _data["expected_harvesting_date"];

  String get next => _data["next"];

  String get validation_select_contract_name =>
      _data["validation_select_contract_name"];

  String get validation_select_rate_profile_name =>
      _data["validation_select_rate_profile_name"];

  String get validation_select_crop_name =>
      _data["validation_select_crop_name"];

  String get validation_select_crop_variety =>
      _data["validation_select_crop_variety"];

  String get validation_select_crop_area =>
      _data["validation_select_crop_area"];

  String get validation_select_crop_area_unit =>
      _data["validation_select_crop_area_unit"];

  String get validation_select_insert_plot_number =>
      _data["validation_select_insert_plot_number"];

  String get validation_select_planting_date =>
      _data["validation_select_planting_date"];

  String get validation_select_season => _data["validation_select_season"];

  String get validation_valid_days_to_harvest =>
      _data["validation_valid_days_to_harvest"];

  String get farm_information => _data["farm_information"];

  String get select_contract_name => _data["select_contract_name"];

  String get select_rate_profile => _data["select_rate_profile"];

  String get select_crop_name => _data["select_crop_name"];

  String get select_crop_variety => _data["select_crop_variety"];

  String get select_season => _data["select_season"];

  String get total_lan_area => _data["total_lan_area"];

  String get irrigation_type => _data["irrigation_type"];

  String get water_source => _data["water_source"];

  String get farm_addres_astrick => _data["farm_addres_astrick"];

  String get soil_type => _data["soil_type"];

  String get select_irrigation_type => _data["select_irrigation_type"];

  String get select_water_source => _data["select_water_source"];

  String get select_soil_type => _data["select_soil_type"];

  String get please_enter_total_land_area_greater_than_zero =>
      _data["please_enter_total_land_area_greater_than_zero"];

  String get please_enter_irrigated_land_area_greater_than_zero =>
      _data["please_enter_irrigated_land_area_greater_than_zero"];

  String get irrigated_land_can_not_be_greater_than_total_lan =>
      _data["irrigated_land_can_not_be_greater_than_total_lan"];

  String get please_enter_farm_addree => _data["please_enter_farm_addree"];

  String get live_stock => _data["live_stock"];

  String get count_of_child => _data["count_of_child"];

  String get first_name => _data["first_name"];

  String get middle_name => _data["middle_name"];

  String get last_name => _data["last_name"];

  String get relation_with_farmer => _data["relation_with_farmer"];

  String get country => _data["country"];

  String get state => _data["state"];

  String get district => _data["district"];

  String get sub_district => _data["sub_district"];

  String get village => _data["village"];

  String get address => _data["address"];

  String get pincode => _data["pincode"];

  String get attachment_details => _data["attachment_details"];

  String get select_country => _data["select_country"];

  String get select_state => _data["select_state"];

  String get validation_country => _data["validation_country"];

  String get select_district => _data["select_district"];

  String get validation_state_first => _data["validation_state_first"];

  String get select_subdistrict => _data["select_subdistrict"];

  String get validation_district_first => _data["validation_district_first"];

  String get select_village => _data["select_village"];

  String get validation_select_subdistrict_first =>
      _data["validation_select_subdistrict_first"];

  String get select_relation_with_farmer =>
      _data["select_relation_with_farmer"];

  String get plantind_date_astrick => _data["plantind_date_astrick"];

  String get google_map => _data["google_map"];

  String get dap => _data["dap"];

  String get observationrecording => _data["observationrecording"];

  String get measure => _data["measure"];

  String get failurereson => _data["failurereson"];

  String get instructions => _data["instructions"];

  String get colorstar => _data["colorstar"];

  String get size => _data["size"];

  String get weight => _data["weight"];

  String get planningactivity => _data["planningactivity"];

  String get planningactivities => _data["planningactivities"];

  String get observationdetailstar => _data["observationdetailstar"];

  String get recomandation => _data["recomandation"];

  // Farmer Registration Strings
  String get personaldetails => _data["personaldetails"];

  String get nomineeinformation => _data["NomineeInformation"];

  String get bankinformation => _data["Bank Information"];

  String get ObservationParameter => _data["ObservationParameter"];

  String get ObservationParameters => _data["ObservationParameters"];

  String get PlanActivity => _data["PlanActivity"];

  String get filterselection => _data["filterselection"];

  String get Home => _data["Home"];

  String get MyStock => _data["MyStock"];

  String get SiteName => _data["SiteName"];

  String get search => _data["search"];

  String get SiteList => _data["SiteList"];

  String get PlotList => _data["PlotList"];

  String get ItemTypeList => _data["ItemTypeList"];

  String get ItemSubTypeList => _data["ItemSubTypeList"];

  String get ItemSubType => _data["ItemSubType"];

  String get SelectSite => _data["SelectSite"];

  String get Site => _data["Site"];

  String get SelectPlot => _data["SelectPlot"];

  String get Plot => _data["Plot"];

  String get MapPlotDetails => _data["MapPlotDetails"];

  String get GoodsIssueToFarmer => _data["GoodsIssueToFarmer"];

  String get norecordfound => _data["norecordfound"];

  String get select_site_first => _data["select_site_first"];

  String get select_itemtype_first => _data["select_itemtype_first"];

  String get criteriavalue => _data["criteriavalue"];

  String get IFSCCode => _data["IFSCCode"];

  String get PleaseenterIFSCCode => _data["PleaseenterIFSCCode"];

  String get PleaseenterBankName => _data["PleaseenterBankName"];

  String get PleaseenterBranchName => _data["PleaseenterBranchName"];

  String get PleaselectAccType => _data["PleaselectAccType"];

  String get PleaseenterAccNumber => _data["PleaseenterAccNumber"];

  String get days => _data["days"];

  String get please_valide_data => _data["please_valide_data"];

  String get entrysubmittedsuccessfully => _data["entrysubmittedsuccessfully"];

  String get estimatedharvestqty => _data["estimatedharvestqty"];

  String get revisedharvestqty => _data["revisedharvestqty"];

  String get errorWhileUploadData => _data["errorWhileUploadData"];

  String get selectAtLeastOnePlannedActivity =>
      _data["selectAtLeastOnePlannedActivity"];

  String get enterorselectvaluefor => _data["enterorselectvaluefor"];

  String get pleaseEnterSomeObservation => _data["pleaseEnterSomeObservation"];

  String get acre => _data["acre"];

  String get please_enter_otheritem_name =>
      _data["please_enter_otheritem_name"];

  String get TaskCalendar => _data["TaskCalendar"];

  String get pleaseentervalidcost => _data["pleaseentervalidcost"];

  String get please_enter_digit_less_than_ten =>
      _data["please_enter_digit_less_than_ten"];

  String get select_atleast_one_parameter =>
      _data["select_atleast_one_parameter"];

  String get internetconnectfirst => _data["internetconnectfirst"];

  String get recordkeeping => _data["recordkeeping"];

  String get TotalNoofParamter => _data["TotalNoofParamter"];

  String get TotalNoofSymptom => _data["TotalNoofSymptom"];

  String get PlantPart_Name => _data["PlantPart_Name"];

  String get Symptom_Name => _data["Symptom_Name"];

  String get Pest_disease_deficiency => _data["Pest_disease_deficiency"];

  String get Description => _data["Description"];

  String get Observation_Parameters => _data["Observation_Parameters"];

  String get TotalNoofSymtoms => _data["TotalNoofSymtoms"];

  String get Symptom_Details => _data["Symptom_Details"];

  String get Activity_Details => _data["Activity_Details"];

  String get Dosage_Quantity => _data["Dosage_Quantity"];

  String get from_row => _data["from_row"];

  String get to_row => _data["to_row"];

  String get Total_Rows => _data["Total_Rows"];

  String get Next_Observation_Date => _data["Next_Observation_Date"];

  String get Observation_Result => _data["Observation_Result"];

  String get Recommendations => _data["Recommendations"];

  String get Observation_Details => _data["Observation_Details"];

  String get Area_Covered => _data["Area_Covered"];

  String get UndertakenArea => _data["UndertakenArea"];

  String get contractorname => _data["contractorname"];

  String get invalid_scanned_qr => _data["invalid_scanned_qr"];

  String get parameter_selection => _data["parameter_selection"];

  String get tree_details => _data["tree_details"];

  String get please_enter_area_covered => _data["please_enter_area_covered"];

  String get DetailviewRK => _data["DetailviewRK"];

  String get Machineuseddetails => _data["Machineuseddetails"];

  String get manpoweruseddetails => _data["manpoweruseddetails"];

  String get hours => _data["hours"];

  String get Machinecode => _data["Machinecode"];

  String get TotalNoofmachine => _data["TotalNoofmachine"];

  String get TotalNooflabour => _data["TotalNooflabour"];

  String get Labour => _data["Labour"];

  String get LabourOvertime => _data["LabourOvertime"];

  String get SubPlotArea => _data["SubPlotArea"];

  String get SubPlotName => _data["SubPlotName"];

  String get pleaseselectplotfirst => _data["pleaseselectplotfirst"];

  String get RateProfileEmptyError => _data["RateProfileEmptyError"];

  String get CropVarietyError => _data["CropVarietyError"];

  String get SowingPlantingDateError => _data["SowingPlantingDateError"];

  String get DaystoHarvestError => _data["DaystoHarvestError"];

  String get NoOfPlantsError => _data["NoOfPlantsError"];

  String get DeletedSuccessfully => _data["DeletedSuccessfully"];

  String get MaterialIndent => _data["MaterialIndent"];

  String get Preview => _data["Preview"];

  String get PleaseAddAtleastOneItemOnScreen =>
      _data["PleaseAddAtleastOneItemOnScreen"];

  String get UserAvailableQauntity => _data["UserAvailableQauntity"];

  String get ExpectedIssueDate => _data["ExpectedIssueDate"];

  String get PleaseEnterQauntityItCantBeEmptyOrZero =>
      _data["PleaseEnterQauntityItCantBeEmptyOrZero"];

  String get PleaseSelectUnit => _data["PleaseSelectUnit"];

  String get ExpectedDateCantBeLessThanEntryDate =>
      _data["ExpectedDateCantBeLessThanEntryDate"];

  String get Itemalreadyadded => _data["Itemalreadyadded"];

  String get DoYouWantToEditOrDelete => _data["DoYouWantToEditOrDelete"];

  String get AddedAsFavorite => _data["AddedAsFavorite"];

  String get RemovedAsFavorite => _data["RemovedAsFavorite"];

  String get AlreadyAdded => _data["AlreadyAdded"];

  String get AlreadyAddedAsFavorite => _data["AlreadyAddedAsFavorite"];

  String get WouldYouLikeToAddAsFavorite =>
      _data["WouldYouLikeToAddAsFavorite"];

  String get InvalidQrCode => _data["InvalidQrCode"];

  String get ScanningFailed => _data["ScanningFailed"];

  String get PossibleReasons => _data["PossibleReasons"];

  String get RequestFromLocation => _data["RequestFromLocation"];

  String get RequestToLocation => _data["RequestToLocation"];

  String get SelectSiteStoreRoom => _data["SelectSiteStoreRoom"];

  String get SelectStoreRoom => _data["SelectStoreRoom"];

  String get PleaseSelectFirstRequestFromLocation => _data["PossibleReasons"];

  String get PleaseSelectRequestToLocation =>
      _data["PleaseSelectRequestToLocation"];

  String get SelectedDateCantBeGreaterThanTodaysDate =>
      _data["SelectedDateCantBeGreaterThanTodaysDate"];

  String get Filter => _data["Filter"];

  String get CropProcurement => _data["CropProcurement"];

  String get BuyerName => _data["BuyerName"];

  String get GPSCPSNumber => _data["GPSCPSNumber"];

  String get EntryDateCantBeGreaterThanTodaysDate =>
      _data["EntryDateCantBeGreaterThanTodaysDate"];

  String get EntryDateCantBeLessThanContractDate =>
      _data["EntryDateCantBeLessThanContractDate"];

  String get PleaseEnterValueofParameter =>
      _data["PleaseEnterValueofParameter"];

  String get on2ndScreen => _data["on2ndScreen"];

  String get on3rdScreen => _data["on3rdScreen"];

  String get cantBeEmptyOrZero => _data["cantBeEmptyOrZero"];

  String get cantBeEmpty => _data["cantBeEmpty"];

  String get TotalAmount => _data["TotalAmount"];

  String get TotalWeight => _data["TotalWeight"];

  String get TotalCratesOrBags => _data["TotalCratesOrBags"];

  String get PackType => _data["PackType"];

  String get QualityParameters => _data["QualityParameters"];

  String get GradeDetails => _data["GradeDetails"];

  String get VehicleDetails => _data["VehicleDetails"];

  String get ContractSelection => _data["ContractSelection"];

  String get ErrorwhiledeletingEntry => _data["ErrorwhiledeletingEntry"];

  String get InvalidNumberTyped => _data["InvalidNumberTyped"];

  String get CratesOrBags => _data["CratesOrBags"];

  String get cantBeZero => _data["cantBeZero"];

  String get respective => _data["respective"];

  String get Total => _data["Total"];

  String get Amount => _data["Amount"];

  String get OwnORRentedVehicle => _data["OwnORRentedVehicle"];

  String get VehicleName => _data["VehicleName"];

  String get VehicleNo => _data["VehicleNo"];

  String get StartTime => _data["StartTime"];

  String get StartingKM => _data["StartingKM"];

  String get PersonName => _data["PersonName"];

  String get Added => _data["Added"];

  String get Value => _data["Value"];

  String get CantselectContractforVehicle =>
      _data["CantselectContractforVehicle"];

  String get SelectRentedVehicle => _data["SelectRentedVehicle"];

  String get PleaseselectcontractFirst => _data["PleaseselectcontractFirst"];

  String get SelectOwnVehicle => _data["SelectOwnVehicle"];

  String get Pleaseentervalidmobilenumber =>
      _data["Pleaseentervalidmobilenumber"];

  String get ScanningCancelled => _data["ScanningCancelled"];

  String get Dosageperacre => _data["Dosageperacre"];

  String get LabourActivityTracking => _data["LabourActivityTracking"];

  String get InProgress => _data["InProgress"];

  String get Completed => _data["Completed"];

  String get QuantityUsed => _data["QuantityUsed"];

  String get Machines => _data["Machines"];

  String get Machinery => _data["Machinery"];

  String get Operator => _data["Operator"];

  String get DoYouWantToEditOrRemove => _data["DoYouWantToEditOrRemove"];

  String get Update => _data["Update"];

  String get UnableToClearRecord => _data["UnableToClearRecord"];

  String get CantChangeValue => _data["CantChangeValue"];

  String get Itemlistfilter => _data["Itemlistfilter"];

  String get OwnORRented => _data["OwnORRented"];

  String get ctypenamenotforownmachine => _data["ctypenamenotforownmachine"];

  String get pleaseselectcontractname => _data["pleaseselectcontractname"];

  String get contractname => _data["contractname"];

  String get submit => _data["submit"];

  String get cancel => _data["cancel"];

  String get Variety => _data["Variety"];

  String get EndTime => _data["EndTime"];

  String get PlannedEndTime => _data["PlannedEndTime"];

  String get itemaddedsuccessfully => _data["itemaddedsuccessfully"];

  String get machineaddedsuccessfully => _data["machineaddedsuccessfully"];

  String get productname => _data["productname"];

  String get packhouse => _data["packhouse"];

  String get invalid_qr_code => _data["invalid_qr_code"];

  String get activity_selection => _data["activity_selection"];

  String get supervisor_list => _data["supervisor_list"];

  String get Gross_weight => _data["Gross_weight"];

  String get no_of_casesorcrates_compulsory =>
      _data["no_of_casesorcrates_compulsory"];

  String get select_product => _data["select_product"];

  String get productname__compulsory => _data["productname__compulsory"];

  String get select_packhouse => _data["select_packhouse"];

  String get please_enter_dosage_per_acre_value =>
      _data["please_enter_dosage_per_acre_value"];

  String get please_enter_quantity_value =>
      _data["please_enter_quantity_value"];

  String get please_enter_quantity_unit => _data["please_enter_quantity_unit"];

  String get quantity_should_not_be_greater_than_available_quantity =>
      _data["quantity_should_not_be_greater_than_available_quantity"];

  String get entered_quantity_is_greater_than_available_quantity =>
      _data["entered_quantity_is_greater_than_available_quantity"];

  String get contractor_contract_name => _data["contractor_contract_name"];

  String get Overtime => _data["Overtime"];

  String get harvested_qty => _data["harvested_qty"];

  String get please_enter_number_of_labours =>
      _data["please_enter_number_of_labours"];

  String get please_select_female_labour_qty_unit =>
      _data["please_select_female_labour_qty_unit"];

  String get please_select_male_labour_qty_unit =>
      _data["please_select_male_labour_qty_unit"];

  String get labour_filter => _data["labour_filter"];

  String get machine_already_added => _data["machine_already_added"];

  String get activity_contractor_list => _data["activity_contractor_list"];

  String get activity_contractor => _data["activity_contractor"];

  String get items_available_quantity_less_required_quantity =>
      _data["items_available_quantity_less_required_quantity"];

  String get UndertakenAreacompulsory => _data["UndertakenAreacompulsory"];

  String get pleaseentersubplotareaitcant_be_empty =>
      _data["pleaseentersubplotareaitcant_be_empty"];

  String get please_enter_valid_sub_plot_area =>
      _data["please_enter_valid_sub_plot_area"];

  String get sub_plot_area_cant_be_greater_than_available_area =>
      _data["sub_plot_area_cant_be_greater_than_available_area"];

  String get available_area_is => _data["available_area_is"];

  String get qrdialoguemsge => _data["qrdialoguemsge"];

  String get notscanqrcode => _data["notscanqrcode"];

  String get alreadyaddedremoveasfavorite =>
      _data["alreadyaddedremoveasfavorite"];

  String get removedasfavorite => _data["removedasfavorite"];

  String get addedasfavorite => _data["addedasfavorite"];

  String get doyouwanttoeditordelete => _data["doyouwanttoeditordelete"];

  String get MachineAlreadyAdded => _data["MachineAlreadyAdded"];

  String get please_enter_hours => _data["please_enter_hours"];

  String get Serviceintent => _data["Serviceintent"];

  String get sameitemalreadyadded => _data["sameitemalreadyadded"];

  String get itemupdated => _data["itemupdated"];

  String get lessqtythanavailabeqty => _data["lessqtythanavailabeqty"];

  String get pleaseenterqtyused => _data["pleaseenterqtyused"];

  String get select_itemname_itemcode_first =>
      _data["select_itemname_itemcode_first"];

  String get select_batch_first => _data["select_batch_first"];

  String get canteditentryafterupload => _data["canteditentryafterupload"];

  String get samemachineisalreadyadded => _data["samemachineisalreadyadded"];

  String get cantRemoveentryafterupload => _data["cantRemoveentryafterupload"];

  String get pleaseselectlabourname => _data["pleaseselectlabourname"];

  String get pleaseselectSiteplotname => _data["pleaseselectSiteplotname"];

  String get select_Starttime => _data["select_Starttime"];

  String get please_selecttimeisgreaterthan_starttime =>
      _data["please_selecttimeisgreaterthan_starttime"];

  String get starttime => _data["starttime"];

  String get plotsubplot => _data["plotsubplot"];

  String get labournamecode => _data["labournamecode"];

  String get endtime => _data["endtime"];

  String get labourcurrentlyworking => _data["labourcurrentlyworking"];

  String get cantselectlbourfromdifsite => _data["cantselectlbourfromdifsite"];

  String get pleaseselectactivity => _data["pleaseselectactivity"];

  String get pleaseselectvalidarea => _data["pleaseselectvalidarea"];

  String get pleaseselectcrop => _data["pleaseselectcrop"];

  String get plotarealessthantotalarea => _data["plotarealessthantotalarea"];

  String get selectpackhouse => _data["selectpackhouse"];

  String get selectproductname => _data["selectproductname"];

  String get enterharvestweight => _data["enterharvestweight"];

  String get moreinfo => _data["moreinfo"];

  String get endactivity => _data["endactivity"];

  String get labouraddedsuccessfully => _data["labouraddedsuccessfully"];

  String get labouralreadyadded => _data["labouralreadyadded"];

  String get brust => _data["brust"];

  String get single => _data["single"];

  String get more => _data["more"];

  String get syncapp => _data["syncapp"];

  String get SubPlotName_preview => _data["SubPlotName_preview"];

  String get IrrigationDetails => _data["IrrigationDetails"];

  String get NoofValves => _data["NoofValves"];

  String get AnnualCropDetails => _data["AnnualCropDetails"];

  String get GPSCoordinatesDetails => _data["GPSCoordinatesDetails"];

  String get EmitterType => _data["EmitterType"];

  String get LaternalSpacing => _data["LaternalSpacing"];

  String get EmitterSpacing => _data["EmitterSpacing"];

  String get EmitterDischarge => _data["EmitterDischarge"];

  String get TotalNoOfEmitter => _data["TotalNoOfEmitter"];

  String get NoOfEmitterPerPlant => _data["NoOfEmitterPerPlant"];

  String get ApplicationRate => _data["ApplicationRate"];

  String get FlowRateAcre => _data["FlowRateAcre"];

  String get FlowRateUnit => _data["FlowRateUnit"];

/*  String get PlantingSowingDate=>_data["PlantingSowingDate"];*/
  String get PruningDate1 => _data["PruningDate1"];

  String get PruningDate2 => _data["PruningDate2"];

  String get FarmRegNoInterval => _data["FarmRegNoInterval"];

  String get ProposedHarvestingStartDate =>
      _data["ProposedHarvestingStartDate"];

  String get ProposedHarvestingEndDate => _data["ProposedHarvestingEndDate"];

  String get HarvestingInterval => _data["HarvestingInterval"];

  String get EstimatedProduction => _data["EstimatedProduction"];

  String get ProductionUnit => _data["ProductionUnit"];

  String get Planttoplantdistance => _data["Planttoplantdistance"];

  String get Rowtorowdistance => _data["Rowtorowdistance"];

  String get TotalNoofTrees => _data["TotalNoofTrees"];

  String get NoofRows => _data["NoofRows"];

  String get CertificationNumber => _data["CertificationNumber"];

  String get Geographicalcoordinatepoints =>
      _data["Geographicalcoordinatepoints"];

  String get SowingDate => _data["SowingDate"];

  String get FarmName => _data["FarmName"];

  String get FinancialYear => _data["FinancialYear"];

  String get CropType => _data["CropType"];

  String get Siteplot => _data["Siteplot"];

  String get Cropname => _data["Cropname"];

  String get SubPlotCode => _data["SubPlotCode"];

  String get RootStockAndOtherDetails => _data["RootStockAndOtherDetails"];

  String get CultivationType => _data["CultivationType"];

  String get VendorName => _data["VendorName"];

  String get TrainingSystem => _data["TrainingSystem"];

  String get OrganicInorganic => _data["OrganicInorganic"];

  String get PlantationType => _data["PlantationType"];

  String get SubPlotNames => _data["SubPlotName"];

  String get CropProfile => _data["CropProfile"];

  String get ValveName => _data["ValveName"];

  String get DriplinetoDriplineSpacing => _data["DriplinetoDriplineSpacing"];

  String get DrippertoDripperSpacing => _data["DrippertoDripperSpacing"];

  String get DripperDischarge => _data["DripperDischarge"];

  String get ApplicationRateperM2 => _data["ApplicationRateperM2"];

  String get FromRow => _data["FromRow"];

  String get ToRow => _data["ToRow"];

  String get TotalCultivationArea => _data["TotalCultivationArea"];

  String get ValveDetails => _data["ValveDetails"];

  String get cannot_submit_entry_previous_dates =>
      _data["cannot_submit_entry_previous_dates"];

  // String get PostProductionProcess => _data["PostProductionProcess"];
  String get Productdetails => _data["Productdetails"];

  String get actualweight => _data["actualweight"];

  String get Plotsubplot => _data["Plotsubplot"];

  String get CollectionPoint => _data["CollectionPoint"];

  String get TotalNoofProduct => _data["TotalNoofProduct"];

  String get labour_not_inprocess => _data["labour_not_inprocess"];

  String get cropimage => _data["cropimage"];

  String get propertytype => _data["propertytype"];

  String get resourcetype => _data["resourcetype"];

  String get propertytypedetails => _data["propertytypedetails"];

  String get StoreLocation => _data["StoreLocation"];

  String get AvailableStock => _data["AvailableStock"];

  String get StorageCapacity => _data["StorageCapacity"];

  String get WaterPump => _data["WaterPump"];

  String get Labour_already_added => _data["Labour_already_added"];

  String get CropDetails => _data["CropDetails"];

  String get ProductvityDetails => _data["ProductvityDetails"];

  String get RegistrationDate => _data["RegistrationDate"];

  String get contractnumber => _data["contractnumber"];

  String get FINno => _data["FINno"];

  String get SchemeName => _data["SchemeName"];

  String get Nurserysowingdate => _data["Nurserysowingdate"];

  String get TransplantingDate => _data["TransplantingDate"];

  String get FruitPruningDate => _data["FruitPruningDate"];

  String get HarvestingDate => _data["HarvestingDate"];

  String get Numberofplants => _data["Numberofplants"];

  String get year => _data["year"];

  String get AverageTonsAcre => _data["AverageTonsAcre"];

  String get QualityProblemFaced => _data["QualityProblemFaced"];

  String get GPSCoordinates => _data["GPSCoordinates"];

  String get Domestic => _data["Domestic"];

  String get Exports_Tons => _data["Exports_Tons"];

  String get average => _data["average"];

  String get pleaseaddrateprofileundersm =>
      _data["pleaseaddrateprofileundersm"];

  String get SchemeNamecannotbeblank => _data["SchemeNamecannotbeblank"];

  String get plotaddress => _data["plotaddress"];

  String get GutNumberSurveyNumber => _data["GutNumberSurveyNumber"];

  String get MH_Number => _data["MH_Number"];

  String get Landtype => _data["Landtype"];

  String get GlobalGapFarmer => _data["GlobalGapFarmer"];

  String get Intercrop => _data["Intercrop"];

  String get FundSupport => _data["FundSupport"];

  String get FundSupportType => _data["FundSupportType"];

  String get Harvesttype => _data["Harvesttype"];

  String get FarmerFundApprovedAmount => _data["FarmerFundApprovedAmount"];

  String get BalanceAmount => _data["BalanceAmount"];

  String get FundUtilizedContract => _data["FundUtilizedContract"];

  String get Pleaseentervalidplotarea => _data["Pleaseentervalidplotarea"];

  String get PlotAreaCannotbeempty => _data["PlotAreaCannotbeempty"];

  String get Crop => _data["Crop"];

  String get Cropvaluecannotbeempty => _data["Cropvaluecannotbeempty"];

  String get Pleaseentervalidvalue => _data["Pleaseentervalidvalue"];

  String get Domesticvaluecannotbeempty => _data["Domesticvaluecannotbeempty"];

  String get Domesticvaluecannotbe0 => _data["Domesticvaluecannotbe0"];

  String get Exportsvaluecannotbeempty => _data["Exportsvaluecannotbeempty"];

  String get Exportscannotbe0 => _data["Exportscannotbe0"];

  String get Averagecannotbeempty => _data["Averagecannotbeempty"];

  String get Averagecannotbe0 => _data["Averagecannotbe0"];

  String get Get => _data["Get"];

  String get Confirm => _data["Confirm"];

  String get douwanttoclearalldata => _data["douwanttoclearalldata"];

  String get douwanttoremovelastgcoornate =>
      _data["douwanttoremovelastgcoornate"];

  String get douwanttosaveallcoordinate => _data["douwanttosaveallcoordinate"];

  String get minimum3coordinaterequired => _data["minimum3coordinaterequired"];

  String get distancenotgreterrthan2km => _data["distancenotgreterrthan2km"];

  String get FoundationPruningDate => _data["FoundationPruningDate"];

  String get SelectSowingPlantingDateFirst =>
      _data["SelectSowingPlantingDateFirst"];

  String get CropNamenotempty => _data["CropNamenotempty"];

  String get CropVarietynotempty => _data["CropVarietynotempty"];

  String get SowingPlantingDatenotempty => _data["SowingPlantingDatenotempty"];

  String get NurserySowingDatenotempty => _data["NurserySowingDatenotempty"];

  String get CropDurationnotempty => _data["CropDurationnotempty"];

  String get CropDurationnot0 => _data["CropDurationnot0"];

  String get HarvestDaysnotempty => _data["HarvestDaysnotempty"];

  String get HarvestDaysnot0 => _data["HarvestDaysnot0"];

  String get Pleaseentervaliddistance => _data["Pleaseentervaliddistance"];

  String get PlanttoPlantDistancenotempty =>
      _data["PlanttoPlantDistancenotempty"];

  String get PlanttoPlantDistancenot0 => _data["PlanttoPlantDistancenot0"];

  String get RowtoRowDistancenotempty => _data["RowtoRowDistancenotempty"];

  String get RowtoRowDistancenot0 => _data["RowtoRowDistancenot0"];

  String get SchemeRegistrationFilter => _data["SchemeRegistrationFilter"];

  String get GoodsIssue => _data["GoodsIssue"];

  String get CurrentCropDuration => _data["CurrentCropDuration"];

  String get MoreFilters => _data["MoreFilters"];

  String get SelectPropertyType => _data["SelectPropertyType"];

  String get FromLocation => _data["FromLocation"];

  String get ToLocation => _data["ToLocation"];

  String get GoodsTransfer => _data["GoodsTransfer"];

  String get MaterialIndentDetails => _data["MaterialIndentDetails"];

  String get GoodsIssueTo => _data["GoodsIssueTo"];

  String get GoodsTransferTo => _data["GoodsTransferTo"];

  String get SelectMaterialIndent => _data["SelectMaterialIndent"];

  String get MaterialIndentNumber => _data["MaterialIndentNumber"];

  String get RequiredQuantity => _data["RequiredQuantity"];

  String get RequiredCulture => _data["RequiredCulture"];

  String get AvailableCulture => _data["AvailableCulture"];

  String get AcceptedCulture => _data["AcceptedCulture"];

  String get ItemList => _data["ItemList"];

  String get OrderDetails => _data["OrderDetails"];

  String get BillingDetails => _data["BillingDetails"];

  String get ShippingDtails => _data["ShippingDtails"];

  String get OtherDetails => _data["OtherDetails"];

  String get Bookinglocation => _data["Bookinglocation"];

  String get CustomerName => _data["CustomerName"];

  String get Ordertype => _data["Ordertype"];

  String get CustomerAddress => _data["CustomerAddress"];

  String get Currency => _data["Currency"];

  String get cifsoccnf => _data["cifsoccnf"];

  String get PhoneNumber => _data["PhoneNumber"];

  String get FaxNumber => _data["FaxNumber"];

  String get DueDate => _data["DueDate"];

  String get Reminderdaysbefore => _data["Reminderdaysbefore"];

  String get Paymenttermindays => _data["Paymenttermindays"];

  String get DeliveryInstructions => _data["DeliveryInstructions"];

  String get Packagingandforwording => _data["Packagingandforwording"];

  String get QualityandSpecification => _data["QualityandSpecification"];

  String get Producttype => _data["Producttype"];

  String get product => _data["product"];

  String get CantselectVehicle => _data["CantselectVehicle"];

  String get None => _data["None"];

  String get PleaseSelectGoodsTransferTo =>
      _data["PleaseSelectGoodsTransferTo"];

  String get PleaseSelectToLocation => _data["PleaseSelectToLocation"];

  String get PleaseSelectFromLocation => _data["PleaseSelectFromLocation"];

  String get PleaseSelectDate => _data["PleaseSelectDate"];

  String get GRQNNumber => _data["GRQNNumber"];

  String get TreeObservation => _data["TreeObservation"];

  String get ActivityDoneBeforeObservation =>
      _data["ActivityDoneBeforeObservation"];

  String get FromTree => _data["FromTree"];

  String get ToTree => _data["ToTree"];

  String get TotalTrees => _data["TotalTrees"];

  String get NoOfTreesCovered => _data["NoOfTreesCovered"];

  String get TreeCode => _data["TreeCode"];

  String get SampleTrees => _data["SampleTrees"];

  String get BusinessType => _data["BusinessType"];

  String get BusinessCompanyName => _data["BusinessCompanyName"];

  String get CompanyRegisterNo => _data["CompanyRegisterNo"];

  String get PanNo => _data["PanNo"];

  String get ContactPersonName => _data["ContactPersonName"];

  String get WhatsappNo => _data["WhatsappNo"];

  String get AlternateMobileNo => _data["AlternateMobileNo"];

  String get SendOTP => _data["SendOTP"];

  String get EnterOTP => _data["EnterOTP"];

  String get pleaseSelectFarmer => _data["pleaseSelectFarmer"];

  String get expectedHarvestDetails => _data["expectedHarvestDetails"];

  String get Budget => _data["Budget"];

  String get Resource => _data["Resource"];

  String get Register => _data["Register"];

  String get BusinessAddress => _data["BusinessAddress"];

  String get LandMark => _data["LandMark"];

  String get ServiceDetails => _data["ServiceDetails"];

  String get UploadPhotos => _data["UploadPhotos"];

  String get AddBankDetails => _data["AddBankDetails"];

  String get AccountHolderName => _data["AccountHolderName"];

  String get EnterMobileUPI => _data["EnterMobileUPI"];

  String get HarvestQtyInKG => _data["HarvestQtyInKG"];

  String get HarvestNumber => _data["HarvestNumber"];

  String get Grade => _data["Grade"];

  String get TotalExpectedHarvest => _data["TotalExpectedHarvest"];

  String get HarvestForecastGrower => _data["HarvestForecastGrower"];

  String get cropSchedule => _data["cropSchedule"];

  String get Germination => _data["Germination"];

  String get MiddleStage => _data["MiddleStage"];

  String get plot_no => _data["plot_no"];

  String get ExpectedHarvestDetails => _data["ExpectedHarvestDetails"];

  String get TotalNumberOfHarvest => _data["TotalNumberOfHarvest"];

  String get productdashboard => _data["productdashboard"];

  String get Month => _data["Month"];

  String get Week1 => _data["Week1"];

  String get Week2 => _data["Week2"];

  String get Week3 => _data["Week3"];

  String get Week4 => _data["Week5"];

  String get Week5 => _data["Week6"];

  String get Week => _data["Week"];

  String get crop => _data["crop"];

  String get variety => _data["variety"];

  String get ProductDashboard => _data["ProductDashboard"];

  String get VendorDetails => _data["VendorDetails"];

  String get OrganizationCode => _data["OrganizationCode"];

  String get UPI => _data["UPI"];

  String get PhonePe => _data["PhonePe"];

  String get VerifyOTP => _data["VerifyOTP"];

  String get OTPVerified => _data["OTPVerified"];

  String get PleaseEnterBusinessCompanyName =>
      _data["PleaseEnterBusinessCompanyName"];

  String get PleaseEnterBusinessType => _data["PleaseEnterBusinessType"];

  String get PleaseEnterContactPersonName =>
      _data["PleaseEnterContactPersonName"];

  String get PleaseEnterVillageName => _data["PleaseEnterVillageName"];

  String get PleaseEnterBusinessAddress => _data["PleaseEnterBusinessAddress"];

  String get PleaseEnterAccountHolderName =>
      _data["PleaseEnterAccountHolderName"];

  String get TreeDetails => _data["TreeDetails"];

  String get TreeSelection => _data["TreeSelection"];

  String get ParameterDetails => _data["ParameterDetails"];

  String get IssueTransferGoodsReturn => _data["IssueTransferGoodsReturn"];

  String get GoodsReturnIssueTransfer => _data["GoodsReturnIssueTransfer"];

  String get StoreDetails => _data["StoreDetails"];

  String get GoodIssuetransferNumberr => _data["GoodIssuetransferNumberr"];

  String get TransportationsDetails => _data["TransportationsDetails"];

  String get Type => _data["Type"];

  String get asterriskType => _data["asterriskType"];

  String get ReturnToUser => _data["ReturnToUser"];

  String get ServiceType => _data["ServiceType"];

  String get ServiceIndent => _data["ServiceIndent"];

  String get IndentType => _data["IndentType"];

  String get VendorRegistration => _data["VendorRegistration"];

  String get IssueTransferLocation => _data["IssueTransferLocation"];

  String get GoodsReturnLocation => _data["GoodsReturnLocation"];

  String get IssueTransferQuantity => _data["IssueTransferQuantity"];

  String get SeedlingCulturesQuantity => _data["SeedlingCulturesQuantity"];

  String get SeedlingQuantity => _data["SeedlingQuantity"];

  String get GoodsReturn => _data["GoodsReturn"];

  String get returntouser => _data["returntouser"];

  String get SelectGINNumber => _data["SelectGINNumber"];

  String get SitePlotList => _data["SitePlotList"];

  String get SelectUnit => _data["SelectUnit"];

  String get TrySayingSomething => _data["TrySayingSomething"];

  String get TotalFarmer => _data["TotalFarmer"];

  String get ActivePlot => _data["ActivePlot"];

  String get Total_Plot => _data["Total_Plot"];

  String get Todays_Date => _data["Todays_Date"];

  String get CurrentTime => _data["CurrentTime"];

  String get VoiceAssistant => _data["VoiceAssistant"];

  String get ServiceRequestDetails => _data["ServiceRequestDetails"];

  String get ServiceProductDetails => _data["ServiceProductDetails"];

  String get ServiceRequest => _data["ServiceRequest"];

  String get RequestedToVendor => _data["RequestedToVendor"];

  String get MoreDetails => _data["MoreDetails"];

  String get OrderNumber => _data["OrderNumber"];

  String get PartyAddress => _data["PartyAddress"];

  String get NotFound => _data["NotFound"];

  String get InvalidQRCode => _data["InvalidQRCode"];

  String get QRCodeRequestCancel => _data["QRCodeRequestCancel"];

  String get pop => _data["pop"];

  String get call => _data["call"];

  String get direction => _data["direction"];

  String get SendRequest => _data["SendRequest"];

  String get NoPreveousTree => _data["NoPreveousTree"];

  String get PleaseSelectValue => _data["PleaseSelectValue"];

  String get PleaseSelectMandatoryValue => _data["PleaseSelectMandatoryValue"];

  String get CantSelectMoreThanOneAttachment =>
      _data["CantSelectMoreThanOneAttachment"];

  String get CanNotEditUploadedImages => _data["CanNotEditUploadedImages"];

  String get WhatWouldYouLikeToDo => _data["WhatWouldYouLikeToDo"];

  String get AddCaption => _data["AddCaption"];

  String get Share => _data["Share"];

  String get EnterCaption => _data["EnterCaption"];

  String get PleaseEnterCaption => _data["PleaseEnterCaption"];

  String get Close => _data["Close"];

  String get PleaseSelectAtleastOneTree => _data["PleaseSelectAtleastOneTree"];

  String get IssueTransferSeedlingCulQuantity =>
      _data["IssueTransferSeedlingCulQuantity"];

  String get Tehsil => _data["Tehsil"];

  String get SelectTehsil => _data["SelectTehsil"];

  String get TodaysDate => _data["TodaysDate"];

  String get selectGINnumberFirst => _data["selectGINnumberFirst"];

  String get selectType => _data["selectType"];

  String get SelectIssueTransferLocation =>
      _data["SelectIssueTransferLocation"];

  String get select_item_first => _data["select_item_first"];

  String get lessseedculqtythanseedqty => _data["lessseedculqtythanseedqty"];

  String get ServiceList => _data["ServiceList"];

  String get NoEstimatedHarvestThisWeek => _data["NoEstimatedHarvestThisWeek"];

  String get ReceiveLocation => _data["ReceiveLocation"];

  String get GoodsReceiveType => _data["GoodsReceiveType"];

  String get PleaseselectLocationorType => _data["PleaseselectLocationorType"];

  String get VendororSupplier => _data["VendororSupplier"];

  String get SelectPONumber => _data["SelectPONumber"];

  String get ReferenceDocumentNumber => _data["ReferenceDocumentNumber"];

  String get ChallandocumentNumber => _data["ChallandocumentNumber"];

  String get ChallanSerialNo => _data["ChallanSerialNo"];

  String get InvoiceNumber => _data["InvoiceNumber"];

  String get PleaseselectReceiveLocation =>
      _data["PleaseselectReceiveLocation"];

  String get PleaseselectGoodsreceiveType =>
      _data["PleaseselectGoodsreceiveType"];

  String get PleaseselectVendorName => _data["PleaseselectVendorName"];

  String get PleaseselectReferenceDocumentNumber =>
      _data["PleaseselectReferenceDocumentNumber"];

  String get PleaseEnterChallanDocumentNumber =>
      _data["PleaseEnterChallanDocumentNumber"];

  String get PleaseenterserialNumber => _data["PleaseenterserialNumber"];

  String get GoodsReceive => _data["GoodsReceive"];

  String get InvoiceQuantity => _data["InvoiceQuantity"];

  String get ReceivedQuantity => _data["ReceivedQuantity"];

  String get RejectedQuantity => _data["RejectedQuantity"];

  String get AcceptedQuantity => _data["AcceptedQuantity"];

  String get ReceivedCultures => _data["ReceivedCultures"];

  String get RejectedCultures => _data["RejectedCultures"];

  String get AcceptedCultures => _data["AcceptedCultures"];

  String get ExpiryDate => _data["ExpiryDate"];

  String get ReceivedquantityerrorRequiredQuantity =>
      _data["ReceivedquantityerrorRequiredQuantity"];

  String get RejectedQuantitywillalwaysbelessthanTotalQuantity =>
      _data["RejectedQuantitywillalwaysbelessthanTotalQuantity"];

  String get PleaseenterReceivedQuantity =>
      _data["PleaseenterReceivedQuantity"];

  String get PleaseenterrejectedQuantity =>
      _data["PleaseenterrejectedQuantity"];

  String get DeliveryDispatch => _data["DeliveryDispatch"];

  String get DispatchLocation => _data["DispatchLocation"];

  String get SubContract => _data["SubContract"];

  String get SalesOrderNumber => _data["SalesOrderNumber"];

  String get ChallanDocnumber => _data["ChallanDocnumber"];

  String get selectChallanDocnumber => _data["selectChallanDocnumber"];

  String get ChallanSerialNum => _data["ChallanSerialNum"];

  String get selectChallanSerialNum => _data["selectChallanSerialNum"];

  String get OutputItem => _data["OutputItem"];

  String get OutputItemQty => _data["OutputItemQty"];

  String get DeliveryDate => _data["DeliveryDate"];

  String get skutype => _data["skutype"];

  String get selectsubcontract => _data["selectsubcontract"];

  String get please_select_customer_name =>
      _data["please_select_customer_name"];

  String get ItemFilter => _data["ItemFilter"];

  String get EquipmentIssueandReturn => _data["EquipmentIssueandReturn"];

  String get EquipmentIssueTo => _data["EquipmentIssueTo"];

  String get PleaseSelectEquipmentIssueTo =>
      _data["PleaseSelectEquipmentIssueTo"];

  String get selectvehiclenumber => _data["selectvehiclenumber"];

  String get selectpersonname => _data["selectpersonname"];

  String get selectReturntouser => _data["selectReturntouser"];

  String get fromdatenotgreaterthantodate =>
      _data["fromdatenotgreaterthantodate"];

  String get connecttointernetfirst => _data["connecttointernetfirst"];

  String get actual => _data["actual"];

  String get machine_maintenance => _data["machine_maintenance"];

  String get asset_details => _data["asset_details"];

  String get asset_parts => _data["asset_parts"];

  String get asset_servicing => _data["asset_servicing"];

  String get SoilAnalysis => _data["SoilAnalysis"];

  String get SampleCollectionDate => _data["SampleCollectionDate"];

  String get SampleTestingDate => _data["SampleTestingDate"];

  String get PSSNGN => _data["PSSNGN"];

  String get LaboratoryName => _data["LaboratoryName"];

  String get sampleNumber => _data["sampleNumber"];

  String get analysisType => _data["analysisType"];

  String get chemicalParameters => _data["chemicalParameters"];

  String get ph => _data["ph"];

  String get EC => _data["EC"];

  String get OrganicCarbon => _data["OrganicCarbon"];

  String get AvailableNitrogen => _data["AvailableNitrogen"];

  String get SecondaryNutrient => _data["SecondaryNutrient"];

  String get phosphours => _data["phosphours"];

  String get potash => _data["potash"];

  String get calcium => _data["calcium"];

  String get magnesium => _data["magnesium"];

  String get Sulphur => _data["Sulphur"];

  String get Copper => _data["Copper"];

  String get Sulfate => _data["Sulfate"];

  String get Nitrates => _data["Nitrates"];

  String get Ammonia => _data["Ammonia"];

  String get Urea => _data["Urea"];

  String get Sodium => _data["Sodium"];

  String get Potassium => _data["Potassium"];

  String get DihydrogenPhosphate => _data["DihydrogenPhosphate"];

  String get Iron => _data["Iron"];

  String get Manganese => _data["Manganese"];

  String get Zinc => _data["Zinc"];

  String get Boron => _data["Boron"];

  String get Molybdenum => _data["Molybdenum"];


  String get ReturnQuantity => _data["ReturnQuantity"];

  String get mm_request_number => _data["mm_request_number"];

  String get asset_type => _data["asset_type"];

  String get asset_name => _data["asset_name"];

  String get maintenance_type => _data["maintenance_type"];

  String get internal_maintenance => _data["internal_maintenance"];

  String get external_maintenance => _data["external_maintenance"];

  String get machine_type => _data["machine_type"];

  String get FertilizerRecommendation => _data["FertilizerRecommendation"];

  String get day => _data["day"];

  String get RemainingQuantity => _data["RemainingQuantity"];

  String get IssueQty => _data["IssueQty"];

  String get ReturnDetails => _data["ReturnDetails"];

  String get FarmerVisit => _data["FarmerVisit"];

  String get GradeTemplate => _data["GradeTemplate"];

  String get ExpectedQuantity => _data["ExpectedQuantity"];

  String get ExpectedGrade => _data["ExpectedGrade"];

  String get QuantityMT => _data["QuantityMT"];

  String get TotalQuantity => _data["TotalQuantity"];

  String get TotalPer => _data["TotalPer"];

  String get PersonalInformation => _data["PersonalInformation"];

  String get ExpectedYield => _data["ExpectedYield"];

  String get HarvestDetails => _data["HarvestDetails"];

  String get RackRate => _data["RackRate"];

  String get FarmerExpectation => _data["FarmerExpectation"];

  String get GradeRate => _data["GradeRate"];

  String get HarvestType => _data["HarvestType"];

  String get ArilesColorGrade => _data["ArilesColorGrade"];

  String get SkinColor => _data["SkinColor"];

  String get BlushPer => _data["BlushPer"];

  String get DiseaseDefectObserved => _data["DiseaseDefectObserved"];

  String get ResidueFree => _data["ResidueFree"];

  String get PlotSampleCollectedDate => _data["PlotSampleCollectedDate"];

  String get SampleCollectedDetails => _data["SampleCollectedDetails"];

  String get Comment => _data["Comment"];

  String get RecordDeletedSuccessfully => _data["RecordDeletedSuccessfully"];

  String get NoOfBucketsOrDrums => _data["NoOfBucketsOrDrums"];

  String get PleaseEnterNoOfBucketsOrDrums =>
      _data["PleaseEnterNoOfBucketsOrDrums"];

  String get TappingDetails => _data["TappingDetails"];

  String get TreeEncodingNotFound => _data["TreeEncodingNotFound"];

  String get asset_work_hours => _data["asset_work_hours"];

  String get select_asset_parts => _data["select_asset_parts"];

  String get no_asset_part_added => _data["no_asset_part_added"];

  String get maintenance_form_number => _data["maintenance_form_number"];

  String get current_meter_reading => _data["current_meter_reading"];

  String get reminder_before_num_days => _data["reminder_before_num_days"];

  String get last_operator_name => _data["last_operator_name"];

  String get last_maintenance_date => _data["last_maintenance_date"];

  String get next_maintenance_date => _data["next_maintenance_date"];
  String get PleaseSelectDateOfBirth => _data["PleaseSelectDateOfBirth"];

  String get expensedetails => _data["expensedetails"];

  String get ExpenseType => _data["ExpenseType"];

  String get AmountINR => _data["AmountINR"];

  String get TotalExpenseINR => _data["TotalExpenseINR"];

  String get Seed => _data["Seed"];
  String get Transportation => _data["Transportation"];
  String get Commission => _data["Commission"];
  String get Fuel => _data["Fuel"];
  String get Electricity => _data["Electricity"];
  String get ConsultationFee => _data["ConsultationFee"];
  String get CertificationFee => _data["CertificationFee"];

  String get SalesGoodsReturn => _data["SalesGoodsReturn"];

  String get SalesReturnNumber => _data["SalesReturnNumber"];

  String get warranty_expiry_date => _data["warranty_expiry_date"];
  String get PleaseEnterValidAmount => _data["PleaseEnterValidAmount"];
  String get MicroNutrient => _data["MicroNutrient"];
  String get SoilDetails => _data["SoilDetails"];
  String get PleaseSelectLaboratoryName => _data["PleaseSelectLaboratoryName"];
  String get PleaseEnterLabnumber => _data["PleaseEnterLabnumber"];
  String get PleaseSelectAnalysisType => _data["PleaseSelectAnalysisType"];
  String get PleaseEnterPhValue => _data["PleaseEnterPhValue"];
  String get PleaseEnterECValue => _data["PleaseEnterECValue"];
  String get PleaseEnterOrganicCarbonValue => _data["PleaseEnterOrganicCarbonValue"];
  String get PleaseEnterAvailableNitrogenValue => _data["PleaseEnterAvailableNitrogenValue"];
  String get PleaseEnterPhosphoursValue => _data["PleaseEnterPhosphoursValue"];
  String get PleaseEnterPotashValue => _data["PleaseEnterPotashValue"];
  String get PleaseEnterCalciumValue => _data["PleaseEnterCalciumValue"];
  String get PleaseEnterMagnesiumValue => _data["PleaseEnterMagnesiumValue"];
  String get PleaseEnterCopperValue => _data["PleaseEnterCopperValue"];
  String get PleaseEnterSulfateValue => _data["PleaseEnterSulfateValue"];
  String get PleaseEnterNitrateValue => _data["PleaseEnterNitrateValue"];
  String get PleaseEnterAmmoniaValue => _data["PleaseEnterAmmoniaValue"];
  String get PleaseEnterUreaValue => _data["PleaseEnterUreaValue"];
  String get PleaseEnterSodiumValue => _data["PleaseEnterSodiumValue"];
  String get PleaseEnterPotassiumValue => _data["PleaseEnterPotassiumValue"];
  String get PleaseEnterDihydrogenPhosphateValue => _data["PleaseEnterDihydrogenPhosphateValue"];
  String get PleaseEnterIronValue => _data["PleaseEnterIronValue"];
  String get PleaseEnterManganeseValue => _data["PleaseEnterManganeseValue"];
  String get PleaseEnterZincValue => _data["PleaseEnterZincValue"];
  String get PleaseEnterBoronValue => _data["PleaseEnterBoronValue"];
  String get PleaseEnterMolybdenumValue => _data["PleaseEnterMolybdenumValue"];
  String get PleaseSelectSampleTestDate => _data["PleaseSelectSampleTestDate"];
  String get DeliveryDispatchNumber => _data["DeliveryDispatchNumber"];
  String get asset_specific_details => _data["asset_specific_details"];
  String get machine_details => _data["machine_details"];
  String get Crates => _data["Crates"];
  String get DriverName => _data["DriverName"];
  String get DispatchTime => _data["DispatchTime"];
  String get TransporterName => _data["TransporterName"];
  String get TransportationCost => _data["TransportationCost"];
  String get VehicleType => _data["VehicleType"];
  String get FarmerCode => _data["FarmerCode"];
  String get ReceiptNumber => _data["ReceiptNumber"];
  String get DealClousre => _data["DealClousre"];
  String get FieldSupervisorName => _data["FieldSupervisorName"];
  String get RateProfilenName => _data["RateProfilenName"];
  String get Status => _data["Status"];
  String get DealDetails => _data["DealDetails"];
  String get ExpectedYieldForDeal => _data["ExpectedYieldForDeal"];
  String get ExpectedDealRate => _data["ExpectedDealRate"];
  String get ApproveHistory => _data["ApproveHistory"];
  String get ExpectedQuantityUnit => _data["ExpectedQuantityUnit"];
  String get ExpectedDAGrade => _data["ExpectedDAGrade"];
  String get ExpectedBGrade => _data["ExpectedBGrade"];
  String get ExpectedCGrade => _data["ExpectedCGrade"];
  String get MT => _data["MT"];
  String get DealType => _data["DealType"];
  String get ExpectedYieldforDeal => _data["ExpectedYieldforDeal"];
  String get ApprovalHistoryDetails => _data["ApprovalHistoryDetails"];
  String get GradeTemplateName => _data["GradeTemplateName"];
  String get RackProfile => _data["RackProfile"];
  String get GeoTaggedArea => _data["GeoTaggedArea"];
  String get UpdateAvailable => _data["UpdateAvailable"];
  String get NewVersionAvailable => _data["NewVersionAvailable"];
  String get UpdateApp => _data["UpdateApp"];
  String get UpdateAppForLatestVersion => _data["UpdateAppForLatestVersion"];
  String get Username => _data["Username"];
  String get Action => _data["Action"];
  String get nohistoryfound => _data["nohistoryfound"];
  String get username => _data["username"];
  String get action => _data["action"];


  String get TotalNoofParts => _data["TotalNoofParts"];
  String get parts => _data["parts"];
  String get asset_receive_details => _data["asset_receive_details"];
  String get asset_receive_parts_details => _data["asset_receive_parts_details"];
  String get asset_receive_service_details => _data["asset_receive_service_details"];
  String get received_date => _data["received_date"];
  String get received_by => _data["received_by"];
  String get asset_status => _data["asset_status"];
  String get maintenance_payment_type => _data["maintenance_payment_type"];
  String get part_name => _data["part_name"];
  String get please_enter_partname => _data["please_enter_partname"];
  String get part_details => _data["part_details"];
  String get warranty_years => _data["warranty_years"];
  String get planDetails => _data["planDetails"];
  String get please_add_parts => _data["please_add_parts"];
  String get Non_Agri_Record_Keeping => _data["Non_Agri_Record_Keeping"];
  String get Application_Specific_Details => _data["Application_Specific_Details"];
  String get Service_Contract_Details => _data["Service_Contract_Details"];
  String get Operatinal_Expenses => _data["Operatinal_Expenses"];
  String get Captial_Expenditure => _data["Captial_Expenditure"];
  String get Activity_Contractor => _data["Activity_Contractor"];
  String get nursery_operations => _data["nursery_operations"];
  String get nursery_details => _data["nursery_details"];
  String get fertilizer_template => _data["fertilizer_template"];
  String get AnimalRecordKeeping => _data["AnimalRecordKeeping"];
  String get AnimalBreed => _data["AnimalBreed"];
  String get Animal => _data["Animal"];
  String get FromTagNumber => _data["FromTagNumber"];
  String get ToTagNumber => _data["ToTagNumber"];

}

class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();

  final idMap = const {
    'en': 'assets/string/en.json',
    'fr': 'assets/string/fr.json',
    'mr': 'assets/string/mr.json',
    'ar': 'assets/string/ar.json',
    'th': 'assets/string/th.json',
    'es': 'assets/string/es.json',
    'az': 'assets/string/az.json'

  };

  @override
  bool isSupported(Locale locale) {
    if (locale.countryCode == "ar" && locale.languageCode == "ar_EG") {
      return true;
    } else {
      return ['en', 'fr', "ar_EG", "ar", "th","es","tr","az"].contains(locale.languageCode);
    }
  }

  // locale.countryCode == "ar" && locale.languageCode == "ar_EG";
  @override
  Future<LocaleBase> load(Locale locale) async {
    String language = await SessionManager().getLanguage();
    if (language == null || language == "") {
      language = "English";
      await SessionManager().setValue(SessionManager.Language, "English");
    }

    var lang = language == "English"
        ? 'en'
        : language == "French"
            ? 'fr'
            : language == "Arabic"
                ? 'ar'
                : language == "ไทย"
                    ? 'th'
                      : language == "Español"
                          ? 'es': language == "Azərbaycanca"
                          ? 'az'
                    : 'en';

    // Utils.showLog("lang", lang);
    // Utils.showLog("LoginPage.Language", language.toString());

    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    await loc.load(idMap[lang]);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}
