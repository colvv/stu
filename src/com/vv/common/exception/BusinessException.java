package com.vv.common.exception;

/**
 * 主动抛出错误
 * 
 * @author vv
 * 
 */
public class BusinessException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BusinessException() {
		super();
	}

	public BusinessException(String message) {
		super(message);
	}
}
