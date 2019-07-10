package com.attendment.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.attendment.apis.CurrentDataResponse;
import com.attendment.apis.StudentAttendanceRequest;
import com.attendment.apis.StudentAttendanceResponse;
import com.attendment.beans.LogicExecutor;
import com.attendment.beans.StudentAttendancePerm;
import com.attendment.beans.StudentAttendanceTemp;
import com.attendment.beans.StudentCurrentAttendance;

@org.springframework.web.bind.annotation.RestController
@CrossOrigin
@RequestMapping("rest/api/v1/student")
public class StudentController {

	@Autowired
	AttendmentService service;
	@Autowired
	LogicExecutor logic;
	ArrayList<StudentAttendanceTemp> list = new ArrayList<>();
	ArrayList<StudentAttendancePerm> final_list = new ArrayList<>();
	ArrayList<StudentCurrentAttendance> current_attend_list = new ArrayList<>();

	@RequestMapping(path = "/attendance/mark_start_phase", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public StudentAttendanceResponse markStudentAttendance(@RequestBody StudentAttendanceRequest request) {
		StudentAttendanceResponse response = new StudentAttendanceResponse();
		StudentAttendanceTemp s = new StudentAttendanceTemp();
		list = service.getAllStudentAttendanceTemp();
		for (StudentAttendanceTemp studentAttendance1 : list) {
			if (studentAttendance1.getMacAddress().equals(request.getMacAddress())) {
				response.setStatus(400);
				response.setSuccess("False");
				response.setMessage("You are not allowed to mark multiple attendance.");
				response.setFlag(-1);
				return response;
			} else {

			}
		}
		s.setApplicationId(request.getApplicationId());
		s.setRoomNo(request.getRoomNo());
		s.setStartTime(logic.getRoundedTime(request.getStartTime()));
		s.setStartPhase(request.getStartPhase());
		s.setEndTime("");
		s.setEndPhase(0);
		s.setDate(request.getDate());
		s.setMacAddress(request.getMacAddress());
		service.markStudentAttendance(s);
		response.setStatus(200);
		response.setSuccess("True");
		response.setMessage("Start Phase Marked Succesfully");
		response.setFlag(1);
		return response;
	}

	@RequestMapping(path = "/attendance/mark_end_phase", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public StudentAttendanceResponse markStudentAttendanceEndPhase(@RequestBody StudentAttendanceRequest request) {
		StudentAttendanceResponse response = new StudentAttendanceResponse();
		list = service.getAllStudentAttendanceTemp();
		for (StudentAttendanceTemp studentAttendance : list) {
			if(studentAttendance.getApplicationId() == request.getApplicationId() && studentAttendance.getStartPhase() == 1) {
				response.setStatus(200);
				response.setSuccess("True");
				response.setMessage("End Phase Marked Succesfully");
				response.setFlag(1);
				service.setEndPhase(request.getApplicationId(),logic.getRoundedTime(request.getEndTime()));
				final_list = service.getAllStudentPermAttendance();
				service.markStudentAttendanceFinal(final_list);
				service.removeStudentAttendanceTemp(request.getApplicationId());
				return response;
			}
		}
		response.setStatus(400);
		response.setSuccess("False");
		response.setMessage("No Start Phase Recovered");
		response.setFlag(-1);
		return response;
	}
	
	@RequestMapping(path = "/fetch/{roomNo}", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public CurrentDataResponse fetchStudent(@PathVariable("roomNo") int roomNo) {
		ArrayList<CurrentDataResponse.DataBean> data = new ArrayList<>();
		CurrentDataResponse response = new CurrentDataResponse();
		current_attend_list = service.getCurrentStudentAttendance(roomNo);
		for (StudentCurrentAttendance studentCurrentAttendance : current_attend_list) {
			CurrentDataResponse.DataBean value = new CurrentDataResponse.DataBean();
			value.setApplicationId(studentCurrentAttendance.getApplicationId());
			value.setFname(studentCurrentAttendance.getFname());
			value.setLname(studentCurrentAttendance.getLname());
			value.setRollNo(studentCurrentAttendance.getRollNo());
			data.add(value);
			System.out.println(value);
		}
		response.setStatus(200);
		response.setSuccess("True");
		response.setMessage("Get your details");
		response.setData(data);
		return response;
	}
}
