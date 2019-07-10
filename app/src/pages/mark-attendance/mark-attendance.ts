import { FacultyPage } from "./../faculty/faculty";
import { ApiProvider } from "./../../providers/api/api";
import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  ToastController
} from "ionic-angular";

@IonicPage()
@Component({
  selector: "page-mark-attendance",
  templateUrl: "mark-attendance.html"
})
export class MarkAttendancePage {
  data;
  startTime;
  endTime;
  roomNumber;
  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private api: ApiProvider,
    private toastCtrl: ToastController
  ) {}

  presentToast(msg, pos) {
    let toast = this.toastCtrl.create({
      message: msg,
      duration: 3000,
      position: pos
    });
    toast.present();
  }

  submit() {
    const day = new Date().getDate();
    const month = new Date().getMonth() + 1;
    const year = new Date().getFullYear();
    const body = {
      applicationId: this.data.applicationId,
      subject: this.data.subject,
      roomNo: parseInt(this.roomNumber, 10),
      startTime: this.startTime,
      endTime: this.endTime,
      date: day + "-" + month + "-" + year
    };

    this.api.markLecture(body).subscribe(res => {
      if (res.success == "True") {
        this.presentToast("Lecture Marked!", "bottom");
        this.navCtrl.popTo(FacultyPage);
      } else {
        this.presentToast("Something went wrong", "top");
      }
    });
  }

  ionViewDidLoad() {
    this.data = this.navParams.get("data");
  }
}
