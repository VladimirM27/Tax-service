package com.epam.motrechko.commands;

import com.epam.motrechko.FrontConstant;
import com.epam.motrechko.db.dao.DAOFactory;
import com.epam.motrechko.db.dao.UserDAO;
import com.epam.motrechko.db.entity.User;
import com.epam.motrechko.db.mysql.MySQLException;
import com.epam.motrechko.enums.Target;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.sql.SQLException;

public class RegistrationCommand extends FrontCommand{

    private static final Logger logger = LogManager.getLogger(RegistrationCommand.class);
    private final UserDAO userDAO = DAOFactory.getInstance().getUserDAO();
    @Override
    public CommandResponse process() throws ServletException, IOException {

        try {
            User user = getNewUserFromRequest(request);
            userDAO.create(user);
            logger.info("A new user is registered");
            request.getSession().setAttribute("currentUser",user);
            return new CommandResponse(Target.JSP,FrontConstant.PROFILE_USER);

        }catch (MySQLException e) {
            logger.warn("Cannot register new user: " , e);
            return new CommandResponse(Target.JSP,FrontConstant.ERROR);

        }
    }

    private User getNewUserFromRequest(ServletRequest request){
        String email = request.getParameter("emailAddress");
        String password = request.getParameter("secondPassword");
        String hashPassword = userDAO.hashPassword(password);
        String entity = request.getParameter("entity");
        String role = "user";
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String company = request.getParameter("company");
        long TIN = Long.parseLong(request.getParameter("TIN"));
        String city = request.getParameter("city");
        String street = request.getParameter("street");
        String numberOfBuilding = request.getParameter("numberOfBuilding");
        User user = new User();
        user.setEmail(email);
        user.setPassword(hashPassword);
        user.setEntity(entity);
        user.setRole(role);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setCompany(company);
        user.setTIN(TIN);
        user.setCity(city);
        user.setStreet(street);
        user.setNumberOfBuilding(numberOfBuilding);
        return user;
    }
}
