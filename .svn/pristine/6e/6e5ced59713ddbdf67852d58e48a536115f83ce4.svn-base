package bug.register.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import bug.frontstage.login.model.Buser;



public class Register {

	@Autowired(required = false)
	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public  int  register(Buser buser){
		int  i  =jdbcTemplate.update("INSERT INTO BUSER(buser_id,buser_name,buser_pass,buser_email)  VALUES(seq_buser.nextval  ,  '"+ buser.getBuser_name()+ "', '"   + buser.getBuser_pass()+ "', '"    +buser.getBuser_email() + "')");  
		return i;
	}
	
	public int getId(Buser buser){
		List<Map<String,Object>> list= jdbcTemplate.queryForList("select buser_id from buser  where buser_email=? and buser_pass=?", new Object[]{buser.getBuser_email(),buser.getBuser_pass()});
		Object ob =list.get(0).get("buser_id");
		int  i = Integer.parseInt(ob.toString());
		return i;
	}
	
	//�ж��Ƿ���ڡ�
	public  boolean  isExit(String buser_email){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  count(*)  a   from buser  where  buser_email=? ",new Object []{buser_email});
		Object ob = list.get(0).get("a");
		int a = Integer.parseInt(ob.toString());
		if(a>0){
			return false;
		}
		else{return true;}
	}
	
	
	public  boolean  Exit(String buser_name){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  count(*) a   from buser  where  buser_name='"+buser_name+"' ");
		Object ob = list.get(0).get("a");
		int a = Integer.parseInt(ob.toString());
		if(a>0){
			return false;
		}
		else{return true;}
	}
	
	//注册判断密码格式
	public boolean isPass(String pass){
		if(pass.length()>=6 && pass.length()<=20){
			return true;
		}else{
			return false;
		}
	}
	
	
}
