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
import bug.frontstage.login.service.imp.SelectProgramLoginServiceimp;

@Controller
public class SelectActiveBugController {

	private String everycount = "5";
	private String pagecount;
	

	
	@Autowired
	@Qualifier("FilterBugInfoServiceImp")
	private FilterBugInfoServiceImp filterBugInfoServiceImp;
	
	@Autowired(required = false)
	@Qualifier("SelectProgramLoginServiceimp")
	private SelectProgramLoginServiceimp selectProgramLoginServiceimp;
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;

	@RequestMapping("/Programactive")
	public String activeBug(HttpServletRequest req,String currpage,int bid,int pid  ) {
		
		req.getSession().setAttribute("bid", bid);
		req.getSession().setAttribute("pid", pid);	
		int num = selectActiveBugServiceimp.activeAllNum(pid);
		
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
	

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			List<Map<String, Object>>    activebug = selectActiveBugServiceimp.activeBug(pid,pagecount, everycount);
			List<Map<String, Object>> list1 = selectProgramLoginServiceimp.selectAllProgram(bid);
			req.getSession().setAttribute("list1", list1);
			req.getSession().setAttribute("activebug", activebug);
			req.getSession().setAttribute("num", num);
			req.setAttribute("pagecount", pagecount);
			
			List activeMakerList = filterBugInfoServiceImp.activeMaker("全部", "全部活动", "全部", pid);
			if(activeMakerList.size()==0){
				req.getSession().setAttribute("activeMakerSize",0 );

			}else{
				req.getSession().setAttribute("activeMakerSize",1 );
			}
			req.getSession().setAttribute("activeMakerList", activeMakerList);
			req.getSession().setAttribute("actTypeSelect","全部" );
			req.getSession().setAttribute("actStateSelect","全部活动" );
			req.getSession().setAttribute("actPropSelect","全部" );
			req.getSession().setAttribute("actMakerSelect","全部" );
			return "bugActive";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				List<Map<String, Object>>	 activebug = selectActiveBugServiceimp.activeBug(pid,"1", everycount);
				List<Map<String, Object>> list1 = selectProgramLoginServiceimp.selectAllProgram(bid);
				req.getSession().setAttribute("list1", list1);
				req.getSession().setAttribute("activebug", activebug);
				req.getSession().setAttribute("num", num);
				req.setAttribute("pagecount", pagecount);
				return "bugActive";
			}

			else {
				List<Map<String, Object>> activebug = selectActiveBugServiceimp.activeBug(pid,currpage, everycount);
				List<Map<String, Object>> list1 = selectProgramLoginServiceimp.selectAllProgram(bid);
				req.getSession().setAttribute("list1", list1);
				
				List activeMakerList = filterBugInfoServiceImp.activeMaker("全部", "全部活动", "全部", pid);
				if(activeMakerList.size()==0){
					req.getSession().setAttribute("activeMakerSize",0 );

				}else{
					req.getSession().setAttribute("activeMakerSize",1 );
				}
				req.getSession().setAttribute("activeMakerList", activeMakerList);
				req.getSession().setAttribute("actTypeSelect","全部" );
				req.getSession().setAttribute("actStateSelect","全部活动" );
				req.getSession().setAttribute("actPropSelect","全部" );
				req.getSession().setAttribute("actMakerSelect","全部" );
				
				req.setAttribute("currpage", currpage);
				req.getSession().setAttribute("activebug", activebug);
				req.getSession().setAttribute("num", num);
				req.setAttribute("pagecount", pagecount);
				return "bugActive";
			}
		}

	}

}
