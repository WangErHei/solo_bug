package bug.frontstage.notice_manage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.notice_manage.service.imp.CommentNotyServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowOneNotifyServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;
import bug.frontstage.project_info.service.imp.CommentsServiceimp;

@Controller
public class ShowNoticeInfoController {

	@Autowired(required=false)
	@Qualifier("ShowOneNotifyServiceImp")
	private ShowOneNotifyServiceImp  showOneNotifyServiceImp;
	@Autowired(required=false)
	@Qualifier("CommentNotyServiceImp")
	private CommentNotyServiceImp commentNotyServiceImp;
	@Autowired(required=false)
	@Qualifier("CommentsServiceimp")
	private CommentsServiceimp commentsServiceimp;
	@RequestMapping("/showNoticeInfo")
	public  String showNoticeInfo(HttpServletRequest req,int notyId,String creater ,String typeInfo,int pid,int bid){
		
		List<Map<String,Object>> list = showOneNotifyServiceImp.showOneNotify(notyId);
		String oneNotyType = (String)list.get(0).get("notify_type");
		Object i =list.get(0).get("notify_id");
		int noticeId = Integer.parseInt(String.valueOf(i));
		String right = showOneNotifyServiceImp.right(bid, pid)+"";
		req.getSession().setAttribute("right",right );
		req.getSession().setAttribute("typeInfo",typeInfo );
		req.getSession().setAttribute("creater",creater );
		req.getSession().setAttribute("oneNotify", list);
		req.getSession().setAttribute("noticeId", noticeId);
		req.getSession().setAttribute("oneNotyType", oneNotyType);
		List<Map<String,Object>> commList = commentNotyServiceImp.showAllNotifyComment(notyId);
		String name = commentNotyServiceImp.name(bid);
		req.getSession().setAttribute("name", name);
		if(name.equals(creater)){
			req.getSession().setAttribute("check","1");
		}
		for(int j=0;j<commList.size();j++){
			Object ob  =commList.get(j).get("buser_id");
			int buser_id =Integer.parseInt(ob.toString()); 
			String head1 = commentsServiceimp.head(buser_id);
			commList.get(j).put("head1",head1 );
			}
		req.getSession().setAttribute("notyCommList", commList);
		String notyCommContent = (String)list.get(0).get("comment_content");
		req.getSession().setAttribute("notyCommContent", notyCommContent);
		
		return "informDetails";
	}
}
