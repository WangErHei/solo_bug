package bug.frontstage.program.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.program.model.Program;
import bug.frontstage.program.service.imp.CreateProgramSeviceimp;
import bug.frontstage.program.service.imp.InsertProgramUserimp;
import bug.frontstage.program.service.imp.InsertUserRoleServiceimp;
import bug.frontstage.program.service.imp.SelectNameServiceAmountimp;



/*
 * 1.
 * 2.
 * 3.
 * */
@Controller
public class CreateProgramController {

	@Autowired(required = false)
	@Qualifier("CreateProgramSeviceimp")
	private CreateProgramSeviceimp createProgramSeviceimp;
	
	@Autowired(required = false)
	@Qualifier("InsertProgramUserimp")
	private InsertProgramUserimp insertProgramUserimp;
	
	@Autowired(required = false)
	@Qualifier("InsertUserRoleServiceimp")
	private InsertUserRoleServiceimp insertUserRoleServiceimp;
	
	@Autowired(required = false)
	@Qualifier("SelectNameServiceAmountimp")
	private SelectNameServiceAmountimp selectNameServiceAmountimp;

	@RequestMapping("/createProgram")
	@ResponseBody
	public Map<String,Object>  createProgram(HttpServletRequest req,HttpServletResponse  resp) throws UnsupportedEncodingException {
		Map<String,Object>  map = new HashMap<String,Object>();
		String id = req.getParameter("bid");
	    int bid = Integer.parseInt(id);
		String program_name = req.getParameter("program_name");
		String program_describe = req.getParameter("program_describe");
		String buser_email = req.getParameter("name");
		
		String name = URLDecoder.decode(program_name,"utf-8" );
		String describe = URLDecoder.decode(program_describe,"utf-8" );
		Program program = new Program();
		
		program.setProgram_name(name.replace("'",""));
		program.setProgram_describe(describe.replace("'",""));
if(program.getProgram_name().equals(" ")|| program.getProgram_describe().equals("")){
			map.put("msg2", "请完善项目信息!");
			return map;
}else{
		createProgramSeviceimp.createProgram(program, bid,buser_email);
		 int  pid =  createProgramSeviceimp.getProgramId(bid,program);
		insertProgramUserimp.insertProgramUser(pid, bid);
		insertUserRoleServiceimp.insertUserRoleMain(bid,pid);
		String pro_name = selectNameServiceAmountimp.selecName(pid);
	
	   map.put("pid", pid);	
	   map.put("pro_name",pro_name);
		return map;
}
	}

}
