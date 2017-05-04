package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.bug_info.service.imp.SelectAllBugServiceimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.mytask.service.imp.MyAllTaskServiceImp;
import bug.frontstage.project_info.service.imp.DeleteBugService;

@Controller
public class DeleteBugController {

	@Autowired
	@Qualifier("DeleteBugService")
	private DeleteBugService  deleteBugService;
	@Autowired(required=false)
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp  countNeedToDoServiceImp;
	String currpage="1";
	String everycount="5";
    String pagecount;
	@Autowired
	@Qualifier("SelectAllBugServiceimp")
	private SelectAllBugServiceimp selectAllBugServiceimp;
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	@RequestMapping("/deletebug")
	public String  bugDelete(HttpServletRequest  req,int bug_id,int pid,int bid){
		deleteBugService.deleteBug(bug_id);
		List<Map<String,Object>> 	 allbug = selectAllBugServiceimp.allBug(pid,currpage, everycount);
	int allnum = selectAllBugServiceimp.allBugNum(pid);
		
		int count = Integer.parseInt(everycount);
	
		if (allnum % count == 0) {
			pagecount = (allnum / count) + "";
		} else {
			pagecount = (allnum / count + 1) + "";
		}
		
		int num = selectActiveBugServiceimp.activeAllNum(pid);
		int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
		req.getSession().setAttribute("countNeedToDo", countNeedToDo);
		req.getSession().setAttribute("num", num);
		req.getSession().setAttribute("allbug", allbug);
		req.setAttribute("pagecount", pagecount);
		return "bugAll";
	}
	
}
