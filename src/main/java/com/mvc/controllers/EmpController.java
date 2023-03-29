package com.mvc.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jca.cci.core.RecordCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.beans.Allcompany;
import com.mvc.beans.DelioteEntity;
import com.mvc.beans.DesignationEntity;
import com.mvc.beans.Emp;
import com.mvc.beans.Logindetails;
import com.mvc.beans.TcsEntity;
import com.mvc.dao.AllCompaniesDao;
import com.mvc.dao.DelioteDao;
import com.mvc.dao.DesignationDao;
import com.mvc.dao.EmpDao;
import com.mvc.dao.TcsDao;

@Controller
public class EmpController {
	@Autowired
	EmpDao dao;// will inject dao from xml file

	@Autowired
	TcsDao tcsDao;

	@Autowired
	DelioteDao dltDao;

	@Autowired
	AllCompaniesDao allDao;
	
	@Autowired
	DesignationDao allDesig;
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/empform")
	public String showform(Model m) {
		m.addAttribute("command", new Emp());
		return "empform";
	}

	

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("emp") Emp emp) {
		

		dao.save(emp);
		return "redirect:/viewemp";
	}
	
	
	

	@RequestMapping(value = "/saveTcs", method = RequestMethod.POST)
	public String Tcssave(@ModelAttribute("tcs") TcsEntity tcs) {

		tcsDao.save(tcs);
		return "redirect:/tcsEmp";
	}
	
	@RequestMapping(value = "/saveDeliote", method = RequestMethod.POST)
	public String Deliotesave(@ModelAttribute("dlt") DelioteEntity dlt) {
		dltDao.save(dlt);
		return "redirect:/delioteEmp";
	}
	@RequestMapping("/viewemp")
	public String viewemp(Model m) {

		// prints all the list in the table format
		List<Emp> list = dao.getEmployees();

		// prints the employee which have an designation
//		List<Emp> listdrp = dao.getEmployees();
//		listdrp.removeIf(item -> item.getDesignation().equals(""));

		// prints the employee which does not have an designation

		List<Emp> unlist = dao.getEmployees();
		List<Emp> emptyFields = new ArrayList<>();
		for (Emp person : unlist) {
			if (person.getDesignation().equals("")) {
				emptyFields.add(person);
			}
		}

		List<Allcompany> allcompany = allDao.getAllcompanies();
		List<DesignationEntity> desig = allDesig.getAllDesignation();
		
		m.addAttribute("allcompany", allcompany);
		m.addAttribute("desig", desig);
		m.addAttribute("unlist_dropdown", emptyFields);
		m.addAttribute("list", list);

		return "viewemp";
	}

	@RequestMapping("/tcsEmp")
	public String tcsEmp(Model m) {
		
		List<TcsEntity> tcslist = tcsDao.getEmployees();

		List<Allcompany> allcompany = allDao.getAllcompanies();
		List<DesignationEntity> desig = allDesig.getAllDesignation();
		m.addAttribute("desig", desig);
		m.addAttribute("allcompany", allcompany);
		m.addAttribute("tcslist", tcslist);
		return "TcsEmp";
	}

	@RequestMapping("/delioteEmp")
	public String DelioteEmp(Model m) {

		List<DelioteEntity> Deliotelist = dltDao.getEmployees();
		List<DesignationEntity> desig = allDesig.getAllDesignation();
		m.addAttribute("desig", desig);
		m.addAttribute("Deliotelist", Deliotelist);
		return "DelioteEmp";
	}

	// delta edit
	@RequestMapping(value = "/editemp/{id}")
	public String edit(@PathVariable("id") int id, Model m) {
		Emp emp = dao.getEmpById(id);
		m.addAttribute("command", emp);
		return "staticBackdrop";
	}
	
	


	// Tcs edit
	@RequestMapping(value = "/editTcs/{id}")
	public String editTcs(@PathVariable int id, Model m) {
		Emp emp = tcsDao.getEmpById(id);
		m.addAttribute("command", emp);
		return "tcsEditform";
	}

	// Deliote edit
	@RequestMapping(value = "/editDeliote/{id}")
	public String editDeliote(@PathVariable int id, Model m) {
		Emp emp = dltDao.getEmpById(id);
		m.addAttribute("command", emp);
		return "DelioteEditform";
	}

	@RequestMapping(value = "/editsave", method = RequestMethod.GET)
	public String editsave(@ModelAttribute("emp") Emp emp) {
		dao.update(emp);
		return "redirect:/viewemp";
	}

	@RequestMapping(value = "/editTcssave", method = RequestMethod.GET)
	public String editTcssave(@ModelAttribute("tcs") TcsEntity tcs) {
		tcsDao.update(tcs);
		return "redirect:/tcsEmp";
	}
	
	//Deliote edit save
	@RequestMapping(value = "/editDeliotesave", method = RequestMethod.GET)
	public String editDeliotesave(@ModelAttribute("dlt") DelioteEntity dlt) {
		dltDao.update(dlt);
		return "redirect:/delioteEmp";
	}

	@RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		dao.delete(id);
		return "redirect:/viewemp";
	}

	@RequestMapping(value = "/deleteTcs/{id}", method = RequestMethod.GET)
	public String deleteTcs(@PathVariable int id) {
		tcsDao.delete(id);
		return "redirect:/tcsEmp";
	}
	
	
	@RequestMapping(value = "/deleteDeliote/{id}", method = RequestMethod.GET)
	public String deleteDeliote(@PathVariable int id) {
		dltDao.delete(id);
		return "redirect:/delioteEmp";
	}
	
	

	/*
	 * @RequestMapping(value = "/savelogin", method = RequestMethod.POST) public
	 * String submitForm(@RequestParam("username") String username,
	 * 
	 * @RequestParam("password") String password) {
	 * System.out.println("Username entered by user: " + username);
	 * System.out.println("Password entered by user: " + password); // do something
	 * with the user data if(username== "delta" && password == "1234") {
	 * System.out.println("success"); } else { System.out.println("error"); }
	 * 
	 * return "viewemp"; }
	 */


}