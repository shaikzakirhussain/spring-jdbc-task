package com.mvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mvc.beans.Allcompany;
import com.mvc.beans.Emp;

public class AllCompaniesDao {
JdbcTemplate template;  
	  
	
	
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  

	public List<Allcompany> getAllcompanies(){
		return template.query("select * from companyname", new RowMapper<Allcompany>() {
			public Allcompany mapRow(ResultSet rs, int row) throws SQLException{
				Allcompany ac = new Allcompany();
				ac.setId((long) rs.getInt(1));
				ac.setName(rs.getString(2));
				ac.setUrl(rs.getString(3));
				
				return ac;
			}
			
		});
	}
	    
	  
	    
	}  
	
	

