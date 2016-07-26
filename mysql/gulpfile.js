const gulp = require('gulp');
const concat = require('gulp-concat');

var sourcePath = './src/';
var sqlFiles = [
  'settings.sql'
  , 'schemas.sql'

  , 'tables/Country.sql'
  , 'tables/Province.sql'
  , 'tables/ProvinceXCountry.sql'
  , 'tables/Canton.sql'
  , 'tables/CantonXProvince.sql'
  , 'tables/District.sql'
  , 'tables/DistrictXCanton.sql'
  , 'tables/SpecificAddress.sql'
  , 'tables/SpecificAddressXDistrict.sql'
  , 'tables/Person.sql'
  , 'tables/AddressXPerson.sql'
  , 'tables/Phone.sql'
  , 'tables/Email.sql'
  , 'tables/PhoneXPerson.sql'
  , 'tables/EmailXPerson.sql'
  , 'tables/Student.sql'
  , 'tables/InstrumentName.sql'
  , 'tables/Teacher.sql'
  , 'tables/ManagementPosition.sql'
  , 'tables/Administrator.sql'
  , 'tables/Patrimony.sql'
  , 'tables/Instrument.sql'
  , 'tables/InstrumentXStudent.sql'
  , 'tables/Group.sql'
  , 'tables/GroupXPerson.sql'
  , 'tables/GroupType.sql'
  , 'tables/GroupXGroupType.sql'
  , 'tables/Schedule.sql'
  , 'tables/ScheduleXGroup.sql'
  , 'tables/Session.sql'
  // , 'tables/SessionXScheduleXGroup.sql'
  , 'tables/AttendanceType.sql'
  , 'tables/Attendance.sql'
  , 'tables/EventLevel.sql'
  , 'tables/EventSource.sql'
  , 'tables/ObjectLog.sql'
  , 'tables/EventType.sql'
  // , 'tables/Log.sql'
  , 'tables/Carnet.sql'
  , 'tables/CarnetXPerson.sql'
  // , 'tables/Event.sql'
  , 'tables/EventType.sql'
  , 'tables/EventTypeXEvent.sql'
  , 'tables/GroupXEvent.sql'

  // , 'users/marcello.sql'
  // , 'users/fabian.sql'
  // , 'users/emilio.sql'
  // , 'users/nicolas.sql'
  // , 'users/WebClient.sql'
  // , 'users/WebService.sql'

  , 'finalSettings.sql'
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
