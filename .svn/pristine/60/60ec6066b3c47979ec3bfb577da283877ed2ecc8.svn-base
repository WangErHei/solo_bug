package bug.frontstage.notice_manage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.notice_manage.service.imp.CommServiceimp;
import bug.frontstage.notice_manage.service.imp.CommentNotyServiceImp;
import bug.frontstage.project_info.service.imp.CommentsServiceimp;

@Controller
public class DeleteComController {

	@Autowired
	@Qualifier("CommServiceimp")
	private CommServiceimp commServiceimp;
	@Autowired(required=false)
	@Qualifier("CommentNotyServiceImp")
	private CommentNotyServiceImp commentNotyServiceImp;
	@Autowired(required=false)
	@Qualifier("CommentsServiceimp")
	private CommentsServiceimp commentsServiceimp;
	
	@RequestMapping("/comDelete")
	public String deleteComm(int comm_id,HttpServletRequest req,int notyId){
		commServiceimp.deleteComm(comm_id);
		List<Map<String,Object>> commList = commentNotyServiceImp.showAllNotifyComment(notyId);
		for(int j=0;j<commList.size();j++){
			Object ob  =commList.get(j).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString());
			String head1 = commentsServiceimp.head(buser_id);
			commList.get(j).put("head1",head1 );
			}
		req.getSession().setAttribute("notyCommList", commList);
		return "informDetails";
		
	}
}
