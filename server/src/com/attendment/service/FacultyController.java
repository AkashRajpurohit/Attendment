package com.attendment.service;

import java.util.ArrayList;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.attendment.apis.FacultyAttendanceRequest;
import com.attendment.apis.FacultyAttendanceResponse;
import com.attendment.apis.FacultyResponse;
import com.attendment.apis.RoomResponse;
import com.attendment.apis.StudentFinalResponse;
import com.attendment.beans.Faculty;
import com.attendment.beans.FacultyAttendance;
import com.attendment.beans.LogicExecutor;
import com.attendment.beans.Room;
import com.attendment.beans.StudentLastMoment;

@org.springframework.web.bind.annotation.RestController
@CrossOrigin
@RequestMapping("rest/api/v1/faculty")
public class FacultyController {

	@Autowired
	AttendmentService service;
	@Autowired
	LogicExecutor logic;
	ArrayList<Faculty> list;
	ArrayList<Room> rlist;
	ArrayList<StudentLastMoment> final_list;

	@RequestMapping(path = "/fetch/{applicationId}", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public FacultyResponse fetchFaculty(@PathVariable("applicationId") int applicationId) {
		FacultyResponse response = new FacultyResponse();
		list = service.getAllFaculty();
		for (Faculty faculty : list) {
			if (faculty.getApplicationId() == applicationId) {
				response.setStatus(200);
				response.setSuccess("True");
				response.setMessage("Faculty Exist");
				ArrayList<FacultyResponse.DataBean> databean = new ArrayList<>();
				for (Faculty f : list) {
					if (f.getApplicationId() == applicationId) {
						FacultyResponse.DataBean data = new FacultyResponse.DataBean();
						data.setApplicationId(f.getApplicationId());
						data.setName(f.getName());
						data.setEmail(f.getEmail());
						data.setDept(f.getDept());
						data.setSemester(f.getSemester());
						data.setSubject(f.getSubject());
						databean.add(data);
					}
				}
				response.setData(databean);
				return response;
			}
		}
		response.setStatus(400);
		response.setSuccess("False");
		response.setMessage("Invalid ApplicationId");
		return response;
	}

	@RequestMapping(path = "/room", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public RoomResponse sendRoom() {
		rlist = service.getAllRoom();
		RoomResponse response = new RoomResponse();
		response.setStatus(200);
		response.setSuccess("True");
		response.setMessage("You Reached Me");
		ArrayList<RoomResponse.DataBean> databean = new ArrayList<>();
		for (Room r : rlist) {
			RoomResponse.DataBean data = new RoomResponse.DataBean();
			data.setFloor(r.getFloor());
			data.setRoomNo(r.getRoomNo());
			data.setType(r.getType());
			databean.add(data);
		}
		response.setData(databean);
		return response;
	}

	@RequestMapping(path = "/attendance", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public FacultyAttendanceResponse markFacultyAttendance(@RequestBody FacultyAttendanceRequest request) {
		FacultyAttendanceResponse response = new FacultyAttendanceResponse();
		FacultyAttendance f = new FacultyAttendance();
		f.setApplicationId(request.getApplicationId());
		f.setSubject(request.getSubject());
		f.setRoomNo(request.getRoomNo());
		f.setStartTime(logic.getRoundedTime(request.getStartTime()));
		f.setEndTime(logic.getRoundedTime(request.getEndTime()));
		f.setDate(request.getDate());
		service.markFacultyAttendance(f);
		response.setStatus(200);
		response.setSuccess("True");
		response.setMessage("Lecture Marked Succesfully");
		return response;
	}

	@CrossOrigin
	@RequestMapping(path = "/fetch/student/{applicationId}/{date}", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public StudentFinalResponse fetchStudent(@PathVariable("applicationId") int applicationId,
			@PathVariable("date") String date) {
		TreeSet<Integer> roomNo = new TreeSet<>();
		TreeSet<String> time = new TreeSet<>();
		TreeSet<String> subject= new TreeSet<>();
		StudentFinalResponse response = new StudentFinalResponse();
		ArrayList<StudentFinalResponse.DataBean> data = new ArrayList<>();
		final_list = service.getAllStudentRecords(applicationId,date);
		for (StudentLastMoment attendancePerm : final_list) {
			StudentFinalResponse.DataBean databean = new StudentFinalResponse.DataBean();
			databean.setSubject(attendancePerm.getSubject());
			databean.setRoomNo(attendancePerm.getRoomNo());
			databean.setStartTime(attendancePerm.getStartTime());
			databean.setFname(attendancePerm.getFname());
			databean.setLname(attendancePerm.getLname());
			roomNo.add(attendancePerm.getRoomNo());
			time.add(attendancePerm.getStartTime());
			subject.add(attendancePerm.getSubject());
			databean.setRollNo(attendancePerm.getRollNo());
			data.add(databean);
		}
		response.setStatus(200);
		response.setSuccess("True");
		response.setMessage("Recovered all the Data");
		response.setData(data);
		response.setRoomNo(roomNo);
		response.setTime(time);
		response.setSubject(subject);
		return response;
	}
}
