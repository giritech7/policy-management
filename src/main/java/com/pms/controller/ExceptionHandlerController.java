package com.pms.controller;

import java.sql.SQLException;

import javax.validation.ConstraintViolationException;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(ConstraintViolationException.class)
	public String conflict(Model model, Exception ex) {
		model.addAttribute("error", "An error occurred at the server.Please try again later or contact support team");
		return "dberror";
	}

	// Specify name of a specific view that will be used to display the error:
	@ExceptionHandler({ SQLException.class, DataAccessException.class })
	public String databaseError(Model model, Exception ex) {
		// Nothing to do. Returns the logical view name of an error page, passed
		// to the view-resolver(s) in usual way.
		// Note that the exception is NOT available to this view (it is not
		// added
		// to the model) but see "Extending ExceptionHandlerExceptionResolver"
		// below.
		model.addAttribute("error", "An error occurred at the server.Please try again later or contact support team");
		return "dberror";
	}

	// Total control - setup a model and return the view name yourself. Or
	// consider subclassing ExceptionHandlerExceptionResolver (see below).
	@ExceptionHandler(Exception.class)
	public String handleError(Model model, Exception ex) {

		model.addAttribute("error", "An error occurred at the server.Please try again later or contact support team");
		return "dberror";
	}
	
	@RequestMapping(value = {"/dberror"}, method = RequestMethod.GET)
    public String home(Model model) {
        return "dberror";
    }
}
