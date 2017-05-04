package bug.frontstage.mytask.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.AssignOthersServiceImp;
import bug.frontstage.mytask.service.imp.FilterBugServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;

@Controller
public class AssignOthersController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("AssignOthersServiceImp")
	private AssignOthersServiceImp  assignOthersServiceImp;
	
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	
	@Autowired(required=false)
	@Qualifier("FilterBugServiceImp")
	private FilterBugServiceImp  filterBugServiceImp;
	
	@RequestMapping("/assignOthers")
	public String  assignOthers(HttpServletRequest req,int bid,int pid,String currpage){
			
			int numAssignOthers = assignOthersServiceImp.countAssignOthers(bid, pid);
			
			int count = Integer.parseInt(everycount);
			if (numAssignOthers % count == 0) {
				pagecount = (numAssignOthers / count) + "";
			} else {
				pagecount = (numAssignOthers / count + 1) + "";
			}
			
			if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
				req.setAttribute("currpage", pagecount);
				List list = assignOthersServiceImp.assignOthers(bid, pid, pagecount, everycount);
				req.getSession().setAttribute("listAssignOthers", list);	
				req.getSession().setAttribute("numAssignOthers", numAssignOthers);
				req.setAttribute("pagecount", pagecount);
				List assignOthersMaker = filterBugServiceImp.assignOthersMaker("全部", "全部", "全部", bid, pid);
				if(assignOthersMaker.size()==0){
					req.getSession().setAttribute("aoNameSize",0 );

				}else{
					req.getSession().setAttribute("aoNameSize",1 );
				}
				req.getSession().setAttribute("assignOthersMaker", assignOthersMaker);
				req.getSession().setAttribute("aoTypeSelect","全部" );
				req.getSession().setAttribute("aoStateSelect","全部" );
				req.getSession().setAttribute("aoPropSelect","全部" );
				req.getSession().setAttribute("aoMakerSelect","全部" );
				req.getSession().setAttribute("assignOthersMaker",assignOthersMaker );
				return "bugAssignByMe";
			}else {
				if (Integer.parseInt(currpage) < 1) {
					req.setAttribute("currpage", "1");
					List list = assignOthersServiceImp.assignOthers(bid, pid,"1",everycount);
				
					req.getSession().setAttribute("listAssignOthers", list);

					req.getSession().setAttribute("numAssignOthers", numAssignOthers);
					req.setAttribute("pagecount", pagecount);
					return "bugAssignByMe";
				}else {
					List list = assignOthersServiceImp.assignOthers(bid, pid,currpage,everycount);
					List assignOthersMaker = filterBugServiceImp.assignOthersMaker("全部", "全部", "全部", bid, pid);
					if(assignOthersMaker.size()==0){
						req.getSession().setAttribute("aoNameSize",0 );

					}else{
						req.getSession().setAttribute("aoNameSize",1 );
					}
					req.getSession().setAttribute("assignOthersMaker", assignOthersMaker);
					req.getSession().setAttribute("aoTypeSelect","全部" );
					req.getSession().setAttribute("aoStateSelect","全部" );
					req.getSession().setAttribute("aoPropSelect","全部" );
					req.getSession().setAttribute("aoMakerSelect","全部" );
					req.getSession().setAttribute("assignOthersMaker",assignOthersMaker );
					
					
					req.getSession().setAttribute("listAssignOthers", list);
					
					req.setAttribute("currpage", currpage);
					req.getSession().setAttribute("numAssignOthers", numAssignOthers);
					req.setAttribute("pagecount", pagecount);
					return "bugAssignByMe";
				}
				
			}
			

		
	}
}
