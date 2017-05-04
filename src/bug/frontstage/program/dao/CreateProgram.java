package bug.frontstage.program.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import bug.frontstage.program.model.Program;

public class CreateProgram {
	@Autowired(required=false)
    @Resource(name = "jdbcTemplate")  
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//����Buser����ID
	public int getBid(String buser_email){
		List<Map<String,Object>> list= jdbcTemplate.queryForList("select buser_id from buser  where  buser_email=?",new Object[]{buser_email});
		Object ob =list.get(0).get("buser_id");
		int  i = Integer.parseInt(ob.toString());
		return i;
	}
	
	
	
	//1.��Ŀ��������
	public void createProgram(Program program ,int  id,String buser_email){
		jdbcTemplate.update("insert into  program(program_id,buser_id,program_name,program_describe,program_date,program_creator)   values(SEQ_PROGRAM.nextval,?,?,?,?,?)",new Object[]{id,program.getProgram_name().toUpperCase(),program.getProgram_describe().toUpperCase(),new Date(),buser_email});
	
	}
	
	//�жϳ�Ա�Ƿ����
	public   boolean   exitMember(String buser_email){
		boolean flag= false;
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select   buser_id     from  buser where buser_email=?",new Object[]{buser_email});
		if(list.size()>0){
			flag=true;
		}
		return flag;
	}
	
	//3.�ѳ�Ա������Ŀ������Ա��
	public  void  insertProgramBuser(int    pid,int   bid){
		jdbcTemplate.update("insert into program_buser  values(SEQ_PROGRAM_BUSER.nextval,?,?)", new Object[]{pid,bid});
	}
	
	//2.�����ĿID
	public int getId(int bid,Program program){
		List<Map<String,Object>> list= jdbcTemplate.queryForList("select program_id  from program where buser_id='"+bid+"' and  program_name='"+program.getProgram_name().toUpperCase()+"'  and program_describe='"+program.getProgram_describe().toUpperCase()+"'");
		Object ob =list.get(0).get("program_id");
		int  i = Integer.parseInt(ob.toString());
		return i;
	}

	//���ҳ���Ŀ�е����г�Ա
public List<Map<String,Object>> selectAllMember(int pid){
	List<Map<String,Object>> list= jdbcTemplate.queryForList("select buser_id  from program_buser  where program_id='"+pid+"' ");

	List<Map<String, Object>> list1 =new ArrayList<>();
	for(int i=0;i<list.size();i++){
		Object ob =list.get(i).get("buser_id");
		int  bid = Integer.parseInt(ob.toString());
		List<Map<String,Object>> email = jdbcTemplate.queryForList(	"select buser_email from buser  where buser_id='"+bid+"' ");
	    String  buser_email = (String) email.get(0).get("buser_email");
	    Map<String ,Object> map =new HashMap<String ,Object>();
	    map.put("buser_email", buser_email);
	    list1.add(map);
	}	
	return list1;
}
	
	
	
//��Ʒ��������
	public void insertProduce(String name,int pid){
		jdbcTemplate.update("insert into produce values(SEQ_PRODUCE.nextval,?,?)",new Object[]{name,pid});
		
	}	
	
	//��Ŀ������Ʒ��
	public void  insertProgramProduce(int mid,int eid){		
		jdbcTemplate.update("insert into  program_produce  values(SEQ_PROGRAM_PRODUCE.nextval,?,?)",new Object[]{mid,eid});
	}
	
	//��ȡ��ƷID
	public  int getProduceId(String name)
	{
		List<Map<String,Object>> list = jdbcTemplate.queryForList("select  produce_id  from  produce where produce_name=? ",new Object[]{name});
		Object ob =list.get(0).get("produce_id");
		int  i = Integer.parseInt(ob.toString());
		return i;
	}
	
	//������Ŀ
	//��ѯ��Ŀ��ƣ���Ա������bug״̬
	public  String  selectProgramName(int pid){
		List<Map<String,Object>> list = jdbcTemplate.queryForList("select program_name from  program where  program_id='"+pid+"'");
		String program_name = (String) list.get(0).get("program_name");
		return program_name;
	}
	
	//��ӳ�Ա
	public int amountMember(int pid){
		List<Map<String,Object>> list = jdbcTemplate.queryForList("select count(*)  a  from  program_buser    where  program_id='"+pid+"'");
		Object ob =list.get(0).get("a");
		int  i = Integer.parseInt(ob.toString());
		return i;
	}
	
	public List<Map<String,Object>>  programAll(int bid){
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select program_id from program  where buser_id='" + bid + "'  ");
		List<Map<String, Object>> list1 =new ArrayList<>();
		Map<String ,Object> map =null;
		for (int i = 0; i < list.size(); i++) {
			Object ob = list.get(i).get("program_id");
			int pro_id = Integer.parseInt(ob.toString());
			
			List<Map<String, Object>> name = jdbcTemplate.queryForList("select program_name   from program   where program_id='" + pro_id + "' ");
			String pname = (String) name.get(0).get("program_name");
		    map =new HashMap<String ,Object>();
			  map.put("pname", pname);
			  map.put("pid",pro_id);
			  list1.add(map);
			}
		return list1;
		}
	
	
	//��ѯ��Ŀ������Ʒ��
	public List<Map<String,Object>> selectAllProduce(int pid){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select produce_id  from  program_produce  where  program_id=?",new Object[]{pid});
		List<Map<String, Object>> list1 =new ArrayList<>();
		for(int i=0;i<list.size();i++){
			Object ob =list.get(i).get("produce_id");
			int  bid = Integer.parseInt(ob.toString());
			List<Map<String,Object>> produce = jdbcTemplate.queryForList(	"select produce_name  from  produce  where produce_id='"+bid+"' ");
		    String   produce_name = (String)  produce.get(0).get("produce_name");
		    Map<String ,Object> map =new HashMap<String ,Object>();
		    map.put("produce_name", produce_name);
		    list1.add(map);
		}	
		return list1;
	}
	
	//����δע����û�
	public  int  register(String buser_eamil){
		int  i  =jdbcTemplate.update("INSERT INTO BUSER(buser_id,buser_name,buser_pass,buser_email)  VALUES(seq_buser.nextval,'"+buser_eamil+"', '123456',?)",new Object[]{buser_eamil});  
		return i;
	}		
	
	
	//�û�������ɫ��Ĳ���
		public  void  insertUserRoleMain(int bid,int pid){
			jdbcTemplate.update("insert into buser_role  values(?,1,SEQ_BUSER_ROLE.nextval,?)", new Object[]{bid,pid});
		}
		
	public  void  insertUserRole(int  bid,int pid){
		jdbcTemplate.update("insert into buser_role  values(?,2,SEQ_BUSER_ROLE.nextval,?)", new Object[]{bid,pid});
	}
	
	
	//ɾ���Ա
	public  void  deleteMeber(int pid,String email){
		jdbcTemplate.update("delete  from program_buser where buser_email=? and program_id=?",new Object[]{pid,email});
		
	}
	
	//Excel表格的导出
	public List<Map<String,Object>>  excel(int pid,String  date,String date1){
		return jdbcTemplate.queryForList("select bug_id,bug_type,produce_name,bug_title,bug_describe,bug_state,bug_prop,bug_signer,bug_maker,bug_plan_date,bug_lasted_date,bug_create_date,bug_repair_date  from  bug   where program_id='"+pid+"'  and bug_create_date >=to_Date('" + date + "','yyyy-mm-dd')  and bug_create_date <=to_Date('" + date1 + "','yyyy-mm-dd')");

	}
	
	//判断该项目是否有该成员，不让其反复添加
	public boolean  isProgramEmail(int pid,String buser_email){
		 List<Map<String, Object>>  list = jdbcTemplate.queryForList("select buser_id  from buser where buser_email='"+buser_email+"'");
		 Object ob = list.get(0).get("buser_id");
		 int bid= Integer.parseInt(ob.toString());
		 List<Map<String, Object>>  list1 =  jdbcTemplate.queryForList("select count(*) a  from program_buser  where program_id='"+pid+"'  and  buser_id='"+bid+"'");
		Object ob1 =  list1.get(0).get("a");
		int a = Integer.parseInt(ob1.toString());
		if(a>0){
			return false;
		}else{
			return true;
		}
	}
	
	//判断模块是否重复
public boolean isProduce(String pro_name){
	List<Map<String, Object>>  list =  jdbcTemplate.queryForList("select  count(*) a  from  produce  where  produce_name='"+pro_name+"'");
	Object ob = list.get(0).get("a");
	int num=Integer.parseInt(ob.toString());
	if(num>0){
		return false;
	}
	else{
		return true;
	}
	}

}
