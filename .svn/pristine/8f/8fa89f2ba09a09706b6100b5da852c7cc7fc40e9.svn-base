package bug.frontstage.common.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("common")
public class CommonDispatcher {
	
	@RequestMapping("/{view}")
	public String dispatcher(@PathVariable String view){
		return view;
	}
}
