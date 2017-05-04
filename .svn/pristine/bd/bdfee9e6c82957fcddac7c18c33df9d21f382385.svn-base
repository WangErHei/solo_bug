package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.SignService;

@Service("SignServiceimp")
public class SignServiceimp implements SignService{

	@Autowired
	private  SelectProgram selectProgram;
	
	@Override
	public List<Map<String, Object>> log(int bug_id) {
		
		return selectProgram.log(bug_id);
	}

	@Override
	public void sign(String buser_name, int bug_id, String content, int bid,String path,String paths,String pathss) {
		
		selectProgram.sign(buser_name, bug_id, content, bid,path,paths,pathss);
	}

	public String head(int  bid){
		return  selectProgram.head(bid);
	}
}
