import { LoginPage } from "./../login/login";
import { FormBuilder, FormGroup, Validators } from '@angular/forms'
import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  ToastController
} from "ionic-angular";
import { ApiProvider } from "../../providers/api/api";
import { Observable } from "rxjs/Observable";

@IonicPage()
@Component({
  selector: "page-signup",
  templateUrl: "signup.html"
})
export class SignupPage {
  registerForm: FormGroup
  data: Observable<any>;

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private api: ApiProvider,
    private toastCtrl: ToastController,
    private formBuilder: FormBuilder,
  ) {
    this.registerForm = this.formBuilder.group({
      fname: [''],
      applicationId: [''],
      email: ['', Validators.email],
      password: [''],
      mobileNo: [''],
    })
  }

  ionViewDidLoad() {}

  presentToast(msg, pos) {
    let toast = this.toastCtrl.create({
      message: msg,
      duration: 3000,
      position: pos
    });
    toast.present();
  }

  signup() {
    const {
      fname,
      mobileNo,
      email,
      password,
      applicationId,
    } = this.registerForm.value

    let body = JSON.stringify({
      applicationId,
      fname,
      email,
      mobileNo,
      password
    });

    this.data = this.api.signup(body);
    this.data.subscribe(
      res => {
        if (res.success == "True") {
          this.presentToast("User registered successfully", "bottom");
          this.navCtrl.push(LoginPage);
        } else {
          this.presentToast(res.message, "top");
        }
      },
      error => {
        console.log(error)
        this.presentToast("Something went wrong", "bottom");
      }
    );
  }

  login() {
    this.navCtrl.pop()
  }
}
