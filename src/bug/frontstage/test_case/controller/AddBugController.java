package bug.frontstage.test_case.controller;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.bug_info.service.imp.SelectBugInfoimp;
import bug.frontstage.login.service.imp.SelectProgramLoginServiceimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.project_info.model.Bug;
import bug.frontstage.project_info.service.imp.AddProgramServiceimp;
import bug.frontstage.test_case.service.imp.TestCaseServiceImp;

	@Controller
	public class AddBugController {
		private String pagecount;
		@Autowired
		@Qualifier("AddProgramServiceimp")
		private AddProgramServiceimp  addProgramServiceimp;
		
		@Autowired(required=false)
		@Qualifier("SelectBugInfoimp")
		private SelectBugInfoimp selectBugInfoimp;
		
		@Autowired
		@Qualifier("SelectActiveBugServiceimp")
		private SelectActiveBugServiceimp selectActiveBugServiceimp;
		
		@Autowired
		@Qualifier("CountNeedToDoServiceImp")
		private CountNeedToDoServiceImp countNeedToDoServiceImp;
		
		@Autowired(required = false)
		@Qualifier("SelectProgramLoginServiceimp")
		private SelectProgramLoginServiceimp selectProgramLoginServiceimp;
		
		@Autowired(required=false)
		@Qualifier("TestCaseServiceImp")
		private TestCaseServiceImp testCaseServiceImp;
		
		@RequestMapping("/tocaseAddBug")
		public  String addBug(HttpServletRequest  req,int bid,int pid,int caseId) throws ParseException{
		String title = req.getParameter("bug_title");
		String produce = req.getParameter("module");
		String marker = req.getParameter("handler");
		String describe  = req.getParameter("bug_describe");
		String prop= req.getParameter("priority");
		String type  = req.getParameter("type");
		String plan = req.getParameter("plan");
		String last  =req.getParameter("last");
		String path= req.getParameter("result");
		String  paths = req.getParameter("results");
		String  pathss = req.getParameter("resultss");
		String environment = req.getParameter("environment");
		
		Bug bug =new Bug();
		bug.setBug_title(title);
		bug.setBug_photo(path);
		bug.setProduce_name(produce);
		bug.setBug_maker(marker);
		bug.setBug_describe(describe);
		bug.setProp(prop);
		bug.setBug_state("未解决");
		bug.setBug_type(type);
		bug.setBug_plan_date(plan);
		bug.setBug_lasted_date(last);
		bug.setBug_photo(path);
		bug.setBug_environment(environment);
		bug.setBug_fu(paths);
		bug.setBug_fu_name(pathss);
		bug.setCaseId(caseId);
		String name = addProgramServiceimp.buserName(bid);
		bug.setBug_signer(name);
		addProgramServiceimp.addBug(bug, pid,bid);	
		String currpage="1";
		String everycount="5";
		List<Map<String, Object>> activebug = selectActiveBugServiceimp.activeBug(pid,currpage, everycount);
		List<Map<String, Object>> list1 = selectProgramLoginServiceimp.selectAllProgram(pid);
		int total = selectBugInfoimp.total(pid);
		int num = selectActiveBugServiceimp.activeAllNum(pid);
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
		req.getSession().setAttribute("total", total);
		int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
		req.getSession().setAttribute("countNeedToDo", countNeedToDo);
		req.setAttribute("currpage", currpage);
		req.getSession().setAttribute("activebug", activebug);
		req.getSession().setAttribute("num", num);
		req.setAttribute("pagecount", pagecount);
		req.getSession().setAttribute("activebug", activebug);
		req.getSession().setAttribute("list1", list1);
		
		
		List<Map<String,Object>> caseBugList = testCaseServiceImp.showCaseBug(pid, caseId);
		req.getSession().setAttribute("caseBugList", caseBugList);
		return "caseDetails";
		
	}
	}