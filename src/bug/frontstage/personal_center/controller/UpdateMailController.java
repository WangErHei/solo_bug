package bug.frontstage.personal_center.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import antlr.collections.impl.LList;
import bug.frontstage.login.model.Buser;
import bug.frontstage.personal_center.service.imp.JudgePassServiceImp;
import bug.frontstage.personal_center.service.imp.SelectAllServiceImp;
import bug.frontstage.personal_center.service.imp.UpdateMailServiceImp;


@Controller
public class UpdateMailController {

	@Autowired(required=false)
	@Qualifier("JudgePassServiceImp")
	private JudgePassServiceImp  judgePassServiceImp;
	
	@Autowired(required=false)
	@Qualifier("UpdateMailServiceImp")
	private UpdateMailServiceImp  updateMailServiceImp;
	
	@Autowired(required=false)
	@Qualifier("SelectAllServiceImp")
	private SelectAllServiceImp  selectAllServiceImp;
	
	@RequestMapping("/updateMail")
	public String   UpdateBuserMail(HttpServletRequest req,int id){
		
		String mail = req.getParameter("new_email");
		String pass = req.getParameter("password");
		boolean flage = updateMailServiceImp.isEmial(mail);
		if(flage){
		if(judgePassServiceImp.isPass(id, pass)){
			boolean flag = updateMailServiceImp.good(mail);
			if(flag){
			updateMailServiceImp.updateMail(id, mail);
			List<Map<String,Object>> list = selectAllServiceImp.selectAll(id);
		   String email = (String) list.get(0).get("BUSER_EMAIL");
			Buser buser = new Buser();
			buser.setBuser_email(email);
	       req.getSession().setAttribute("flag", buser);
	       req.setAttribute("emsg","修改成功！");
			return "projects";
			}else{
				  req.setAttribute("emsg","填写邮箱有误，请再次确认!");
					return "projects";
			}
		}else{
			req.setAttribute("emsg","用户密码错误！");
			return "projects";
		}
		}else{
			req.setAttribute("emsg","用户邮箱,已被注册!");
			return "projects";
		}
		
	}
}
