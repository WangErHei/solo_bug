package bug.frontstage.project_info.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.DeleteService;


@Service("DeleteServiceimp")
public class DeleteServiceimp  implements  DeleteService{

	
	@Autowired
	private  SelectProgram  selectProgram;
	
	
	@Override
	//删除产品模块
	public void deleteP(String name, int pid) {
		selectProgram.deleteP(name, pid);
		
	}


	@Override
	public void deleteM(String name, int pid) {
		selectProgram.deleteM(name, pid);
		
	}

	public boolean isDelete(int pid,String name){
		return selectProgram.isDelete(pid, name);
		
	}
	
	
	
}
