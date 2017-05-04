package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.project_info.model.Bug;
import bug.frontstage.project_info.service.imp.AddProgramServiceimp;
import bug.frontstage.project_info.service.imp.BugDetailsServiceimp;
import bug.frontstage.project_info.service.imp.BugRightServiceimp;
import bug.frontstage.project_info.service.imp.UpdateSubmitServiceimp;

@Controller
public class UpdateSubmitController {
	@Autowired
	@Qualifier("AddProgramServiceimp")
	private AddProgramServiceimp  addProgramServiceimp;
	
	@Autowired
	@Qualifier("UpdateSubmitServiceimp")
	private  UpdateSubmitServiceimp updateSubmitServiceimp;
	
	@Autowired
	@Qualifier("BugDetailsServiceimp")
	private BugDetailsServiceimp bugDetailsServiceimp;
	
	@Autowired
	@Qualifier("BugRightServiceimp")
	private BugRightServiceimp  bugRightServiceimp;
	
	
	@Autowired(required=false)
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp  countNeedToDoServiceImp;
	
	@RequestMapping("/updateBug")
	public String updateSubmit(HttpServletRequest  req,int pid,int bid,int bug_id){
     
		String title = req.getParameter("title");
		String produce = req.getParameter("module");
		String marker = req.getParameter("handler");
		String describe  = req.getParameter("description");
		String prop= req.getParameter("priority");
		String type  = req.getParameter("type");
		String plan = req.getParameter("plan");
		String last  =req.getParameter("last");
		String path= req.getParameter("result8");
		String  paths = req.getParameter("results8");
		String  pathss = req.getParameter("resultss8");
		String environment = req.getParameter("environment");
		Bug bug =new Bug();
		bug.setBug_title(title);
		bug.setBug_photo(path);
		bug.setProduce_name(produce);
		bug.setBug_maker(marker);
		bug.setBug_describe(describe);
		bug.setProp(prop);
		bug.setBug_type(type);
		bug.setBug_plan_date(plan);
		bug.setBug_lasted_date(last);
		bug.setBug_environment(environment);
		bug.setBug_fu(paths);
		bug.setBug_fu_name(pathss);
		String name = addProgramServiceimp.buserName(bid);
		bug.setBug_signer(name);
		updateSubmitServiceimp.updateSubmit(bug_id, bug, pid, bid);
		List<Map<String,Object>> commentsList   = updateSubmitServiceimp.log(bug_id);
		for(int i=0;i<commentsList.size();i++){
			Object ob  =commentsList.get(i).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString());
			String head1 = updateSubmitServiceimp.head(buser_id);
			commentsList.get(i).put("head1",head1 );
			}
		 req.getSession().setAttribute("commentsList",commentsList);
			String name1  =  bugDetailsServiceimp.programName(pid);
			List<Map<String,Object>> bug1   = bugDetailsServiceimp.bug(bug_id);
			req.getSession().setAttribute("bug", bug1);
			req.getSession().setAttribute("name", name1);
		    String state =  bugRightServiceimp.state(bug_id);
	        String type1 = bugRightServiceimp.type(bug_id);
	       String  right1 =  bugRightServiceimp.details(bid, bug_id, pid);
	       String  right = bugRightServiceimp.right(bid, pid, bug_id)+"";       
	        req.getSession().setAttribute("right1", right1);
	        req.getSession().setAttribute("right", right);
	        req.getSession().setAttribute("state", state);
	        req.getSession().setAttribute("type", type1);
	        int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
			req.getSession().setAttribute("countNeedToDo", countNeedToDo);
		return "bugDetails";
	}
	
}
