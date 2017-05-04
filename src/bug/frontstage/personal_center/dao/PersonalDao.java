package bug.frontstage.personal_center.dao;

import java.sql.Blob;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class PersonalDao {

	@Autowired(required=false)
    @Resource(name = "jdbcTemplate")  
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//查询共计条数
	public String totalDao(){
		
		String value =(String)jdbcTemplate.queryForObject("select count(*) a  from employee",String.class);
		return value;
	}
	
	//分页查询功能
	public List<Map<String,Object>> selectPageDao(String currpage,String everycount){
	String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
	String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
	 List<Map<String,Object>> list =jdbcTemplate.queryForList("select *  from (select rownum as num,employee_id,employee_name,employee_pass,employee_type,employee_sex,employee_phone,employee_card from employee where rownum<='"+end+"') where num>='"+begin+"'");
	  return list;
	}
	
	//删除单个用户
	public void delete(String id){
		
		jdbcTemplate.execute("delete from buser where buser_id='"+ id+"'");
	}
	
	//批量删除用户
	public void deleteAll(String ids){
		String [] id= ids.split(",");
		for(String i:id){
			jdbcTemplate.execute("delete from buser where buser_id='"+ i+"'");
		}
		
	}
	
	//查询员工信息
	public List<Map<String,Object>>SelectAll(){
		List <Map<String,Object>>list = jdbcTemplate.queryForList("select  *  from buser");
		return list;
	}
	
	
	
	//查询出修改员工信息
	public List<Map<String,Object>> updateSelect(String id){
	List <Map<String,Object>>list = jdbcTemplate.queryForList("select * from buser  where buser_id='"+id+"'");
	return list;
	}
	
	//提交修改用户信息
	public void updateSubmit(int id,String name,String pass,String mail,Blob head){
		jdbcTemplate.execute("update buser set buser_name='" +name+" ',buser_pass='"+pass+"',buser_email='"+mail+"',buser_head='"+head+"' where buser_id='"+id+"' ");
		
	}
	
	//修改用户名称
	public void updateName(int id,String name){
		jdbcTemplate.execute("update buser set buser_name = '"+name+"' where buser_id="+id);
	}
	
	//修改用户密码
	public void updatePass(int id,String pass){
		jdbcTemplate.execute("update buser set buser_pass = '"+pass+"' where buser_id="+id);
	}
	
	//修改用户邮箱
	public void updateMail(int id,String mail){
		jdbcTemplate.execute("update buser set buser_email = '"+mail+"' where buser_id="+id);
	}
	
	//修改用户头像
	public void updateHead(int id,Blob head){
		jdbcTemplate.execute("update buser set buser_head = '"+head+"' where buser_id="+id);
	}
	
	//查询当前用户名
	public String showName(int id){
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{id},java.lang.String.class);
		return name;
		
	}
	
	//再次查询更改后的数据
	public   List<Map<String,Object>> selectAll(int id){
		List<Map<String,Object>> list  = jdbcTemplate.queryForList("select * from buser where buser_id='"+id+"'");
		return list;
	}
	
		
	//验证密码
	public boolean isPass(int id,String pass){
		String _pass= (String)jdbcTemplate.queryForObject("select buser_pass from buser  where buser_id=?", new Object[]{id},java.lang.String.class);
		if(_pass.equals(pass)){
			return true;
		}else{
			return false;
		}
		
	}


	
	
	
	//头像上传
	public void  headUpload(int bid,String head){
		jdbcTemplate.update("update  buser  set buser_head=?   where buser_id='"+bid+"'",new  Object[]{head});
	}

	//判断邮箱是否存在
	public  boolean  isExit(String buser_email){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  count(*)  a   from buser  where  buser_email=? ",new Object []{buser_email});
		Object ob = list.get(0).get("a");
		int a = Integer.parseInt(ob.toString());
		if(a>0){
			return false;
		}
		else{return true;}
	}
	
	//判断用户名是否存在
	public  boolean  Exit(String buser_name){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  count(*) a   from buser  where  buser_name='"+buser_name+"' ");
		Object ob = list.get(0).get("a");
		int a = Integer.parseInt(ob.toString());
		if(a>0){
			return false;
		}
		else{return true;}
	}
	
	
}