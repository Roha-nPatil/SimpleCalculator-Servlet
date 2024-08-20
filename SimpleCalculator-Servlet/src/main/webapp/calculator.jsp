<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        height: 100vh;
    }

    #main {
        margin-top: 100px;
        height: 420px;
        width: 300px;
        background-color: #333;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        color: white;
        flex-wrap: wrap;
    }

    #cal input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: none;
        font-size: 1em;
        box-sizing: border-box;
    }

    #btn {
        width: 45%;
        padding: 10px;
        margin: 5px 2%;
        border-radius: 5px;
        border: none;
        background-color: #5c67e4;
        color: white;
        font-size: 1.5em;
        cursor: pointer;
        box-sizing: border-box;
    }

    #cal input[type="submit"]:hover {
        background-color: #4752c7;
    }

    #ans {
        background-color: #e0f7df;
        color: black;
    }

    #clearbtn {
        height: 30px;
        width: 50px;
        background-color: #9e9e9e;
        color: white;
        cursor: pointer;
        border: none;
        border-radius: 5px;
        box-sizing: border-box;
    }

    #clearbtn:hover {
        background-color: #7d7d7d;
        }
</style>
</head>
<body>
    <div id="main">
        <div id="cal">
        	<h1>Calculator</h1><hr><br>
            <form action="cal" method="get">
                <input type="text" name="num1" placeholder="Number 1" autocomplete="off" value="<%= session.getAttribute("num1") != null ? session.getAttribute("num1") : "" %>"><br><br>
                <input type="text" name="num2" placeholder="Number 2" autocomplete="off" value="<%= session.getAttribute("num1") != null ? session.getAttribute("num1") : "" %>"><br><br>

                <label id="result-label">Answer:</label>
                <input type="text" id="ans" name="result" value="<%= session.getAttribute("answer") != null ? session.getAttribute("answer") : "" %>" readonly><br>

                <input type="submit" name="clear" id="clearbtn" value="Clear"><br><br>

                <input type="submit" id="btn" name="calculationbtn" value="+">
                <input type="submit" id="btn" name="calculationbtn" value="-">
                <input type="submit" id="btn" name="calculationbtn" value="*">
                <input type="submit" id="btn" name="calculationbtn" value="/">
            </form>
        </div>
    </div>
</body>
</html>