package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.project_info.service.imp.AgainServiceimp;
import bug.frontstage.project_info.service.imp.CommBugServiceimp;
import bug.frontstage.project_info.service.imp.CommentsServiceimp;


@Controller
public class UpdateBugSubCommController {
	@Autowired
	@Qualifier("AgainServiceimp")
	private AgainServiceimp  againServiceimp;
	@Autowired
	@Qualifier("CommBugServiceimp")
	private  CommBugServiceimp  commBugServiceimp;
	@Autowired(required=false)
	@Qualifier("CommentsServiceimp")
	private CommentsServiceimp commentsServiceimp;
	
	@RequestMapping("/subcomm")
	public  String updateCommSub(String content,String photo,String fu,String fu_name,int comm_id,HttpServletRequest  req,int bug_id){
		commBugServiceimp.commSub(content, photo, fu, fu_name, comm_id);
		List<Map<String,Object>>  commentsList = commentsServiceimp.log(bug_id);
		for(int i=0;i<commentsList.size();i++){
			Object ob  =commentsList.get(i).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString());
			String head1 = againServiceimp.head(buser_id);
			commentsList.get(i).put("head1",head1 );
			}
        req.getSession().setAttribute("commentsList",commentsList);
		return "bugDetails";	
	}
	
	
}
