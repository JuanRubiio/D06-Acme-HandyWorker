package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.Application;

@Component
@Transactional	
public class ApplicationToStringConverter implements Converter<Application,String> {

	@Override
	public String convert(Application application) {
		String res;
		
		if(application==null){
			res=null;
		}else{
			res = String.valueOf(application.getId());
		}
		
		return res;
	}

}
