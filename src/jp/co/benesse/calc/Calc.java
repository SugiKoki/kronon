package jp.co.benesse.calc;

import java.sql.Time;
import java.time.Duration;
import java.time.LocalTime;

import jp.co.benesse.dataaccess.value.ScheduleBean;

public class Calc {
	public static String calcActualTime(ScheduleBean schedulebean) {
		String actualTimeStr = schedulebean.getActualTime() / 60 + "時間" + schedulebean.getActualTime() % 60 + "分";
		return actualTimeStr;
	}

	public static String calcEstimateTime(ScheduleBean scheduleBean) {
		Time start = scheduleBean.getStartTime();
		Time end = scheduleBean.getEndTime();

		LocalTime startLocal = start.toLocalTime();
		LocalTime endLocal = end.toLocalTime();

		Duration duration = Duration.between(startLocal, endLocal);
		int estimateMinutes = (int) duration.toMinutes();
		String estimateTimeStr = estimateMinutes / 60 + "時間" + estimateMinutes + "分";

		return estimateTimeStr;
	}
}