import { Component } from "@angular/core";
import {
  IonicPage,
  NavController,
  NavParams,
  ToastController,
  LoadingController
} from "ionic-angular";
import { Storage } from "@ionic/storage";
import {
  BarcodeScanner,
  BarcodeScannerOptions,
  BarcodeScanResult
} from "@ionic-native/barcode-scanner";
import { Device } from "@ionic-native/device";
import { ApiProvider } from "../../providers/api/api";

@IonicPage()
@Component({
  selector: "page-student",
  templateUrl: "student.html"
})
export class StudentPage {
  result: BarcodeScanResult;
  data;
  roomNo = "";
  date;
  time;
  macAddress;
  source;
  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    private scanner: BarcodeScanner,
    private device: Device,
    private storage: Storage,
    private api: ApiProvider,
    private toastCtrl: ToastController,
    private loadingCtrl: LoadingController
  ) {}

  presentToast(msg, pos) {
    let toast = this.toastCtrl.create({
      message: msg,
      duration: 3000,
      position: pos
    });
    toast.present();
  }

  scanCode() {
    this.macAddress = this.device.serial;
    this.source = "";
    const options: BarcodeScannerOptions = {
      resultDisplayDuration: 0,
      disableSuccessBeep: true,
      prompt: "Scan the Attendance QrCode"
    };
    this.scanner
      .scan(options)
      .then(data => {
        this.result = data;
        if (!this.result.cancelled && this.result.text !== "") {
          const data = this.result.text;
          this.date = data
            .split("-")[0]
            .trim()
            .replace(".", "-")
            .replace(".", "-");
          this.time = data.split("-")[1].trim();

          this.checkStartPhase();
        }
      })
      .catch(err => console.log(err));
  }

  startPhaseRequest() {
    let loading = this.loadingCtrl.create({
      content: "Marking start phase..."
    });
    loading.present();
    const body = {
      applicationId: this.data.applicationId,
      roomNo: this.roomNo,
      startTime: this.time,
      startPhase: 1,
      endTime: "",
      endPhase: 0,
      date: this.date,
      macAddress: this.macAddress
    };

    this.api.markStartPhase(body).subscribe(res => {
      loading.dismiss();
      if (res.success == "True") {
        this.storage.set("startPhase", "hasStartPhase");
        this.source = "../../assets/check.png";
        this.presentToast("First Scan taken successfully!", "bottom");
      } else {
        this.source = "../../assets/cross.png";
        this.presentToast(res.message || "Oops! Something went wrong", "top");
      }
    });
  }

  endPhaseRequest() {
    let loading = this.loadingCtrl.create({
      content: "Marking start phase..."
    });
    loading.present();
    const body = {
      applicationId: this.data.applicationId,
      roomNo: this.roomNo,
      endTime: this.time,
      endPhase: 1,
      date: this.date
    };

    this.api.markEndPhase(body).subscribe(res => {
      loading.dismiss();
      if (res.success == "True") {
        this.source = "../../assets/check.png";
        this.storage.remove("startPhase");
        this.presentToast("Second Scan taken successfully!", "bottom");
      } else {
        this.source = "../../assets/cross.png";
        this.presentToast(res.message || "Oops! Something went wrong", "top");
      }
    });
  }

  checkStartPhase() {
    let hasStartPhase = false;
    this.storage
      .keys()
      .then(val => {
        for (let i = 0; i < val.length; i++) {
          if (val[i] == "startPhase") {
            hasStartPhase = true;
          }
        }
      })
      .then(() => {
        if (hasStartPhase) {
          this.endPhaseRequest();
        } else {
          this.startPhaseRequest();
        }
      })
      .catch(err => console.log(err));
  }

  ionViewDidLoad() {}

  ionViewWillEnter() {
    this.data = this.navParams.get("data");
  }
}
