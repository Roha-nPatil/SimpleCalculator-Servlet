package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cal")
public class Calculator extends HttpServlet{
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Check if the clear button was clicked
        String clear = req.getParameter("clear");
        if (clear != null && clear.equals("Clear")) {
            // Reinitialize the answer to 0 and clear other input fields
            session.setAttribute("answer", "0");
            session.setAttribute("num1", "");
            session.setAttribute("num2", "");
            resp.sendRedirect("calculator.jsp");
            return;
        }

        // Get parameters num1 and num2 from calculator.jsp
        String s1 = req.getParameter("num1");
        String s2 = req.getParameter("num2");

        if (s1 == null || s2 == null || s1.isEmpty() || s2.isEmpty()) {
            session.setAttribute("answer", "Please enter both numbers");
            resp.sendRedirect("calculator.jsp");
            return;
        }

        try {
            // Parsing String s1 and s2 into integers
            int number1 = Integer.parseInt(s1);
            int number2 = Integer.parseInt(s2);

            // Store the numbers in the session
            session.setAttribute("num1", s1);
            session.setAttribute("num2", s2);

            // Get the calculation type from the form
            String calculation = req.getParameter("calculationbtn");
            int ans = 0;

            // Perform the calculation based on the selected operation
            switch (calculation) {
                case "+":
                    ans = number1 + number2;
                    break;
                case "-":
                    ans = number1 - number2;
                    break;
                case "*":
                    ans = number1 * number2;
                    break;
                case "/":
                    if (number2 != 0) {
                        ans = number1 / number2;
                    } else {
                        session.setAttribute("answer", "Division by zero error");
                        resp.sendRedirect("calculator.jsp");
                        return;
                    }
                    break;
                default:
                    session.setAttribute("answer", "Invalid Input");
                    resp.sendRedirect("calculator.jsp");
                    return;
            }

            // Store the result in the session
            session.setAttribute("answer", ans);

        } catch (NumberFormatException e) {
            session.setAttribute("answer", "Enter a valid number format");
        } catch (Exception e) {
            session.setAttribute("answer", "Error occurred");
        }

        // Redirect back to the main page
        resp.sendRedirect("calculator.jsp");
    }
}
