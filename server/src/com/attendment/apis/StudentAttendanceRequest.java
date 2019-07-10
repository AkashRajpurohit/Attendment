package com.attendment.apis;

import org.springframework.stereotype.Component;

@Component
public class StudentAttendanceRequest {

	private int applicationId;
	private int roomNo;
	private String startTime;
	private int startPhase;
	private String endTime;
	private int endPhase;
	private String date;
	private String macAddress;

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public int getStartPhase() {
		return startPhase;
	}

	public void setStartPhase(int startPhase) {
		this.startPhase = startPhase;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getEndPhase() {
		return endPhase;
	}

	public void setEndPhase(int endPhase) {
		this.endPhase = endPhase;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMacAddress() {
		return macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

}
