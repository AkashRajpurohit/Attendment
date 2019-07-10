package com.attendment.apis;

import org.springframework.stereotype.Component;

@Component
public class LoginRequest {

	private int applicationId;
	private String password;

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
