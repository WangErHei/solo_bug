package bug.frontstage.bug_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.FilterBugInfoServiceImp;

@Controller
public class FilterAllBugController {

	private String everycount = "5";
	private String pagecount;

	@Autowired
	@Qualifier("FilterBugInfoServiceImp")
	private FilterBugInfoServiceImp filterBugInfoServiceImp;
	
	@RequestMapping("/filterAllBug")
	public String allBug(HttpServletRequest req,String type, String state, String prop, String maker, String signer,
			String creater,String currpage,int bid,int pid){
		req.getSession().setAttribute("bid", bid);
		req.getSession().setAttribute("pid", pid);
		int num = filterBugInfoServiceImp.countFilterAll(type, state, prop, maker, signer, creater, pid);
		
		int count = Integer.parseInt(everycount);
	
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			List<Map<String,Object>> allbug = filterBugInfoServiceImp.filterAllBug(type, state, prop, maker, signer, creater, pid,pagecount, everycount);
			
			List allMakerList = filterBugInfoServiceImp.allMaker(type, state, prop, signer, creater, pid);
			if(allMakerList.size()==0){
				req.getSession().setAttribute("allMakerSize",0 );

			}else{
				req.getSession().setAttribute("allMakerSize",1 );
			}
			req.getSession().setAttribute("allMakerList", allMakerList);
			List allSignerList = filterBugInfoServiceImp.allSigner(type, state, prop, maker, creater, pid);
			if(allSignerList.size()==0){
				req.getSession().setAttribute("allSignerSize",0 );

			}else{
				req.getSession().setAttribute("allSignerSize",1 );
			}
			req.getSession().setAttribute("allSignerList", allSignerList);
			List allCreaterList = filterBugInfoServiceImp.allCreater(type, state, prop, maker, signer, pid);
			if(allCreaterList.size()==0){
				req.getSession().setAttribute("allCreaterSize",0 );

			}else{
				req.getSession().setAttribute("allCreaterSize",1 );
			}
			req.getSession().setAttribute("allCreaterList", allCreaterList);
			req.getSession().setAttribute("allTypeSelect",type );
			req.getSession().setAttribute("allStateSelect",state );
			req.getSession().setAttribute("allPropSelect",prop );
			req.getSession().setAttribute("allMakerSelect",maker );
			req.getSession().setAttribute("allSignerSelect",signer );
			req.getSession().setAttribute("allCreaterSelect",creater );
			req.getSession().setAttribute("allbug", allbug);	
			req.getSession().setAttribute("allnum", num);
			
			req.getSession().setAttribute("pagecount", pagecount);
			return "bugAll";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				List<Map<String,Object>> allbug = filterBugInfoServiceImp.filterAllBug(type, state, prop, maker, signer, creater, pid,"1", everycount);
				
				List allMakerList = filterBugInfoServiceImp.allMaker(type, state, prop, signer, creater, pid);
				if(allMakerList.size()==0){
					req.getSession().setAttribute("allMakerSize",0 );

				}else{
					req.getSession().setAttribute("allMakerSize",1 );
				}
				List allSignerList = filterBugInfoServiceImp.allSigner(type, state, prop, maker, creater, pid);
				if(allSignerList.size()==0){
					req.getSession().setAttribute("allSignerSize",0 );

				}else{
					req.getSession().setAttribute("allSignerSize",1 );
				}
				req.getSession().setAttribute("allSignerList", allSignerList);
				List allCreaterList = filterBugInfoServiceImp.allCreater(type, state, prop, maker, signer, pid);
				if(allCreaterList.size()==0){
					req.getSession().setAttribute("allCreaterSize",0 );

				}else{
					req.getSession().setAttribute("allCreaterSize",1 );
				}
				req.getSession().setAttribute("allCreaterList", allCreaterList);
				req.getSession().setAttribute("allMakerList", allMakerList);
				req.getSession().setAttribute("allTypeSelect",type );
				req.getSession().setAttribute("allStateSelect",state );
				req.getSession().setAttribute("allPropSelect",prop );
				req.getSession().setAttribute("allMakerSelect",maker );
				req.getSession().setAttribute("allSignerSelect",signer );
				req.getSession().setAttribute("allCreaterSelect",creater );
				req.getSession().setAttribute("allbug", allbug);			
				req.getSession().setAttribute("allnum", num);				
				req.setAttribute("pagecount", pagecount);
				return "bugAll";
			} else {
				List<Map<String,Object>> allbug = filterBugInfoServiceImp.filterAllBug(type, state, prop, maker, signer, creater, pid,currpage, everycount);

				List allMakerList = filterBugInfoServiceImp.allMaker(type, state, prop, signer, creater, pid);
				if(allMakerList.size()==0){
					req.getSession().setAttribute("allMakerSize",0 );

				}else{
					req.getSession().setAttribute("allMakerSize",1 );
				}
				req.getSession().setAttribute("allMakerList", allMakerList);
				List allSignerList = filterBugInfoServiceImp.allSigner(type, state, prop, maker, creater, pid);
				if(allSignerList.size()==0){
					req.getSession().setAttribute("allSignerSize",0 );

				}else{
					req.getSession().setAttribute("allSignerSize",1 );
				}
				req.getSession().setAttribute("allSignerList", allSignerList);
				List allCreaterList = filterBugInfoServiceImp.allCreater(type, state, prop, maker, signer, pid);
				if(allCreaterList.size()==0){
					req.getSession().setAttribute("allCreaterSize",0 );

				}else{
					req.getSession().setAttribute("allCreaterSize",1 );
				}
				req.getSession().setAttribute("allCreaterList", allCreaterList);
				req.getSession().setAttribute("allTypeSelect",type );
				req.getSession().setAttribute("allStateSelect",state );
				req.getSession().setAttribute("allPropSelect",prop );
				req.getSession().setAttribute("allMakerSelect",maker );
				req.getSession().setAttribute("allSignerSelect",signer );
				req.getSession().setAttribute("allCreaterSelect",creater );
				req.getSession().setAttribute("currpage", currpage);
				req.getSession().setAttribute("allbug", allbug);
				req.getSession().setAttribute("allnum", num);				
				req.getSession().setAttribute("pagecount", pagecount);
				return "bugAll";
			}
		}

	}
}
