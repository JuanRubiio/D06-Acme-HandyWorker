
package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.MiscellaneousRecord;

@Component
@Transactional
public class MiscellaneousRecordToStringConverter implements Converter<MiscellaneousRecord, String> {

	@Override
	public String convert(final MiscellaneousRecord MiscellaneousRecord) {
		String result;

		if (MiscellaneousRecord == null)
			result = null;
		else
			result = String.valueOf(MiscellaneousRecord.getId());

		return result;
	}
}
