package com.attendment.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.attendment.beans.Faculty;
import com.attendment.beans.FacultyAttendance;
import com.attendment.beans.Room;
import com.attendment.beans.Student;
import com.attendment.beans.StudentAttendancePerm;
import com.attendment.beans.StudentAttendanceTemp;
import com.attendment.beans.StudentCurrentAttendance;
import com.attendment.beans.StudentLastMoment;
import com.attendment.model.Account;

@Component
public class AttendmentService {

	@Autowired
	Account account;

	public ArrayList<Student> getAllStudent() {
		ArrayList<Student> list = (ArrayList<Student>) account.getAllStudent();
		return list;
	}

	public void updateProfile(int applicationId, String password) {
		account.updateProfile(applicationId, password);
	}

	public ArrayList<Faculty> getAllFaculty() {
		ArrayList<Faculty> list = (ArrayList<Faculty>) account.getAllFaculty();
		return list;
	}

	public ArrayList<Room> getAllRoom() {
		ArrayList<Room> list = (ArrayList<Room>) account.getAllRoom();
		return list;
	}

	public void markFacultyAttendance(FacultyAttendance f) {
		account.markFacultyAttendance(f);
	}

	public void markStudentAttendance(StudentAttendanceTemp s) {
		account.markStudentAttendance(s);
	}

	public ArrayList<StudentAttendanceTemp> getAllStudentAttendanceTemp() {
		ArrayList<StudentAttendanceTemp> list = (ArrayList<StudentAttendanceTemp>) account.getAllStudentAttendanceTemp();
		return list;
	}

	public void setEndPhase(int applicationId, String roundedTime) {
		account.setEndPhase(applicationId,roundedTime);
	}

	public ArrayList<StudentAttendancePerm> getAllStudentPermAttendance() {
		ArrayList<StudentAttendancePerm> list = (ArrayList<StudentAttendancePerm>) account.getAllStudentAttendancePerm();
		return list;
	}

	public void markStudentAttendanceFinal(ArrayList<StudentAttendancePerm> final_list) {
		account.markStudentAttendanceFinal(final_list);
	}

	public void removeStudentAttendanceTemp(int applicationId) {
		account.removeStudentAttendanceTemp(applicationId);
	}

	public ArrayList<StudentCurrentAttendance> getCurrentStudentAttendance(int roomNo) {
		ArrayList<StudentCurrentAttendance> list = (ArrayList<StudentCurrentAttendance>) account.getCurrentStudentAttendance(roomNo);
		return list;
	}

	public ArrayList<StudentLastMoment> getAllStudentRecords(int applicationId, String date) {
		ArrayList<StudentLastMoment> list = (ArrayList<StudentLastMoment>) account.getAllStudentRecords(applicationId, date);
		return list;
	}

}
