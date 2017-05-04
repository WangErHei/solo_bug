package bug.frontstage.bug_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.FilterBugInfoServiceImp;
import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
@Controller
public class FilterActiveBugController {

	private String everycount = "5";
	private String pagecount;

	@Autowired
	@Qualifier("FilterBugInfoServiceImp")
	private FilterBugInfoServiceImp filterBugInfoServiceImp;

	@RequestMapping("/filterActiveBug")
	public String activeBug(HttpServletRequest req,String type, String state, String prop, String maker,String currpage,int bid,int pid  ) {
		
		req.getSession().setAttribute("bid", bid);
		req.getSession().setAttribute("pid", pid);	
		int num = filterBugInfoServiceImp.countFilterActive(type, state, prop, maker, pid);
		
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
	

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			List<Map<String, Object>>  activebug = filterBugInfoServiceImp.filterActiveBug(type, state, prop, maker, pid,pagecount, everycount);
			
			List activeMakerList = filterBugInfoServiceImp.activeMaker(type, state, prop, pid);
			if(activeMakerList.size()==0){
				req.getSession().setAttribute("activeMakerSize",0 );

			}else{
				req.getSession().setAttribute("activeMakerSize",1 );
			}
			req.getSession().setAttribute("activeMakerList", activeMakerList);
			req.getSession().setAttribute("actTypeSelect",type );
			req.getSession().setAttribute("actStateSelect",state );
			req.getSession().setAttribute("actPropSelect",prop );
			req.getSession().setAttribute("actMakerSelect",maker );
			req.getSession().setAttribute("activebug", activebug);
			req.getSession().setAttribute("num", num);
			req.getSession().setAttribute("pagecount", pagecount);
			return "bugActive";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				List<Map<String, Object>>	 activebug = filterBugInfoServiceImp.filterActiveBug(type, state, prop, maker, pid,"1", everycount);
				
				List activeMakerList = filterBugInfoServiceImp.activeMaker(type, state, prop, pid);
				if(activeMakerList.size()==0){
					req.getSession().setAttribute("activeMakerSize",0 );

				}else{
					req.getSession().setAttribute("activeMakerSize",1 );
				}
				req.getSession().setAttribute("activeMakerList", activeMakerList);
				req.getSession().setAttribute("actTypeSelect",type );
				req.getSession().setAttribute("actStateSelect",state );
				req.getSession().setAttribute("actPropSelect",prop );
				req.getSession().setAttribute("actMakerSelect",maker );
				req.getSession().setAttribute("activebug", activebug);
				req.getSession().setAttribute("num", num);
				req.getSession().setAttribute("pagecount", pagecount);
				return "bugActive";
			}

			else {
				
				List<Map<String, Object>> activebug = filterBugInfoServiceImp.filterActiveBug(type, state, prop, maker, pid,currpage, everycount);
				
				List activeMakerList = filterBugInfoServiceImp.activeMaker(type, state, prop, pid);
				if(activeMakerList.size()==0){
					req.getSession().setAttribute("activeMakerSize",0 );

				}else{
					req.getSession().setAttribute("activeMakerSize",1 );
				}
				req.getSession().setAttribute("activeMakerList", activeMakerList);
				req.getSession().setAttribute("actTypeSelect",type );
				req.getSession().setAttribute("actStateSelect",state );
				req.getSession().setAttribute("actPropSelect",prop );
				req.getSession().setAttribute("actMakerSelect",maker );
				req.getSession().setAttribute("currpage", currpage);
				req.getSession().setAttribute("activebug", activebug);
				req.getSession().setAttribute("num", num);
				req.getSession().setAttribute("pagecount", pagecount);
				return "bugActive";
			}
		}

	}

}
