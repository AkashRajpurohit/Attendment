package com.attendment.apis;

import org.springframework.stereotype.Component;

@Component
public class ForgetPasswordRequest {

	private int applicationId;
	private String email;

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
