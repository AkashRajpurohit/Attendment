import { StudentStatusPage } from "./../student-status/student-status";
import { MarkAttendancePage } from "./../mark-attendance/mark-attendance";
import { ApiProvider } from "./../../providers/api/api";
import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  LoadingController
} from "ionic-angular";
import { StudentDetailsPage } from "../student-details/student-details";

@IonicPage()
@Component({
  selector: "page-faculty",
  templateUrl: "faculty.html"
})
export class FacultyPage {
  data;
  info;

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private api: ApiProvider,
    private loadingCtrl: LoadingController
  ) {}

  fetchTeacherData() {
    let loading = this.loadingCtrl.create({
      content: "Fetching Data..."
    });
    loading.present();
    this.api.getFacultyData(this.info.applicationId).subscribe(res => {
      loading.dismiss();
      this.data = res.data;
    });
  }

  getCurrentStatus() {
    this.navCtrl.push(StudentStatusPage);
  }

  getAllStudents() {
    this.navCtrl.push(StudentDetailsPage, {
      data: this.data
    });
  }

  goToNext(index) {
    const data = this.data[index];
    const dataToBePassed = {
      applicationId: data.applicationId,
      subject: data.subject,
      semester: data.semester
    };
    this.navCtrl.push(MarkAttendancePage, { data: dataToBePassed });
  }

  ionViewDidLoad() {}

  ionViewWillEnter() {
    this.info = this.navParams.get("data");
    this.fetchTeacherData();
  }
}
