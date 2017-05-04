package bug.frontstage.program.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.service.SelectNameAmountService;

@Service("SelectNameServiceAmountimp")
public class SelectNameServiceAmountimp  implements  SelectNameAmountService{

	@Autowired
	private CreateProgram createProgram ;
	
	@Override
	public String selecName(int pid) {
		String name = createProgram.selectProgramName(pid);
		return name;
	}

	@Override
	public int amountMember(int pid) {
		int  i = createProgram.amountMember(pid);
		return i;
	}

}
