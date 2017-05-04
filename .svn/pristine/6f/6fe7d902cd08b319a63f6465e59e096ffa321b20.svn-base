package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.project_info.service.imp.BugDetailsServiceimp;
import bug.frontstage.project_info.service.imp.CommentsServiceimp;

@Controller
public class CommentsController {

	@Autowired(required=false)
	@Qualifier("CommentsServiceimp")
	private CommentsServiceimp commentsServiceimp;
	
	@Autowired
	@Qualifier("BugDetailsServiceimp")
	private BugDetailsServiceimp bugDetailsServiceimp;
	
	
	@RequestMapping("/comments")
	public String  comments(HttpServletRequest  req,int bid,int bug_id,String content,int pid){
		String path= req.getParameter("result");
		String  paths = req.getParameter("results");
		String  pathss = req.getParameter("resultss");
		commentsServiceimp.comments(bug_id, bid, path, content, paths, pathss);
		List<Map<String,Object>>  commentsList = commentsServiceimp.log(bug_id);
		req.getSession().setAttribute("commentsList", commentsList);
		for(int i=0;i<commentsList.size();i++){
			Object ob  =commentsList.get(i).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString());
			String head1 = commentsServiceimp.head(buser_id);
			commentsList.get(i).put("head1",head1 );
			}
		String name  =  bugDetailsServiceimp.programName(pid);
		List<Map<String,Object>> bug   = bugDetailsServiceimp.bug(bug_id);
		req.getSession().setAttribute("bug", bug);
		req.getSession().setAttribute("name", name);   
		return "bugDetails";
	}
	
	
}
