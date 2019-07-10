import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import "rxjs/add/operator/map";

@Injectable()
export class ApiProvider {
  proxy = "https://attendment.herokuapp.com/rest/api/v1";
  headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT",
    "Content-type": "application/json"
  };

  constructor(public http: HttpClient) {}

  signup(data) {
    return this.http
      .post(this.proxy + "/signup", data, {
        headers: this.headers
      })
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  login(data) {
    return this.http
      .post(this.proxy + "/login", data, {
        headers: this.headers
      })
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  // Student

  markStartPhase(data) {
    return this.http
      .post(this.proxy + "/student/attendance/mark_start_phase", data, {
        headers: this.headers
      })
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  markEndPhase(data) {
    return this.http
      .post(this.proxy + "/student/attendance/mark_end_phase", data, {
        headers: this.headers
      })
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  // Faculty

  getFacultyData(id) {
    return this.http
      .get(this.proxy + "/faculty/fetch/" + id)
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  markLecture(data) {
    return this.http
      .post(this.proxy + "/faculty/attendance", data, {
        headers: this.headers
      })
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  retrieveCurrentStudents(roomNo) {
    return this.http
      .get(`${this.proxy}/student/fetch/${roomNo}`)
      .map(res => JSON.parse(JSON.stringify(res)));
  }

  retrieveAllStudents(id, date) {
    return this.http
      .get(`${this.proxy}/faculty/fetch/student/${id}/${date}`)
      .map(res => JSON.parse(JSON.stringify(res)));
  }
}
