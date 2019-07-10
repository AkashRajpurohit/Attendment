import { BarcodeScanner } from "@ionic-native/barcode-scanner";
import { BrowserModule } from "@angular/platform-browser";
import { ErrorHandler, NgModule } from "@angular/core";
import { IonicApp, IonicErrorHandler, IonicModule } from "ionic-angular";
import { IonicStorageModule, Storage } from "@ionic/storage";
import { SplashScreen } from "@ionic-native/splash-screen";
import { StatusBar } from "@ionic-native/status-bar";
import { HttpClientModule } from "@angular/common/http";
import { Device } from "@ionic-native/device";

import { MyApp } from "./app.component";
import { LoginPage } from "../pages/login/login";
import { SignupPage } from "./../pages/signup/signup";
import { StudentPage } from "./../pages/student/student";
import { FacultyPage } from "./../pages/faculty/faculty";
import { MarkAttendancePage } from "./../pages/mark-attendance/mark-attendance";
import { StudentStatusPage } from "./../pages/student-status/student-status";
import { StudentDetailsPage } from "./../pages/student-details/student-details";
import { ApiProvider } from "../providers/api/api";

@NgModule({
  declarations: [
    MyApp,
    LoginPage,
    SignupPage,
    StudentPage,
    FacultyPage,
    MarkAttendancePage,
    StudentDetailsPage,
    StudentStatusPage
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    IonicModule.forRoot(MyApp),
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    LoginPage,
    SignupPage,
    StudentPage,
    FacultyPage,
    MarkAttendancePage,
    StudentDetailsPage,
    StudentStatusPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    BarcodeScanner,
    Device,
    { provide: ErrorHandler, useClass: IonicErrorHandler, deps: [Storage] },
    ApiProvider
  ]
})
export class AppModule {}
