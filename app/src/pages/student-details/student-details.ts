import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  LoadingController
} from "ionic-angular";
import { ApiProvider } from "../../providers/api/api";
import "rxjs/add/operator/filter";

@IonicPage()
@Component({
  selector: "page-student-details",
  templateUrl: "student-details.html"
})
export class StudentDetailsPage {
  date;
  data;
  roomNo;
  subject;
  filteredData;
  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private api: ApiProvider,
    private loadingCtrl: LoadingController
  ) {}

  check() {
    let loading = this.loadingCtrl.create({
      content: "Fetching Information...."
    });
    loading.present();

    const data = this.navParams.get("data");
    this.date = this.date
      .split("-")
      .reverse()
      .join("-");

    this.api
      .retrieveAllStudents(data[0].applicationId, this.date)
      .subscribe(res => {
        loading.dismiss();
        this.data = res.data;
        this.filteredData = this.data;
        this.subject = res.subject;
        this.roomNo = res.roomNo;
      });
  }

  onChange(value, type) {
    switch (type) {
      case "roomNo":
        this.filteredData = this.data.filter(item => item.roomNo == value);
        break;
      case "subject":
        this.filteredData = this.data.filter(item => item.subject == value);
        break;
    }
  }

  ionViewDidLoad() {}
}
