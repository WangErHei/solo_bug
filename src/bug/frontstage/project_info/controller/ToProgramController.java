package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.project_info.service.imp.ProgramServiceimp;

@Controller
public class ToProgramController {


@Autowired
	@Qualifier("ProgramServiceimp")

private ProgramServiceimp   programServiceimp;
	@RequestMapping("/toprogram")
	public  String  toProgram(HttpServletRequest req){
	String id = req.getParameter("id");
	int bid = Integer.parseInt(id);
List<Map<String,Object>>  list1  = programServiceimp.selectAllProgram(bid);
req.setAttribute("list1",list1);
	return "projects";

}

}
