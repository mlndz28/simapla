const gulp = require('gulp');
const concat = require('gulp-concat');

var sourcePath = './src/';
var sqlFiles = [
  'Settings/Settings.sql'
  , 'Schema/SimaplaDB.sql'

  , 'Table/Country.sql'
  , 'Table/Province.sql'
  , 'Table/ProvinceXCountry.sql'
  , 'Table/Canton.sql'
  , 'Table/CantonXProvince.sql'
  , 'Table/District.sql'
  , 'Table/DistrictXCanton.sql'
  , 'Table/SpecificAddress.sql'
  , 'Table/SpecificAddressXDistrict.sql'
  , 'Table/Person.sql'
  , 'Table/AddressXPerson.sql'
  , 'Table/Phone.sql'
  , 'Table/Email.sql'
  , 'Table/PhoneXPerson.sql'
  , 'Table/EmailXPerson.sql'
  , 'Table/Student.sql'
  , 'Table/InstrumentName.sql'
  , 'Table/Teacher.sql'
  , 'Table/ManagementPosition.sql'
  , 'Table/Administrator.sql'
  , 'Table/Patrimony.sql'
  , 'Table/Instrument.sql'
  , 'Table/InstrumentXStudent.sql'
  , 'Table/Group.sql'
  , 'Table/GroupXPerson.sql'
  , 'Table/GroupType.sql'
  , 'Table/GroupXGroupType.sql'
  , 'Table/Schedule.sql'
  , 'Table/ScheduleXGroup.sql'
  , 'Table/Session.sql'
  // , 'Table/SessionXScheduleXGroup.sql'
  , 'Table/AttendanceType.sql'
  , 'Table/Attendance.sql'
  , 'Table/EventLevel.sql'
  , 'Table/EventSource.sql'
  , 'Table/ObjectLog.sql'
  , 'Table/EventType.sql'
  // , 'Table/Log.sql'
  , 'Table/Carnet.sql'
  , 'Table/CarnetXPerson.sql'
  // , 'Table/Event.sql'
  , 'Table/EventType.sql'
  , 'Table/EventTypeXEvent.sql'
  , 'Table/GroupXEvent.sql'

  // , 'Users/marcello.sql'
  // , 'Users/fabian.sql'
  // , 'Users/emilio.sql'
  // , 'Users/nicolas.sql'
  // , 'Users/WebClient.sql'
  // , 'Users/WebService.sql'

  , 'Settings/FinalSettings.sql'
];
for (let i = 0; i < sqlFiles.length; i++) {
  sqlFiles[i] = sourcePath + sqlFiles[i];
}

gulp.task('mysql', () => {
  return gulp.src(sqlFiles)
  .pipe(concat('script.sql'))
  .pipe(gulp.dest('./dist/'));
});

gulp.task('watch', () => {
  gulp.watch(sqlFiles, ['mysql']);
});

gulp.task('default', ['mysql', 'watch']);
