package com.mvc.beans;

import java.sql.Date;

public class Emp {  
private Long id;  
private String name;  
private String salary; 
private String designation;  
private Date setDate;

private String cmpcode;

public Long getId() {  
    return id;  
}  
public void setId(Long id) {  
    this.id = id;  
}  
public String getName() {  
    return name;  
}  
public void setName(String name) {  
    this.name = name;  
}  
public String getSalary() {  
    return salary;  
}  
public void setSalary(String salary) {  
    this.salary = salary;  
}  
public String getDesignation() {  
    return designation;  
}  
public void setDesignation(String designation) {  
    this.designation = designation;  
}
public String getCmpcode() {
	return cmpcode;
}
public void setCmpcode(String cmpcode) {
	this.cmpcode = cmpcode;
}


public Date getSetDate() {
	return setDate;
}
public void setSetDate(Date setDate) {
	this.setDate = setDate;
}


  

}  