package bug.frontstage.program.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.service.SelectProgramService;

@Service("SelectProServiceimp")
public class SelectProServiceimp  implements SelectProgramService {

	
	@Autowired
	private  CreateProgram createProgram;
	@Override
	public  List<Map<String,Object>>  selectProgram(int bid) {
		List<Map<String,Object>> pname = createProgram.programAll(bid);
		return pname;
	}

}
