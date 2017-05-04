package bug.frontstage.program.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.service.InsertProduceService;


@Service("InsertProduceServiceimp")
public class InsertProduceServiceimp    implements InsertProduceService{

	@Autowired
	private CreateProgram  createProgram;
	
	
	//��Ʒ��
	@Override
	public void insertProduce(String name,int pid) {
		createProgram.insertProduce(name,pid);		
	}

	//��ȡ��Ʒ��Id
	public  int getProduceId (String name){
	return 	createProgram.getProduceId(name);
	}
	
	//��Ŀ������Ʒ��
	public  void  insertProgramProduce(int mid,int eid){
		createProgram.insertProgramProduce(mid, eid);
		
	}
	
	//��ѯ��Ŀ������Ʒ������в�Ʒ��
	public List<Map<String,Object >>  selectAllProduce(int pid ){
	List<Map<String,Object>> list =  createProgram.selectAllProduce(pid);
	return list;
	}
	
	public  boolean isProduce(String pro_name){
		return createProgram.isProduce(pro_name);
	}
	
	
}
