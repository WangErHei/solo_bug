package bug.frontstage.program.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.program.service.imp.SelectProServiceimp;

@Controller
public class SelectProgramController {

@Autowired(required=false)
@Qualifier("SelectProServiceimp")
private SelectProServiceimp selectProServiceimp;


@RequestMapping("/addProgram")
	public String selectProgram(HttpServletRequest  req){
		String id  = req.getParameter("bid");
		int bid = Integer.parseInt(id);
		List<Map<String, Object>> list1 = selectProServiceimp.selectProgram(bid);
		req.setAttribute("list1",list1);
		return "projects";
	}
	
	
}
