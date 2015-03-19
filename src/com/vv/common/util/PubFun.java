package com.vv.common.util;

import java.math.RoundingMode;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.vv.common.exception.ServiceException;

public class PubFun {

	protected final static Log logger = LogFactory.getLog(PubFun.class);

	public static boolean randomBoolean() {
		return ((int) (Math.random() * 100)) % 2 == 0;
	}

	/**
	 * 将request的所有参数进行转换
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map parseReuest_all(HttpServletRequest request) {
		// 2015-3-19 @wangyi :  真的太傻？
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
	public static Date calDate(Date baseDate, int interval, String unit,
			Date compareDate) {
		Date returnDate = null;

		GregorianCalendar tBaseCalendar = new GregorianCalendar();
		tBaseCalendar.setTime(baseDate);

		if (unit.equals("Y")) {
			tBaseCalendar.add(Calendar.YEAR, interval);
		}
		if (unit.equals("M")) {
			tBaseCalendar.add(Calendar.MONTH, interval);
		}
		if (unit.equals("D")) {
			tBaseCalendar.add(Calendar.DATE, interval);
		}

		if (compareDate != null) {
			GregorianCalendar tCompCalendar = new GregorianCalendar();
			tCompCalendar.setTime(compareDate);
			int nBaseYears = tBaseCalendar.get(Calendar.YEAR);
			int nBaseMonths = tBaseCalendar.get(Calendar.MONTH);
			int nCompMonths = tCompCalendar.get(Calendar.MONTH);
			int nCompDays = tCompCalendar.get(Calendar.DATE);
			int oldDays = tCompCalendar.get(Calendar.DATE);

			if (unit.equals("Y")) {
				// 2014-7-9 @wangyi : 好一个目前看来- -#
				/*
				 * 目前来看，compareDate非空的情况下unit一定是Y，这样确保新日期的月和日是不变的，但是此时还需要考虑一种情况，
				 * 如果旧日期是闰年2
				 * -29，例如2008-2-29，而新的年份为非闰年，例如2038，拼在一起为2038-2-29，对于此种数据，
				 * tCompCalendar.set(nBaseYears, nCompMonths,
				 * nCompDays)将会自动将其置为2038-3-1，为了避免出现此问题， 我们需要特殊处理nCompDays
				 */
				// 特殊处理1，如果旧日期为润年2-29，新年份nBaseYears为非闰年，日nCompDays只能为28
				if (1 == nCompMonths && 29 == oldDays
						&& !isLeapYear(nBaseYears)) {
					nCompDays = 28;
				}
				tCompCalendar.set(nBaseYears, nCompMonths, nCompDays);
				if (tCompCalendar.before(tBaseCalendar)) {
					// 特殊处理2，如果旧日期为润年2-29，新年份nBaseYears+1为非闰年，日nCompDays只能为28
					if (1 == nCompMonths && 29 == oldDays
							&& !isLeapYear(nBaseYears + 1)) {
						nCompDays = 28;
					}
					// 特殊处理3，如果旧日期为润年2-29，新年份nBaseYears为非闰年，日nCompDays在特殊处理1中改为28
					// 但是如果nBaseYears+1为闰年，需要还原nCompDays，实际上就是29。
					if (1 == nCompMonths && 29 == oldDays
							&& isLeapYear(nBaseYears + 1)) {
						nCompDays = oldDays;
					}
					tBaseCalendar.set(nBaseYears + 1, nCompMonths, nCompDays);
					returnDate = tBaseCalendar.getTime();
				} else {
					returnDate = tCompCalendar.getTime();
				}
			}
			if (unit.equals("M")) {
				// 2014-7-9 @wangyi : 月处理日会用到参考日期，所以这里的逻辑修改
				tCompCalendar.set(nBaseYears, nBaseMonths, nCompDays);
				if (nBaseMonths < tCompCalendar.get(Calendar.MONTH)) {
					// 取当前月的最后一天日期
					tCompCalendar.set(nBaseYears, nBaseMonths + 1, 0);
				}
				if (tCompCalendar.before(tBaseCalendar)) {
					tBaseCalendar.set(nBaseYears, nBaseMonths + 1, nCompDays);
					returnDate = tBaseCalendar.getTime();
				} else {
					returnDate = tCompCalendar.getTime();
				}
			}
			if (unit.equals("D")) {
				returnDate = tBaseCalendar.getTime();
			}
			tCompCalendar = null;
		} else {
			returnDate = tBaseCalendar.getTime();
		}
		tBaseCalendar = null;

		return returnDate;
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

	public static String MD5Encode(String strSrc, String key) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(strSrc.getBytes("UTF8"));
			StringBuffer result = new StringBuffer(32);
			byte[] temp;
			temp = md5.digest(key.getBytes("UTF8"));
			for (int i = 0; i < temp.length; i++) {
				result.append(Integer.toHexString((0x000000ff & temp[i]) | 0xffffff00).substring(6));
			}
			return result.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * ques is simple there is some data like 1|0,2|0,3|0,101|1 ...... after the
	 * func the data should like a tree 将有数特征的数据转化为实际的数据结构
	 * 
	 * @return
	 */

	public static List<Map> formatTree(List<Map> tTreeSource, String tRootEle, String tNodeName) {
		Map<String, List<Map>> tParentsMap = new HashMap<>();
		String tNodeID;
		String tParentID;
		List<Map> tSonList;
		for (Map tNode : tTreeSource) {
			tNodeID = (String) tNode.get(tNodeName);
			// @wangyi 2015-3-3 还是特别注意一下这点
			tParentID = tNodeID.split("\\|")[1];
			tSonList = tParentsMap.get(tParentID);
			if (tSonList == null) {
				tSonList = new ArrayList<>();
			}
			tSonList.add(tNode);
			tParentsMap.put(tParentID, tSonList);
		}
		// @wangyi 2015-3-3 after 循环，数据为 父节点为0的 【1，2，3，4】 父节点为1的【5，6，7，8】....
		// List<Map> tResult = treeHelper(tParentsMap, tRootEle, tNodeName);
		// @wangyi 2015-3-3 应该开始递归了
		return treeHelper(tParentsMap, tRootEle, tNodeName);
	}

	private static List<Map> treeHelper(Map<String, List<Map>> tParentsMap, String tCurrentEle, String tNodeName) {
		List<Map> tNodes = tParentsMap.get(tCurrentEle);
		List<Map> tResult = new ArrayList<>();
		String tNodeID;
		String tFatherID;
		List<Map> tSonList;
		Map tNodeMap;
		for (Map tNode : tNodes) {
			tNodeID = (String) tNode.get(tNodeName);
			tFatherID = tNodeID.split("\\|")[0];
			tSonList = tParentsMap.get(tFatherID);
			tNodeMap = new HashMap<>();
			if (tSonList != null) {
				// @wangyi 2015-3-3 此处递归
				tNodeMap.put(tNode, treeHelper(tParentsMap, tFatherID, tNodeName));
			} else {
				tNodeMap.put(tNode, null);
			}
			tResult.add(tNodeMap);
		}
		return tResult;
	}

	public static void throwServiceException(Exception e) {
		logger.error("service层处理出现异常：" + e.toString());
		e.printStackTrace();
		throw new ServiceException("数据处理失败");
	}

	public static String getZtreeHtml(List<Map> tDatas, String tID,String tName, List<String> tElements) {
		StringBuffer tList = new StringBuffer(256);
		tList.append("[");
		String menu_id;
		String[] id_pid;
		for (Map tData : tDatas) {
			menu_id = (String) tData.get(tID);
			id_pid = menu_id.split("\\|");
			if (id_pid.length != 2) {
				continue;
			}
			tList.append("{id:'" + id_pid[0] + "',");
			tList.append("pId:'" + id_pid[1] + "',");
			tList.append("name:'" + (String) tData.get(tName) + "',");
			// 2015-1-26 @wangyi : 增强用户体验，一级的默认打开
			if ("0".equals(id_pid[1])) {
				tList.append("open:true,");
			}
			for (String tEle : tElements) {
				tList.append(tEle + ":'" + (String) tData.get(tEle) + "',");
			}
			// tList = new StringBuffer(tList.substring(0, tList.length() - 1));
			tList.append("},");
		}
		// if (tDatas.size() != 0)
		// tList = new StringBuffer(tList.substring(0, tList.length() - 1));
		tList.append("]");
		return tList.toString();
	}
	public static String getSimpleDate(String tDate){
		if (PubFun.checkNecessaryString(tDate)) {
			tDate = tDate.replace("-", "");
			tDate = tDate.replace("/", "");
		} else {
			tDate = "0";
		}
		return tDate;
	}
}
