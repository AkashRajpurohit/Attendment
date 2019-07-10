package com.attendment.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.attendment.beans.Faculty;
import com.attendment.beans.FacultyAttendance;
import com.attendment.beans.Room;
import com.attendment.beans.Student;
import com.attendment.beans.StudentAttendancePerm;
import com.attendment.beans.StudentAttendanceTemp;
import com.attendment.beans.StudentCurrentAttendance;
import com.attendment.beans.StudentLastMoment;

@Component
public class Account {
	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<Student> getAllStudent() {
		return jdbc.query("select * from student_record", new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int num) throws SQLException {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setApplicationId(rs.getInt("applicationId"));
				s.setRollNo(rs.getInt("rollNo"));
				s.setFname(rs.getString("fname"));
				s.setMname(rs.getString("mname"));
				s.setLname(rs.getString("lname"));
				s.setYear(rs.getString("year"));
				s.setBranch(rs.getString("branch"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setMobileNo(rs.getString("mobileNo"));
				s.setGender(rs.getString("gender"));
				s.setDob(rs.getString("dob"));
				s.setAddress(rs.getString("address"));
				s.setCity(rs.getString("city"));
				s.setState(rs.getString("state"));
				s.setActiveStatus(rs.getInt("activeStatus"));
				s.setUserType(rs.getString("userType"));
				return s;
			}
		});
	}

	public void updateProfile(int applicationId, String password) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("applicationId", applicationId);
		map.addValue("activeStatus", 1);
		map.addValue("password", password);
		jdbc.update("UPDATE student_record SET activeStatus=:activeStatus WHERE applicationId=:applicationId", map);
		jdbc.update("UPDATE student_record SET password=:password WHERE applicationId=:applicationId", map);
	}

	public List<Faculty> getAllFaculty() {
		return jdbc.query(
				"SELECT * FROM branch_year,faculty_record,teacher_branch_year_sub WHERE faculty_record.id = teacher_branch_year_sub.teacher_id AND branch_year.id = teacher_branch_year_sub.branch_year_id",
				new RowMapper<Faculty>() {
					@Override
					public Faculty mapRow(ResultSet rs, int num) throws SQLException {
						Faculty f = new Faculty();
						f.setId(rs.getInt("id"));
						f.setApplicationId(rs.getInt("applicationId"));
						f.setName(rs.getString("name"));
						f.setEmail(rs.getString("email"));
						f.setPassword(rs.getString("email"));
						f.setMobileNo(rs.getString("mobileNo"));
						f.setGender(rs.getString("gender"));
						f.setDept(rs.getString("dept"));
						f.setDob(rs.getString("dob"));
						f.setAddress(rs.getString("address"));
						f.setCity(rs.getString("city"));
						f.setState(rs.getString("state"));
						f.setJoiningDate(rs.getString("joiningDate"));
						f.setActiveStatus(rs.getString("activeStatus"));
						f.setUserType(rs.getString("userType"));
						f.setYear(rs.getString("year"));
						f.setBranch(rs.getString("branch"));
						f.setSemester(rs.getInt("semester"));
						f.setSubject(rs.getString("subject"));
						return f;
					}
				});
	}

	public List<Room> getAllRoom() {
		return jdbc.query("SELECT * FROM structure_record", new RowMapper<Room>() {
			@Override
			public Room mapRow(ResultSet rs, int num) throws SQLException {
				Room r = new Room();
				r.setId(rs.getInt("id"));
				r.setFloor(rs.getInt("floor"));
				r.setRoomNo(rs.getInt("roomNo"));
				r.setType(rs.getString("type"));
				return r;
			}
		});
	}

	public void markFacultyAttendance(FacultyAttendance f) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("fapplicationId", f.getApplicationId());
		map.addValue("subject", f.getSubject());
		map.addValue("roomNo", f.getRoomNo());
		map.addValue("startTime", f.getStartTime());
		map.addValue("endTime", f.getEndTime());
		map.addValue("date", f.getDate());
		jdbc.update(
				"insert into facul_attend(fapplicationId,subject,roomNo,startTime,endTime,date) values (:fapplicationId,:subject,:roomNo,:startTime,:endTime,:date)",
				map);
	}

	public void markStudentAttendance(StudentAttendanceTemp s) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("applicationId", s.getApplicationId());
		map.addValue("roomNo", s.getRoomNo());
		map.addValue("startTime", s.getStartTime());
		map.addValue("startPhase", s.getStartPhase());
		map.addValue("endTime", s.getEndTime());
		map.addValue("endPhase", s.getEndPhase());
		map.addValue("date", s.getDate());
		map.addValue("macAddress", s.getMacAddress());
		jdbc.update(
				"insert into stud_attend_temp(applicationId,roomNo,startTime,startPhase,endTime,endPhase,date,macAddress) values (:applicationId,:roomNo,:startTime,:startPhase,:endTime,:endPhase,:date,:macAddress)",
				map);
	}

	public List<StudentAttendanceTemp> getAllStudentAttendanceTemp() {
		return jdbc.query("SELECT * FROM stud_attend_temp", new RowMapper<StudentAttendanceTemp>() {
			@Override
			public StudentAttendanceTemp mapRow(ResultSet rs, int num) throws SQLException {
				StudentAttendanceTemp s = new StudentAttendanceTemp();
				s.setApplicationId(rs.getInt("applicationId"));
				s.setRoomNo(rs.getInt("roomNo"));
				s.setStartTime(rs.getString("startTime"));
				s.setStartPhase(rs.getInt("startPhase"));
				s.setEndTime(rs.getString("endTime"));
				s.setEndPhase(rs.getInt("endPhase"));
				s.setDate(rs.getString("date"));
				s.setMacAddress(rs.getString("macAddress"));
				return s;
			}
		});
	}

	public void setEndPhase(int applicationId, String roundedTime) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("applicationId", applicationId);
		map.addValue("endTime", roundedTime);
		jdbc.update("update stud_attend_temp set endTime = :endTime where applicationId = :applicationId;", map);
		jdbc.update("update stud_attend_temp set endPhase = 1 where applicationId = :applicationId;", map);
	}

	public List<StudentAttendancePerm> getAllStudentAttendancePerm() {
		return jdbc.query(
				"SELECT stud_attend_temp.applicationId,stud_attend_temp.roomNo,stud_attend_temp.date,facul_attend.startTime,facul_attend.endTime,subject,facul_attend.fapplicationId,branch,year FROM facul_attend,stud_attend_temp,student_record WHERE facul_attend.roomNo = stud_attend_temp.roomNo AND facul_attend.date = stud_attend_temp.date AND student_record.applicationId=stud_attend_temp.applicationId AND facul_attend.endTime <= stud_attend_temp.endTime;",
				new RowMapper<StudentAttendancePerm>() {
					@Override
					public StudentAttendancePerm mapRow(ResultSet rs, int num) throws SQLException {
						StudentAttendancePerm s = new StudentAttendancePerm();
						s.setApplicationId(rs.getInt("applicationId"));
						s.setRoomNo(rs.getInt("roomNo"));
						s.setDate(rs.getString("date"));
						s.setStartTime(rs.getString("startTime"));
						s.setEndTime(rs.getString("endTime"));
						s.setSubject(rs.getString("subject"));
						s.setFaculty(rs.getInt("fapplicationId"));
						s.setBranch(rs.getString("branch"));
						s.setYear(rs.getString("year"));
						return s;
					}
				});
	}

	public void markStudentAttendanceFinal(ArrayList<StudentAttendancePerm> final_list) {
		for (StudentAttendancePerm studentAttendancePerm : final_list) {
			MapSqlParameterSource map = new MapSqlParameterSource();
			map.addValue("applicationId", studentAttendancePerm.getApplicationId());
			map.addValue("roomNo", studentAttendancePerm.getRoomNo());
			map.addValue("date", studentAttendancePerm.getDate());
			map.addValue("startTime", studentAttendancePerm.getStartTime());
			map.addValue("endTime", studentAttendancePerm.getEndTime());
			map.addValue("subject", studentAttendancePerm.getSubject());
			map.addValue("faculty", studentAttendancePerm.getFaculty());
			map.addValue("branch", studentAttendancePerm.getBranch());
			map.addValue("year", studentAttendancePerm.getYear());
			jdbc.update(
					"insert into stud_attend_final(applicationId,roomNo,date,startTime,endTime,subject,faculty,branch,year) values (:applicationId,:roomNo,:date,:startTime,:endTime,:subject,:faculty,:branch,:year)",
					map);
		}
	}

	public void removeStudentAttendanceTemp(int applicationId) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("applicationId", applicationId);
		jdbc.update("DELETE FROM stud_attend_temp WHERE applicationId = :applicationId;", map);
	}

	public List<StudentCurrentAttendance> getCurrentStudentAttendance(int roomNo) {
		String query = "SELECT stud_attend_temp.applicationId,student_record.fname,student_record.lname,student_record.rollNo FROM stud_attend_temp,student_record WHERE stud_attend_temp.roomNo = "
				+ roomNo
				+ " AND stud_attend_temp.applicationId = student_record.applicationId ORDER BY student_record.rollNo";
		return jdbc.query(query, new RowMapper<StudentCurrentAttendance>() {
			@Override
			public StudentCurrentAttendance mapRow(ResultSet rs, int num) throws SQLException {
				StudentCurrentAttendance s = new StudentCurrentAttendance();
				s.setApplicationId(rs.getInt("applicationid"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setRollNo(rs.getInt("rollNo"));
				return s;
			}
		});
	}

	public List<StudentLastMoment> getAllStudentRecords(int applicationId, String date) {
		String query = 
				"SELECT stud_attend_final.roomNo,stud_attend_final.subject,stud_attend_final.startTime,student_record.fname,student_record.lname,student_record.rollNo from stud_attend_final,student_record WHERE stud_attend_final.applicationId=student_record.applicationId AND faculty = " + applicationId + " AND date = '"+ date + "';";
		return jdbc.query(query, new RowMapper<StudentLastMoment>() {
			@Override
			public StudentLastMoment mapRow(ResultSet rs, int num) throws SQLException {
				StudentLastMoment s = new StudentLastMoment();
				s.setRoomNo(rs.getInt("roomNo"));
				s.setStartTime(rs.getString("startTime"));
				s.setSubject(rs.getString("subject"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setRollNo(rs.getInt("rollNo"));
				return s;
			}
		});
	}
}
