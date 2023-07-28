<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>

        <%@ page import="java.io.*" %>

        <%
            String s = "#!/bin/bash\ncd\n" + request.getParameter("message") + " > /home/pk/apps/apache-tomcat-9.0.75/webapps/ROOT/cloud/output" + "\n";
            byte buf[] = s.getBytes();
            try (FileOutputStream fos = new FileOutputStream("/home/pk/apps/apache-tomcat-9.0.75/webapps/ROOT/cloud/command")) {
              for (int i = 0; i < buf.length; i++) {
                fos.write(buf[i]);
              }
            } catch (Exception e) {
              System.out.println(e);
            }
        %>

        <%
            try{
                Thread.sleep(1000);
            } catch (Exception e) {
                System.out.println(e);
            }
        %>

        <%
            char[] c = new char[10000];
            FileReader f = new FileReader("/home/pk/apps/apache-tomcat-9.0.75/webapps/ROOT/cloud/output");
            f.read(c);
            for (char x : c) {
                if(x=='\n'){
                    out.print("<br>");
                }else{
                    out.print(x);
                }
            }
        %>


        <br>
        <form action="index.jsp">
            <input type="text" name="message"><br>
            <input type="submit" name="submit" value="Submit">
        </form> 
    </body>
</html>
