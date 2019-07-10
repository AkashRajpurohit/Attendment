package com.attendment.apis;

import java.util.List;
import org.springframework.stereotype.Component;

@Component
public class RoomResponse {
	private int status;
	private String success;
	private String message;
	private List<DataBean> data;

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

	public List<DataBean> getData() {
		return data;
	}

	public void setData(List<DataBean> data) {
		this.data = data;
	}

	public static class DataBean {
		private int floor;
		private int roomNo;
		private String type;

		public int getFloor() {
			return floor;
		}

		public void setFloor(int floor) {
			this.floor = floor;
		}

		public int getRoomNo() {
			return roomNo;
		}

		public void setRoomNo(int roomNo) {
			this.roomNo = roomNo;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

	}
}
