import 'package:booking_calendar/booking_calendar.dart';
import 'package:dollar_task/shared/design/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../../shared/AppFont.dart';
import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/CommonConstants.dart';
import '../HomeController.dart';
import 'PackageScreen.dart';

class AppointmentScreen extends StatefulWidget {
  final HomeController controller;
  String doctorName;
  AppointmentScreen({Key? key, required this.controller,required this.doctorName}) : super(key: key);

  @override
  _AppointmentScreenState createState() {
    return _AppointmentScreenState();
  }
}

class _AppointmentScreenState extends State<AppointmentScreen> {



  @override
  void dispose() {
    super.dispose();
  }
  Future<void> _loadData() async {
    try {



    } catch (err) {

    }
  }
  onChanged(String va)
  {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  RefreshIndicator(
      onRefresh: _loadData,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text( LocalString.getStringValue(context, 'create_appointment') ??
              "انشاء موعد",  style: AppFont.regular.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),) ,
        ),
        body: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                about()
              ],
            ) //<Widget>[]
        ),
      ),
    );
  }

  Widget about()
  {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Date" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          SizedBox(height: 5,),
          buildCalander()
        ],
      ),
    );
  }
  List<DateTimeRange> converted = [];
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return PackageScreen(
          controller: widget.controller, doctorName: widget.doctorName,
        );
      },
    ));
  }

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    DateTime tomorrow = now.add(Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }
  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  Widget buildCalander()
  {
    return  Container(
      height: SizeConfig().screenHeight*0.7,
      child: BookingCalendar(
        bookingService: mockBookingService,
        convertStreamResultToDateTimeRanges: convertStreamResultMock,
        getBookingStream: getBookingStreamMock,
        bookingButtonColor: ColorConstants.greenColor,
        uploadBooking: uploadBookingMock,

        pauseSlots: generatePauseSlots(),
        pauseSlotText: 'LUNCH',
        hideBreakTime: false,
        loadingWidget: const Text('Fetching data...'),
        uploadingWidget: Center(child: Text('Uploading data...')),
        locale: 'En',
        startingDayOfWeek: StartingDayOfWeek.tuesday,
        wholeDayIsBookedWidget:
        const Text('Sorry, for this day everything is booked'),
        //disabledDates: [DateTime(2023, 1, 20)],
        //disabledDays: [6, 7],
      ),
    );
  }

}