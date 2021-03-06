package bug.frontstage.bug_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import bug.frontstage.bug_info.service.imp.FilterBugInfoServiceImp;

import bug.frontstage.bug_info.service.imp.SelectAllBugServiceimp;

@Controller
public class AllBugController {
	

	private String everycount = "5";
	private String pagecount;

	@Autowired
	@Qualifier("SelectAllBugServiceimp")
	private SelectAllBugServiceimp selectAllBugServiceimp;
	
	@Autowired
	@Qualifier("FilterBugInfoServiceImp")
	private FilterBugInfoServiceImp filterBugInfoServiceImp;
	
	@RequestMapping("/allBug")
	public String allBug(HttpServletRequest req,String currpage){
	
		String b_id = req.getParameter("bid");
		String p_id = req.getParameter("pid");
		int pid = Integer.parseInt(p_id);
		int bid = Integer.parseInt(b_id);
	
		req.getSession().setAttribute("bid", bid);
		req.getSession().setAttribute("pid", pid);
		int allnum = selectAllBugServiceimp.allBugNum(pid);
		
		int count = Integer.parseInt(everycount);
	
		if (allnum % count == 0) {
			pagecount = (allnum / count) + "";
		} else {
			pagecount = (allnum / count + 1) + "";
		}
		

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			List<Map<String,Object>> 	    allbug = selectAllBugServiceimp.allBug(pid,pagecount, everycount);
			req.getSession().setAttribute("allbug", allbug);	
			req.getSession().setAttribute("allnum", allnum);
			req.setAttribute("pagecount", pagecount);
			
			List allMakerList = filterBugInfoServiceImp.allMaker("全部", "全部活动", "全部", "全部", "全部", pid);
			if(allMakerList.size()==0){
				req.getSession().setAttribute("allMakerSize",0 );

			}else{
				req.getSession().setAttribute("allMakerSize",1 );
			}
			req.getSession().setAttribute("allMakerList", allMakerList);
			List allSignerList = filterBugInfoServiceImp.allSigner("全部", "全部活动", "全部", "全部", "全部", pid);
			if(allSignerList.size()==0){
				req.getSession().setAttribute("allSignerSize",0 );

			}else{
				req.getSession().setAttribute("allSignerSize",1 );
			}
			req.getSession().setAttribute("allSignerList", allSignerList);
			List allCreaterList = filterBugInfoServiceImp.allCreater("全部", "全部活动", "全部", "全部", "全部", pid);
			if(allCreaterList.size()==0){
				req.getSession().setAttribute("allCreaterSize",0 );

			}else{
				req.getSession().setAttribute("allCreaterSize",1 );
			}
			req.getSession().setAttribute("allCreaterList", allCreaterList);
			req.getSession().setAttribute("allTypeSelect","全部" );
			req.getSession().setAttribute("allStateSelect","全部活动" );
			req.getSession().setAttribute("allPropSelect","全部" );
			req.getSession().setAttribute("allMakerSelect","全部" );
			req.getSession().setAttribute("allSignerSelect","全部" );
			req.getSession().setAttribute("allCreaterSelect","全部" );
			return "bugAll";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				List<Map<String,Object>> 	    allbug = selectAllBugServiceimp.allBug(pid,"1", everycount);
				req.getSession().setAttribute("allbug", allbug);			
				req.getSession().setAttribute("allnum", allnum);
				req.setAttribute("pagecount", pagecount);
				return "bugAll";
			} else {
				List<Map<String,Object>> 	 allbug = selectAllBugServiceimp.allBug(pid,currpage, everycount);

				List allMakerList = filterBugInfoServiceImp.allMaker("全部", "全部活动", "全部", "全部", "全部", pid);
				if(allMakerList.size()==0){
					req.getSession().setAttribute("allMakerSize",0 );

				}else{
					req.getSession().setAttribute("allMakerSize",1 );
				}
				req.getSession().setAttribute("allMakerList", allMakerList);
				List allSignerList = filterBugInfoServiceImp.allSigner("全部", "全部活动", "全部", "全部", "全部", pid);
				if(allSignerList.size()==0){
					req.getSession().setAttribute("allSignerSize",0 );

				}else{
					req.getSession().setAttribute("allSignerSize",1 );
				}
				req.getSession().setAttribute("allSignerList", allSignerList);
				List allCreaterList = filterBugInfoServiceImp.allCreater("全部", "全部活动", "全部", "全部", "全部", pid);
				if(allCreaterList.size()==0){
					req.getSession().setAttribute("allCreaterSize",0 );

				}else{
					req.getSession().setAttribute("allCreaterSize",1 );
				}
				req.getSession().setAttribute("allCreaterList", allCreaterList);
				req.getSession().setAttribute("allTypeSelect","全部" );
				req.getSession().setAttribute("allStateSelect","全部活动" );
				req.getSession().setAttribute("allPropSelect","全部" );
				req.getSession().setAttribute("allMakerSelect","全部" );
				req.getSession().setAttribute("allSignerSelect","全部" );
				req.getSession().setAttribute("allCreaterSelect","全部" );
				
				req.setAttribute("currpage", currpage);
				req.getSession().setAttribute("allbug", allbug);
				req.getSession().setAttribute("allnum", allnum);
				req.setAttribute("pagecount", pagecount);
				return "bugAll";
			}
		}

	}

}
