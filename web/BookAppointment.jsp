<%-- 
    Document   : BookAppointment
    Created on : 22 Mar, 2016, 11:57:13 AM
    Author     : Tanya
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Indian Health Services</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="shortcut icon" type="image/icon" href="images/favicon.ico"/>

    <!-- CSS
    ================================================== -->       
    <!-- Bootstrap css file-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font awesome css file-->
    <link href="css/font-awesome.min.css" rel="stylesheet">       
    <!-- Default Theme css file -->
    <link id="switcher" href="css/themes/default-theme.css" rel="stylesheet">   
    <!-- Slick slider css file -->
    <link href="css/slick.css" rel="stylesheet"> 
    <!-- Photo Swipe Image Gallery -->     
    <link rel='stylesheet prefetch' href='css/photoswipe.css'>
    <link rel='stylesheet prefetch' href='css/default-skin.css'>    

    <!-- Main structure css file -->
    <link href="style.css" rel="stylesheet">
   
    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>  
    <link href='http://fonts.googleapis.com/css?family=Habibi' rel='stylesheet' type='text/css'>   
    <link href='http://fonts.googleapis.com/css?family=Cinzel+Decorative:900' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" />

    <style>
         .main{
            background-image: none;
            background-color: black;
        }
        table{
             border: solid 1px black;
        }
         h2{
             border: solid 1px black;
        }
    </style>
    <!-- jQuery Library  -->
    <script src="js/jquery.js"></script>    
    <%
        
         Class.forName("com.mysql.jdbc.Driver");
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ihs", "root", "tanyabhardwaj");
            Calendar cal=Calendar.getInstance();
            int i=0;
        %>
    </head>
    <body>
        <!-- BEGAIN PRELOADER -->
    <div id="preloader">
      <div id="status">&nbsp;</div>
    </div>
    <!-- END PRELOADER -->

    <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-heartbeat"></i></a>
    <!-- END SCROLL TOP BUTTON -->
<header id="header">
      <!-- BEGIN MENU -->
      <div class="menu_area">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">  
          <div class="container">
            <div class="navbar-header">
              <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <!-- LOGO -->              
              <!-- TEXT BASED LOGO -->
              <a class="navbar-brand" href="index.jsp"><i class="fa fa-heartbeat"></i> <span>Indian Health Services</span></a>              
              <!-- IMG BASED LOGO  -->
              <!--  <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>   -->                    
            </div>
            <div id="navbar" class="navbar-collapse collapse">
        <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
          <li class="active"><a href="index.jsp"><span>HOME</span></a></li>
          <li><a href="login.jsp"><span>LOGIN</span></a></li>
          <li><a href="register.jsp"><span>REGISTER</span></a></li>
          <li><a href="contact.jsp"><span>CONTACT US</span></a></li>
              <li><a href="aboutus.jsp"><span>ABOUT US</span></a></li>
              <li>  <a href="#"><span>FIRST AID</span></a></li>
              <li>    <a href="#"><span>DISEASES</span></a></li>
              <li> <a href="Feedback.jsp"><span>FEEDBACK</span></a></li>
          </UL>
       </div>
          </div>
        </nav>
      </div>
</header>
       <div class="row">  
                <div class="single-top-feature">
         
       
          <h1><a href="index.jsp"><span></span> <small style="color:blue;"></small></a></h1>
            <h2 class="star"> <span></span> </h2>
         
          <ul class="sb_menu">
              
          
            <li><a href=""></a></li>
             <li><a href=""></a></li>
             <li><a href="#"></a></li>
          </ul>
         
              <table>
            <tr>`
            <th>DATE</th><th>MORNING</th><th>AFTERNOON</th><th>EVENING</th>
            </tr>
            <% 
                for(i=0;i<15;i++)
                {
                    cal.add(Calendar.DAY_OF_MONTH, i);
                    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                        
                
            %>
            <tr>
                <td>
                    <% 
                    
            out.println(format1.format(cal.getTime()));
                    %>
                </td><td>
                    <table>
                        <% PreparedStatement getmslots=conn.prepareStatement("select slot_id,start_time,end_time from doctor_slot where doctor_id=? and slot_status='morning' and slot_id NOT IN (select slot_id from appointments where appointment_date=?) ");
            getmslots.setString(1, "1");
            getmslots.setDate(2, new java.sql.Date(cal.getTimeInMillis()));
            ResultSet mslots=getmslots.executeQuery();
                            while(mslots.next())
                        { 
                           %>
                           <tr>
                               <td><%=mslots.getString("start_time")%></td>
                               <td><%=mslots.getString("end_time")%></td>
                               
                                       <td><form action="AppointmentServlet">
                                               <input type="hidden" name="slot_id" value="<%=mslots.getString("slot_id")%>">
                                               <input type="hidden" name="appointment_date" value="<%=cal.getTimeInMillis()%>">
                                               <button>BOOK</button>
                                   </form>
                                   </td>
                        </tr>
                        <% 
                        }%>
                        
                        
                    </table>
                </td>
                <td>
                    <table>
                        <% PreparedStatement getaslots=conn.prepareStatement("select slot_id,start_time,end_time from doctor_slot where doctor_id=? and slot_status='afternoon' and slot_id NOT IN (select slot_id from appointments where appointment_date=?) ");
            getaslots.setString(1, "1");
            getaslots.setDate(2, new java.sql.Date(cal.getTimeInMillis()));
            ResultSet aslots=getaslots.executeQuery();
                            while(aslots.next())
                        { 
                           %>
                           <tr>
                               <td><%=aslots.getString("start_time")%></td>
                               <td><%=aslots.getString("end_time")%></td>
                               
                                       <td><form action="AppointmentServlet">
                                               <input type="hidden" name="slot_id" value="<%=aslots.getString("slot_id")%>">
                                               <input type="hidden" name="appointment_date" value="<%=cal.getTimeInMillis()%>">
                                               <button>BOOK</button>
                                   </form>
                                   </td>
                        </tr>
                        <% 
                        }%>
                        
                        
                    </table>
                </td>
                <td>
                    <table>
                        <% PreparedStatement geteslots=conn.prepareStatement("select slot_id,start_time,end_time from doctor_slot where doctor_id=? and slot_status='evening' and slot_id NOT IN (select slot_id from appointments where appointment_date=?) ");
            geteslots.setString(1, "1");
            geteslots.setDate(2, new java.sql.Date(cal.getTimeInMillis()));
            ResultSet eslots=geteslots.executeQuery();
                            while(eslots.next())
                        { 
                           %>
                           <tr>
                               <td><%=eslots.getString("start_time")%></td>
                               <td><%=eslots.getString("end_time")%></td>
                               
                                       <td><form action="AppointmentServlet">
                                               <input type="hidden" name="slot_id" value="<%=eslots.getString("slot_id")%>">
                                               <input type="hidden" name="appointment_date" value="<%=cal.getTimeInMillis()%>">
                                               <button>BOOK</button>
                                   </form>
                                   </td>
                        </tr>
                        <% 
                        }%>
                        
                        
                    </table>
                </td>
            </tr>
            <% } %>
                
           </table>
                <BR>
                <BR>
               
                <h2 style=" text-align: center; color:black;  ">RS.100 EXTRA FOR ONLINE BOOKING </h2>
</div>
</div>
 <!--=========== Start Footer SECTION ================-->
      <footer id="footer">
      <!-- Start Footer Top -->
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>About Us</h2>
                <div class="line"></div>
              </div>           
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>Our Service</h2>
                <div class="line"></div>
              </div>
              <ul class="footer-service">
                <li><a href="#"><span class="fa fa-check"></span>Service 1</a></li>
                <li><a href="#"><span class="fa fa-check"></span>Service 2</a></li>
                <li><a href="#"><span class="fa fa-check"></span>Service 3</a></li>
                <li><a href="#"><span class="fa fa-check"></span>Service 4</a></li>
                <li><a href="#"><span class="fa fa-check"></span>Service 5</a></li>
              </ul>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>Tags</h2>
                <div class="line"></div>
              </div>
                <ul class="tag-nav">
                  <li><a href="#">Dental</a></li>
                  <li><a href="#">Surgery</a></li>
                  <li><a href="#">Pediatric</a></li>
                  <li><a href="#">Cardiac</a></li>
                  <li><a href="#">Ophthalmology</a></li>
                  <li><a href="#">Diabetes</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>Contact Info</h2>
                <div class="line"></div>
              </div>
              <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</p>
              <address class="contact-info">
                <p><span class="fa fa-home"></span>305 Intergraph Way
                Madison, AL 35758, USA</p>
                <p><span class="fa fa-phone"></span>1.256.730.2000</p>
                <p><span class="fa fa-envelope"></span>info@wpfmedinova.com</p>
              </address>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Start Footer Middle -->
      <div class="footer-middle">
        <div class="container">
          <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="footer-copyright">
              <p>&copy; Copyright 2015 <a href="index.html">WpF Medinova</a></p>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="footer-social">              
                <a href="#"><span class="fa fa-facebook"></span></a>
                <a href="#"><span class="fa fa-twitter"></span></a>
                <a href="#"><span class="fa fa-google-plus"></span></a>
                <a href="#"><span class="fa fa-linkedin"></span></a>     
            </div>
          </div>
        </div>
        </div>
      </div>
      <!-- Start Footer Bottom -->
      <div class="footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <p>Design & Developed By <a rel="nofollow" href="http://www.wpfreeware.com/">WpF Freeware</a></p>
            </div>
          </div>
        </div>
      </div>
    </footer>
<!--=========== End Footer SECTION ================-->
     <!-- Bootstrap default js --> 
    <script src="js/bootstrap.min.js"></script>
    <!-- slick slider -->
    <script src="js/slick.min.js"></script>    
   <script type="text/javascript" src="js/modernizr.custom.79639.js"></script>    
    <!-- counter -->
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <!-- Doctors hover effect -->
    <script src="js/snap.svg-min.js"></script>
    <script src="js/hovers.js"></script>
    <!-- Photo Swipe Gallery Slider -->
    <script src='js/photoswipe.min.js'></script>
    <script src='js/photoswipe-ui-default.min.js'></script>    
    <script src="js/photoswipe-gallery.js"></script>
 <script src="js/custom.js"></script>
    </body>
</html>
