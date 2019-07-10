package com.attendment.apis;

import java.util.List;
import java.util.TreeSet;

import org.springframework.stereotype.Component;

@Component
public class StudentFinalResponse {

	private int status;
	private String success;
	private String message;
	TreeSet<Integer> roomNo;
	TreeSet<String> time;
	TreeSet<String> subject;
	public TreeSet<Integer> getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(TreeSet<Integer> roomNo) {
		this.roomNo = roomNo;
	}

	public TreeSet<String> getTime() {
		return time;
	}

	public void setTime(TreeSet<String> time) {
		this.time = time;
	}

	public TreeSet<String> getSubject() {
		return subject;
	}

	public void setSubject(TreeSet<String> subject) {
		this.subject = subject;
	}

	List<DataBean> data;

	public List<DataBean> getData() {
		return data;
	}

	public void setData(List<DataBean> data) {
		this.data = data;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public static class DataBean {

		private int roomNo;
		private String subject;
		private String startTime;
		private String fname;
		private String lname;
		private int rollNo;

		public int getRoomNo() {
			return roomNo;
		}

		public void setRoomNo(int roomNo) {
			this.roomNo = roomNo;
		}

		public String getSubject() {
			return subject;
		}

		public void setSubject(String subject) {
			this.subject = subject;
		}

		public String getStartTime() {
			return startTime;
		}

		public void setStartTime(String startTime) {
			this.startTime = startTime;
		}

		public String getFname() {
			return fname;
		}

		public void setFname(String fname) {
			this.fname = fname;
		}

		public String getLname() {
			return lname;
		}

		public void setLname(String lname) {
			this.lname = lname;
		}

		public int getRollNo() {
			return rollNo;
		}

		public void setRollNo(int rollNo) {
			this.rollNo = rollNo;
		}

	}
}
