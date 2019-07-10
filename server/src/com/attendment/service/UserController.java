package com.attendment.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.attendment.apis.ForgetPasswordRequest;
import com.attendment.apis.ForgetPasswordResponse;
import com.attendment.apis.LoginRequest;
import com.attendment.apis.LoginResponse;
import com.attendment.apis.ResetPasswordRequest;
import com.attendment.apis.ResetPasswordResponse;
import com.attendment.apis.SignUpRequest;
import com.attendment.apis.SignUpResponse;
import com.attendment.beans.Student;

@org.springframework.web.bind.annotation.RestController
@CrossOrigin
@RequestMapping("rest/api/v1")
public class UserController {

	@Autowired
	AttendmentService service;
	ArrayList<Student> list;

	@RequestMapping(path = "/signup", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public SignUpResponse registerUser(@RequestBody SignUpRequest request) {
		SignUpResponse response = new SignUpResponse();
		list = service.getAllStudent();
		for (Student student : list) {
			if (student.getApplicationId() != request.getApplicationId()) {

			} else {
				response.setFlag(1);
				break;
			}
		}
		if (response.getFlag() != 1) {
			response.setStatus(400);
			response.setSuccess("False");
			response.setMessage("Invalid user");
			response.setFlag(0);
			return response;
		}
		for (Student student : list) {
			if (student.getApplicationId() != request.getApplicationId()) {
				if (student.getEmail().equals(request.getEmail())) {
					response.setStatus(400);
					response.setSuccess("False");
					response.setMessage("Email Already Exist");
					response.setFlag(-1);
					return response;
				}
			}
		}
		for (Student student : list) {
			if (student.getApplicationId() != request.getApplicationId()) {
				if (student.getMobileNo().equals(request.getMobileNo())) {
					response.setStatus(400);
					response.setSuccess("False");
					response.setMessage("MobileNo Already Exist");
					response.setFlag(-2);
					return response;
				}
			}
		}
		for (Student student : list) {
			if (student.getApplicationId() == request.getApplicationId()) {
				if (student.getActiveStatus() == 1) {
					response.setStatus(400);
					response.setSuccess("False");
					response.setMessage("Account Already Exist");
					response.setFlag(-3);
					return response;
				}
			}
		}
		service.updateProfile(request.getApplicationId(), request.getPassword());
		response.setStatus(200);
		response.setSuccess("True");
		response.setMessage("Registration Done Successfully");
		response.setFlag(1);
		return response;
	}

	@RequestMapping(path = "/login", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public LoginResponse checkUser(@RequestBody LoginRequest request) {
		LoginResponse response = new LoginResponse();
		list = service.getAllStudent();
		for (Student student : list) {
			if (student.getApplicationId() == request.getApplicationId() && student.getActiveStatus() != 1) {
				response.setStatus(400);
				response.setSuccess("False");
				response.setMessage("Registered User but not signed up");
				response.setFlag(-1);
				return response;
			}
		}
		for (Student student : list) {
			if (student.getApplicationId() == request.getApplicationId() && student.getActiveStatus() == 1) {
				if (student.getPassword().equals(request.getPassword())) {
					response.setStatus(200);
					response.setSuccess("True");
					response.setMessage("Login Successful");
					LoginResponse.DataBean data = new LoginResponse.DataBean();
					data.setApplicationId(student.getApplicationId());
					data.setFname(student.getFname());
					data.setLname(student.getLname());
					data.setRollNo(student.getRollNo());
					data.setYear(student.getYear());
					data.setBranch(student.getBranch());
					data.setUserType(student.getUserType());
					ArrayList<LoginResponse.DataBean> databean = new ArrayList<>();
					databean.add(data);
					response.setData(databean);
					return response;
				} else {
					response.setStatus(400);
					response.setSuccess("False");
					response.setMessage("Invalid Password");
					response.setFlag(-3);
					return response;
				}
			}
		}
		response.setStatus(400);
		response.setSuccess("False");
		response.setMessage("Invalid ApplicationId");
		response.setFlag(-2);
		return response;
	}

	@RequestMapping(path = "/forgetpassword", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ForgetPasswordResponse forgetPassword(@RequestBody ForgetPasswordRequest request) {
		ForgetPasswordResponse response = new ForgetPasswordResponse();
		list = service.getAllStudent();
		for (Student student : list) {
			if (student.getApplicationId() != request.getApplicationId()) {

			} else {
				response.setFlag(1);
				break;
			}
		}
		if (response.getFlag() != 1) {
			response.setStatus(400);
			response.setSuccess("False");
			response.setMessage("Invalid user");
			response.setFlag(-1);
			return response;
		}
		for (Student student : list) {
			if(student.getApplicationId() == request.getApplicationId() && student.getActiveStatus() != 1) {
				response.setStatus(400);
				response.setSuccess("False");
				response.setMessage("Registered student but not signed in");
				response.setFlag(-2);
				return response;
			}
		}
		for (Student student : list) {
			if(student.getApplicationId() == request.getApplicationId() && student.getEmail().equals(request.getEmail())) {
				response.setStatus(200);
				response.setSuccess("True");
				response.setMessage("Valid ApplicationId and Email");
				response.setFlag(1);
				return response;
			}
		}
		response.setStatus(400);
		response.setSuccess("False");
		response.setMessage("Email id is not associated with given ApplicationId");
		response.setFlag(-3);
		return response;
	}
	
	@RequestMapping(path = "/resetpassword", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ResetPasswordResponse resetPassword(@RequestBody ResetPasswordRequest request) {
		ResetPasswordResponse response = new ResetPasswordResponse();
		if(request.getOtp().equals("123")) {
			service.updateProfile(request.getApplicationId(), request.getPassword());
			response.setStatus(200);
			response.setSuccess("True");
			response.setMessage("Password Changed Successfully");
			return response;
		}
		response.setStatus(400);
		response.setSuccess("False");
		response.setMessage("Invalid OTP");
		return response;
	}
}
