package com.mvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mvc.beans.Emp;
import com.mvc.beans.TcsEntity;

public class TcsDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(TcsEntity t) {
		String sql = "insert into tcs values(?,?,?,?)";
		return template.update(sql, new Object[] { t.getId(), t.getName(), t.getDesignation(), t.getSalary() });
	}

	public int update(TcsEntity t) {
		String sql = "update tcs set name=?, salary=?, designation=? where id=? ";
		return template.update(sql, new Object[] { t.getName(), t.getSalary(), t.getDesignation(), t.getId() });
	}

	public int delete(int id) {
		String sql = "delete from tcs where id=" + id + "";
		return template.update(sql);
	}

	public Emp getEmpById(int id) {
		String sql = "select * from tcs where id=?";
		return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Emp>(Emp.class));

	}

	public List<TcsEntity> getEmployees() {
		return template.query("select * from tcs", new RowMapper<TcsEntity>() {
			public TcsEntity mapRow(ResultSet rs, int row) throws SQLException {
				TcsEntity e = new  TcsEntity();
				e.setId((long) rs.getInt(1));
				e.setName(rs.getString(2));
				e.setSalary(rs.getString(3));
				e.setDesignation(rs.getString(4));
				return e;
			}
		});

	}

}
