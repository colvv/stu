package com.vv.common.util;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class PubFun {
	public static boolean randomBoolean() {
		return ((int) (Math.random() * 100)) % 2 == 0;
	}

	/**
	 * 将request的所有参数进行转换
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map parseReuest_all(HttpServletRequest request) {
		Map tMap = new HashMap();
		Set<String> key = request.getParameterMap().keySet();
		for (Iterator it = key.iterator(); it.hasNext();) {
			String keyWord = (String) it.next();
			tMap.put(keyWord, request.getParameter(keyWord));
		}
		return tMap;
	}

	/**
	 * 获取当前yyyy-mm-dd
	 * 
	 * @return
	 * @author wangyi 2015-1-27
	 */
	public static String getCurrentDate() {
		return getCurrentDate("yyyy-MM-dd");
	}

	/**
	 * 获取当前时间指定格式
	 * 
	 * @param pattern
	 * @return
	 * @author wangyi 2015-1-27
	 */
	public static String getCurrentDate(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		Date today = new Date();
		String tString = df.format(today);
		return tString;
	}

	/**
	 * 获取当前时间
	 * 
	 * @return
	 * @author wangyi 2015-1-27
	 */
	public static String getCurrentTime() {
		String pattern = "HH:mm:ss";
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		Date today = new Date();
		String tString = df.format(today);
		return tString;
	}

	/**
	 * 是否闰年
	 * 
	 * @param nYear
	 * @return
	 * @author sinosoft
	 */
	public static boolean isLeapYear(int nYear) {
		return (nYear % 400 == 0) | (nYear % 100 != 0) & (nYear % 4 == 0);
	}

	/**
	 * 是否闰年
	 * 
	 * @param nYear
	 * @return
	 * @author sinosoft
	 */
	public static boolean isLeapYear(String nYear) {
		return isLeapYear(Integer.parseInt(nYear));
	}

	/**
	 * 右补全字符串
	 * 
	 * @param sourString
	 * @param cChar
	 * @param cLen
	 * @return
	 * @author sinosoft
	 */
	public static String RCh(String sourString, String cChar, int cLen) {
		return LRCh(sourString, cChar, cLen, false);
	}

	/**
	 * 左补全字符串
	 * 
	 * @param sourString
	 * @param cChar
	 * @param cLen
	 * @return
	 * @author sinosoft
	 */
	public static String LCh(String sourString, String cChar, int cLen) {
		return LRCh(sourString, cChar, cLen, true);
	}

	private static String LRCh(String sourString, String cChar, int cLen, boolean LR) {
		int tLen = sourString.length();
		int i, iMax;
		String tReturn = "";
		if (tLen >= cLen) {
			return sourString;
		}
		iMax = cLen - tLen;
		for (i = 0; i < iMax; i++) {
			tReturn += cChar;
		}
		if (LR)
			tReturn = tReturn.trim() + sourString.trim();
		else
			tReturn = sourString.trim() + tReturn.trim();
		return tReturn;
	}

	/**
	 * 
	 * 格式化数字梯�? ~~start
	 * 
	 */
	public static String s_Double(Object target, int count) {
		return s_Dec_Double(target, getSimpleFormatter(count));
	}

	public static String s_Double(Object target) {
		return s_Double(target, 2);
	}

	public static double f_Double(Object target, int count) {
		return f_Dec_Double(target, getSimpleFormatter(count));
	}

	public static double f_Double(Object target) {
		return f_Double(target, 2);
	}

	public static String Cash_Double(Object target) {
		return Cash_Double(target, 2);
	}

	public static String Cash_Double(Object target, int count) {
		return s_Dec_Double(target, getSimpleFormatter("##,##0.", count));
	}

	public static double f_DecUP_Double(Object target) {
		return f_DecUP_Double(target, 2);
	}

	public static double f_DecDown_Double(Object target) {
		return f_DecDown_Double(target, 2);
	}

	public static double f_DecUP_Double(Object target, int scale) {
		return f_Dec_Double(target, getSimpleFormatter(scale), RoundingMode.UP);
	}

	public static double f_DecDown_Double(Object target, int scale) {
		return f_Dec_Double(target, getSimpleFormatter(scale), RoundingMode.DOWN);
	}

	public static String s_Dec_Double(Object target, String tFormatter) {
		return s_Dec_Double(target, tFormatter, RoundingMode.HALF_UP);
	}

	public static double f_Dec_Double(Object target, String tFormatter) {
		return f_Dec_Double(target, tFormatter, RoundingMode.HALF_UP);
	}

	public static double f_Dec_Double(Object target, String tFormatter, RoundingMode tMode) {
		return getDouble(s_Dec_Double(target, tFormatter, tMode));
	}

	public static String s_Dec_Double(Object target, String tFormatter, RoundingMode tMode) {
		DecimalFormat df = new DecimalFormat(tFormatter);
		df.setRoundingMode(tMode);
		try {
			return df.format(getDouble(target));
		} catch (Exception e) {
			e.printStackTrace();
			return "0.00";
		}
	}

	/**
	 * 获取double返回值，没有的话返回0，如果不是数字返�?0
	 * 
	 * @param target
	 * @return
	 */
	public static double getDouble(Object target) {
		try {
			return Double.parseDouble(String.valueOf(target));
		} catch (NumberFormatException e) {
			return 0.0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0.0;
		}
	}

	private static String getSimpleFormatter(int count) {
		return getSimpleFormatter("0.", count);
	}

	private static String getSimpleFormatter(String BasicString, int count) {
		StringBuffer formatter = new StringBuffer(BasicString);
		if (count <= 0) {
			// 2015-1-16 @wangyi : 当格式化金额类型时有bug -- new StringBuffer("0");
			// 2015-1-28 @wangyi : replaceAll有问题，.属于保留�?
			formatter = new StringBuffer(BasicString.replace(".", ""));
		} else {
			for (int i = 0; i < count; i++) {
				formatter.append("0");
			}
		}
		return formatter.toString();
	}

	// 2014-7-12 @wangyi : 废弃
	// private static double f_Big_Double(Object target, int scale, int decMode)
	// {
	// try {
	// return new BigDecimal(String.valueOf(target)).setScale(scale,
	// decMode).doubleValue();
	// } catch (Exception e) {
	// logger.debug("数字转换失败�?" + target);
	// e.printStackTrace();
	// return 0;
	// }
	// }

	public static int getInt(String target) {
		try {
			return Integer.parseInt(target);
		} catch (NumberFormatException e) {
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 获取double返回值，严格校验，没有的话返�?-1，如果不是数字返�?-1
	 * 
	 * @param target
	 * @return
	 */
	public static double getDoubleStrict(String target) {
		if (checkNecessaryString(target)) {
			try {
				return Double.parseDouble(target);
			} catch (NumberFormatException e) {
				return -1;
			}
		} else {
			return -1;
		}
	}

	public static boolean checkNecessaryString(String element) {
		if ("".equals(element) || element == null) {
			return false;
		}
		return true;
	}

	public static String getNullToEmpty(Object target) {
		if (checkNecessaryString((String) target)) {
			return (String) target;
		} else {
			return "";
		}
	}

}
