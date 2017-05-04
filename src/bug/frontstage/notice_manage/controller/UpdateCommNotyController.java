package bug.frontstage.notice_manage.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.notice_manage.model.Notify_Comment;
import bug.frontstage.notice_manage.service.imp.AddNotifyServiceImp;
import bug.frontstage.notice_manage.service.imp.CommentNotyServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowCreaterNameServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowOneNotifyServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;

@Controller
public class UpdateCommNotyController {


	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("AddNotifyServiceImp")
	private AddNotifyServiceImp  addNotifyServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	
	
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	
	@Autowired(required=false)
	@Qualifier("ShowCreaterNameServiceImp")
	private ShowCreaterNameServiceImp  showCreaterNameServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowOneNotifyServiceImp")
	private ShowOneNotifyServiceImp  showOneNotifyServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNameServiceImp")
	private ShowNameServiceImp  showNameServiceImp;
	
	@Autowired(required=false)
	@Qualifier("CommentNotyServiceImp")
	private CommentNotyServiceImp commentNotyServiceImp;
	@RequestMapping("/updateCommNotify")
	public  String updateCommNotify(HttpServletRequest req,int commId,int notyId,String creater,String typeInfo,String commContent,int bid,int pid) throws UnsupportedEncodingException{
		
		Notify_Comment notyComm = new Notify_Comment();
		notyComm.setBid(bid);
		notyComm.setCommContent(commContent);
		notyComm.setCommId(commId);
		commentNotyServiceImp.updateNotifyComment(notyComm);
		
		List<Map<String,Object>> list = showOneNotifyServiceImp.showOneNotify(notyId);
		String oneNotyType = (String)list.get(0).get("notify_type");
		req.getSession().setAttribute("typeInfo",typeInfo );
		req.getSession().setAttribute("creater",creater );
		req.getSession().setAttribute("oneNotify", list);
		req.getSession().setAttribute("oneNotyType", oneNotyType);
		
		List<Map<String,Object>> commList = commentNotyServiceImp.showAllNotifyComment(notyId);
		req.getSession().setAttribute("notyCommList", commList);
				
		return "informDetails";
			
			
		}
}
