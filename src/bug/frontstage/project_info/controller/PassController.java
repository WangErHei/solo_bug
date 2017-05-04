package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.project_info.service.imp.BugDetailsServiceimp;
import bug.frontstage.project_info.service.imp.BugRightServiceimp;
import bug.frontstage.project_info.service.imp.PassServiceimp;

@Controller
public class PassController {
	@Autowired
	@Qualifier("BugDetailsServiceimp")
	private BugDetailsServiceimp bugDetailsServiceimp;
	
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	
	@Autowired
	@Qualifier("PassServiceimp")
	private PassServiceimp passServiceimp;
	@Autowired
	@Qualifier("BugRightServiceimp")
	private BugRightServiceimp  bugRightServiceimp;
	@RequestMapping("/pass")
	public String pass(HttpServletRequest  req,int bug_id,String content,int bid,int pid){
		String path= req.getParameter("result");
		String  paths = req.getParameter("results");
		String  pathss = req.getParameter("resultss");
		passServiceimp.pass(bug_id, content, bid, path, paths, pathss);
		List<Map<String,Object>> commentsList  = passServiceimp.log(bug_id);
		for(int i=0;i<commentsList.size();i++){
			Object ob  =commentsList.get(i).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString());
			String head1 = passServiceimp.head(buser_id);
			commentsList.get(i).put("head1",head1 );
			}
		String name  =  bugDetailsServiceimp.programName(pid);
		List<Map<String,Object>> bug   = bugDetailsServiceimp.bug(bug_id);
		req.getSession().setAttribute("bug", bug);
		req.getSession().setAttribute("name", name);
        req.getSession().setAttribute("commentsList",commentsList);
        String state =  bugRightServiceimp.state(bug_id);
        String type = bugRightServiceimp.type(bug_id);
       String  right1 =  bugRightServiceimp.details(bid, bug_id, pid);
       String  right = bugRightServiceimp.right(bid, pid, bug_id)+"";       
        req.getSession().setAttribute("right1", right1);
        req.getSession().setAttribute("right", right);
        req.getSession().setAttribute("state", state);
        req.getSession().setAttribute("type", type);
        int num = selectActiveBugServiceimp.activeAllNum(pid);
    	req.getSession().setAttribute("num", num);
		return "bugDetails";
	}
	
	
}
