package com.mvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mvc.beans.DesignationEntity;

public class DesignationDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<DesignationEntity> getAllDesignation() {
		return template.query("select * from empdesig", new RowMapper<DesignationEntity>() {
			public DesignationEntity mapRow(ResultSet rs, int row) throws SQLException {
				DesignationEntity e = new  DesignationEntity();
				e.setId((long) rs.getInt(1));
				e.setDesignation(rs.getString(2));
				return e;
			}
		});

	}

}
