package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.project_info.service.imp.AgainServiceimp;
import bug.frontstage.project_info.service.imp.BugDetailsServiceimp;
import bug.frontstage.project_info.service.imp.BugRightServiceimp;
import bug.frontstage.project_info.service.imp.CommentsServiceimp;

@Controller
public class BugController {
	
	@Autowired
	@Qualifier("BugDetailsServiceimp")
	private BugDetailsServiceimp bugDetailsServiceimp;
	@Autowired
	@Qualifier("AgainServiceimp")
	private AgainServiceimp  againServiceimp;
		@Autowired
	@Qualifier("BugRightServiceimp")
	private BugRightServiceimp  bugRightServiceimp;
	@Autowired(required=false)
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp  countNeedToDoServiceImp;
	@Autowired(required=false)
	@Qualifier("CommentsServiceimp")
	private CommentsServiceimp commentsServiceimp;
	@RequestMapping("/tobug")
	public  String Bug(HttpServletRequest  req){	
	  String  b_id=req.getParameter("bid");
	   int bid =Integer.parseInt(b_id);
		
		 String id = req.getParameter("bug_id");
		 int bug_id=Integer.parseInt(id);
		 
		 String id1=req.getParameter("pid");
		 int pid = Integer.parseInt(id1);
		String name  =  bugDetailsServiceimp.programName(pid);
		List<Map<String,Object>> bug   = bugDetailsServiceimp.bug(bug_id);
		req.getSession().setAttribute("bug", bug);
		req.getSession().setAttribute("name", name);
		List<Map<String,Object>>  commentsList = commentsServiceimp.log(bug_id);
		for(int i=0;i<commentsList.size();i++){
			Object ob  =commentsList.get(i).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString());
			String head1 = againServiceimp.head(buser_id);
			commentsList.get(i).put("head1",head1 );
			}
        req.getSession().setAttribute("commentsList",commentsList);
        String state =  bugRightServiceimp.state(bug_id);
        String type = bugRightServiceimp.type(bug_id);
       String  right1 =  bugRightServiceimp.details(bid, bug_id, pid);
       String  right = bugRightServiceimp.right(bid, pid, bug_id)+"";       
        req.getSession().setAttribute("right1", right1);
        req.getSession().setAttribute("right", right);
        req.getSession().setAttribute("state", state);
        req.getSession().setAttribute("type", type);
        int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
     	req.getSession().setAttribute("countNeedToDo", countNeedToDo);
     	String signer = (String) bug.get(0).get("bug_signer");
     	req.getSession().setAttribute("signer", signer);
		return "bugDetails";
	}
	

}
