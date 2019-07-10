import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  LoadingController
} from "ionic-angular";
import { ApiProvider } from "../../providers/api/api";

@IonicPage()
@Component({
  selector: "page-student-status",
  templateUrl: "student-status.html"
})
export class StudentStatusPage {
  roomNo = "";
  data;
  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private api: ApiProvider,
    private loadingCtrl: LoadingController
  ) {}

  check() {
    let loading = this.loadingCtrl.create({
      content: "Getting Students data...."
    });
    loading.present();
    this.api.retrieveCurrentStudents(parseInt(this.roomNo)).subscribe(res => {
      if (res.success == "True") {
        this.data = res.data;
        loading.dismiss();
      } else {
        loading.dismiss();
      }
    });
  }

  ionViewDidLoad() {}
}
