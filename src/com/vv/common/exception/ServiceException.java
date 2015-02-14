package com.vv.common.exception;

/**
 * 数据操作层的错误
 * 
 * @author vv
 * 
 */
public class ServiceException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ServiceException() {
		super();
	}

	public ServiceException(String message) {
		super(message);
	}
}
