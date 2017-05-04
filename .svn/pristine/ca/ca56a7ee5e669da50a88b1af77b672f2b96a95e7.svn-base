package bug.frontstage.program.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;

@Service("ExcelService")
public class ExcelService {

	@Autowired
	private CreateProgram createProgram;
	
	public  List<Map<String, Object>>  excel(int pid,String  date,String date1){
		return createProgram.excel(pid, date, date1);
		
	}
	
}
