package bug.frontstage.mytask.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.AssignOthersServiceImp;
import bug.frontstage.mytask.service.imp.FilterBugServiceImp;


@Controller
public class FilterAssignOthersController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("AssignOthersServiceImp")
	private AssignOthersServiceImp  assignOthersServiceImp;
	
	
	@Autowired(required=false)
	@Qualifier("FilterBugServiceImp")
	private FilterBugServiceImp  filterBugServiceImp;
	
	
	@RequestMapping("/filterAssignOthers")
	public String  filterAssignOthers(HttpServletRequest req,String type, String state, String prop, String maker,int bid,int pid,String currpage){
			
			int numAssignOthers = filterBugServiceImp.countFilterAssignOthers(type, state, prop, maker, bid, pid);
		
			int count = Integer.parseInt(everycount);
			if (numAssignOthers % count == 0) {
				pagecount = (numAssignOthers / count) + "";
			} else {
				pagecount = (numAssignOthers / count + 1) + "";
			}
			
			if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
				req.getSession().setAttribute("currpage", pagecount);
				List list = filterBugServiceImp.filterAssignOthers(type, state, prop, maker, bid, pid, pagecount, everycount);
				
				List assignOthersMaker = filterBugServiceImp.assignOthersMaker(type, state, prop, bid, pid);
				if(assignOthersMaker.size()==0){
					req.getSession().setAttribute("aoNameSize",0 );

				}else{
					req.getSession().setAttribute("aoNameSize",1 );
				}
				req.getSession().setAttribute("assignOthersMaker", assignOthersMaker);
				req.getSession().setAttribute("aoTypeSelect",type );
				req.getSession().setAttribute("aoStateSelect",state );
				req.getSession().setAttribute("aoPropSelect",prop );
				req.getSession().setAttribute("aoMakerSelect",maker );
				req.getSession().setAttribute("listAssignOthers", list);	
				req.getSession().setAttribute("numAssignOthers", numAssignOthers);
				req.setAttribute("pagecount", pagecount);
				return "bugAssignByMe";
			}else {
				if (Integer.parseInt(currpage) < 1) {
					req.getSession().setAttribute("currpage", "1");
					List list = filterBugServiceImp.filterAssignOthers(type, state, prop, maker, bid, pid,"1",everycount);
				
					List assignOthersMaker = filterBugServiceImp.assignOthersMaker(type, state, prop, bid, pid);
					if(assignOthersMaker.size()==0){
						req.getSession().setAttribute("aoNameSize",0 );

					}else{
						req.getSession().setAttribute("aoNameSize",1 );
					}
					req.getSession().setAttribute("assignOthersMaker", assignOthersMaker);
					req.getSession().setAttribute("aoTypeSelect",type );
					req.getSession().setAttribute("aoStateSelect",state );
					req.getSession().setAttribute("aoPropSelect",prop );
					req.getSession().setAttribute("aoMakerSelect",maker );
					req.getSession().setAttribute("listAssignOthers", list);
					
					req.getSession().setAttribute("numAssignOthers", numAssignOthers);
					req.setAttribute("pagecount", pagecount);
					return "bugAssignByMe";
				}else {
					List list = filterBugServiceImp.filterAssignOthers(type, state, prop, maker, bid, pid,currpage,everycount);
					List assignOthersMaker = filterBugServiceImp.assignOthersMaker(type, state, prop, bid, pid);
					if(assignOthersMaker.size()==0){
						req.getSession().setAttribute("aoNameSize",0 );

					}else{
						req.getSession().setAttribute("aoNameSize",1 );
					}
					req.getSession().setAttribute("assignOthersMaker", assignOthersMaker);
					req.getSession().setAttribute("aoTypeSelect",type );
					req.getSession().setAttribute("aoStateSelect",state );
					req.getSession().setAttribute("aoPropSelect",prop );
					req.getSession().setAttribute("aoMakerSelect",maker );
					req.getSession().setAttribute("listAssignOthers", list);
					
					req.getSession().setAttribute("currpage", currpage);
					req.getSession().setAttribute("numAssignOthers", numAssignOthers);
					req.getSession().setAttribute("pagecount", pagecount);
					return "bugAssignByMe";
				}
				
			}
			

		
	}
}
