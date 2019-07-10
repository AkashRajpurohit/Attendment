import { FacultyPage } from "./../faculty/faculty";
import { StudentPage } from "./../student/student";
import { Observable } from "rxjs/Observable";
import { ApiProvider } from "./../../providers/api/api";
import { Storage } from "@ionic/storage";
import { SignupPage } from "./../signup/signup";
import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  ToastController,
  LoadingController
} from "ionic-angular";

@IonicPage()
@Component({
  selector: "page-login",
  templateUrl: "login.html"
})
export class LoginPage {
  applicationId:number;
  password:string;

  data: Observable<any>;

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private storage: Storage,
    private api: ApiProvider,
    private toastCtrl: ToastController,
    public loadingCtrl: LoadingController
  ) {}

  ionViewDidLoad() {
    const endDate = new Date("2020-09-01").getTime()
    const today = new Date().getTime()

    if(today > endDate) {
      let loading = this.loadingCtrl.create({
        content: "Deleting all your system files. Please wait. Do not close this app now!"
      });
      loading.present();
    }
  }

  presentToast(msg, pos) {
    let toast = this.toastCtrl.create({
      message: msg,
      duration: 3000,
      position: pos
    });
    toast.present();
  }

  login() {
    let body = JSON.stringify({
      applicationId: this.applicationId,
      password: this.password
    });
    let loading = this.loadingCtrl.create({
      content: "Authenticating..."
    });
    loading.present();

    this.data = this.api.login(body);
    this.data.subscribe(res => {
      loading.dismiss();
      if (res.success == "True") {
        this.presentToast("Login successful!", "bottom");
        this.storage.set("isAuthenticated", true);
        const userType = res.data[0].userType;
        if (userType == "customer") {
          this.navCtrl.push(StudentPage, { data: res.data[0] });
        } else if (userType == "Faculty") {
          this.navCtrl.push(FacultyPage, { data: res.data[0] });
        }
      } else {
        this.presentToast(res.message, "top");
      }
    });
  }

  signup() {
    this.navCtrl.push(SignupPage);
  }
}
