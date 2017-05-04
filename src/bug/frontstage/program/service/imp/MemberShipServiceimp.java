package bug.frontstage.program.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.service.MemberShipService;

@Service("MemberShipServiceimp")
public class MemberShipServiceimp  implements MemberShipService  {

	@Autowired
	private  CreateProgram createProgram;
	
	
	@Override
	/*
	 * 
	 * 
	 * */
	public void insertProgramUser(int pid,int bid) {
		 createProgram.insertProgramBuser(pid, bid);
	
	}
	
	public void insertUserRole(int pid,int bid) {
		 createProgram.insertUserRole(bid,pid);	
	}
	
	public boolean isExit(String buser_email){
	boolean flag = createProgram.exitMember(buser_email);
	return flag;
		
	}
  public List<Map<String,Object>> selectAllMember(int pid ){
	  List<Map<String,Object>> list = createProgram.selectAllMember(pid);
	  return list;
	  
  }
	
  public int buserId(String buser_email){
	  return createProgram.getBid(buser_email);
	  
  }

@Override
public void registr(String name) {
	createProgram.register(name);
	
}
  
public boolean good(String email){
	String format = "^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*$";
	if (email.matches(format))
    { 
     return true;// 邮箱名合法，返回true 
    }
   else
    {
     return false;// 邮箱名不合法，返回false
    }
}       
	
public boolean isPrograamEmail(int pid,String buser_email){
	return createProgram.isProgramEmail(pid, buser_email);
}



}
