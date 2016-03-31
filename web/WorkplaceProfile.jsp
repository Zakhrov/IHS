<%-- 
    Document   : WorkplaceProfile
    Created on : 15 Mar, 2016, 10:53:09 PM
    Author     : Tanya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indian Health Services</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
    <style>
         .main{
            background-image: none;
            background-color: black;
        }
         table{
            border: 1px solid black;
            border-spacing: 20px;
        }
        td{
             border: solid 1px black;
             padding: 10px;
        }
         th{
            border: solid 1px black;
             padding: 10px;
        }
        </style>
        <script>
             function _(el){
	return document.getElementById(el);
}
function uploadFile(){
	var file = _("file1").files[0];
	// alert(file.name+" | "+file.size+" | "+file.type);
	var formdata = new FormData();
	formdata.append("file", file);
	var ajax = new XMLHttpRequest();
	ajax.upload.addEventListener("progress", progressHandler, false);
	ajax.addEventListener("load", completeHandler, false);
	ajax.addEventListener("error", errorHandler, false);
	ajax.addEventListener("abort", abortHandler, false);
	ajax.open("POST", "DocProfileServlet");
	ajax.send(formdata);
}
function progressHandler(event){
	_("loaded_n_total").innerHTML = "Uploaded "+event.loaded+" bytes of "+event.total;
	var percent = (event.loaded / event.total) * 100;
	_("progressBar").value = Math.round(percent);
	_("status").innerHTML = Math.round(percent)+"% uploaded... please wait";
}
function completeHandler(event){
	_("status").innerHTML = event.target.responseText;
	_("progressBar").value = 0;
}
function errorHandler(event){
	_("status").innerHTML = "Upload Failed";
}
function abortHandler(event){
	_("status").innerHTML = "Upload Aborted";
}
    </script>
    </style>
    </head>
    <body>
        <div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.jsp"><span>HOME</span></a></li>
          <li><a href="login.jsp"><span>LOGIN</span></a></li>
          <li><a href="register.jsp"><span>REGISTER</span></a></li>
          <li><a href="contact.jsp"><span>CONTACT US</span></a></li>
        </ul>
          <BR>
           <ul>
              <li><a href="aboutus.jsp"><span>ABOUT US</span></a></li>
              <li>  <a href="#"><span>FIRST AID</span></a></li>
              <li>    <a href="#"><span>DISEASES</span></a></li>
              <li> <a href="Feedback.jsp"><span>FEEDBACK</span></a></li>
          </UL>
      </div>
      <div class="logo">
          <h1><a href="index.html"><span>INDIAN HEALTH SERVICES</span> <small style="color:blue;">HELPING MANKIND</small></a></h1>
      </div>
      <div class="clr"></div>
    </div>
  </div>
            <div class="content">
    <div class="content_resize">
         <div class="sidebar">
        <div class="clr"></div>
        <div class="gadget">
            <BR>
            <BR>
            <BR>
            <h2 class="star"> <span>SERVICES</span> </h2>
          <div class="clr"></div>
          <ul class="sb_menu">
             <li><a href="WorkplaceBranches,jsp">ADD BRANCHES</a></li>
            
            <li><a href="Feedback.jsp">GIVE YOUR FEEDBACK</a></li>
            <li><a href="index.jsp">LOGOUT</a></li>
                      </ul>
            <br>
         
        </div>
        
      </div>
        <div class="mainbar">
            <div class="article">
              
                  <h1 style="color:black;align-content: center "></H1>
                  <BR>
                  <button style="font-size:25px" type="submit">EDIT YOUR PROFILE</button>
             
                    <BR>
                    <BR>
           <form id="upload_form" enctype="multipart/form-data" method="post">
                        <table>
                            <tr style="border: 1px solid black">
                                <td>
                                    <br>
                                    <BR>
  <input type="file" name="file" id="file1"><br>
  <input type="button" value="UPLOAD PHOTO" onclick="uploadFile()">
  <progress id="progressBar" value="0" max="100" style="width:100px;"></progress>
  <h3 id="status"></h3>
  <p id="loaded_n_total"></p>
                                </td>
                                 <td>  <textarea rows="4" cols="30">

                        </textarea> </td>
       </tr>
                        </table>
</form> 
                          
                    
                <form action="WorkplaceProfile" method="post">         
  <table>
       
        <tr style="border: 1px solid black">
           
               <td> STATE:<select name="Type">
               <option value="karnataka">Karnataka</option>
                <option value="punjab">Punjab</option>
                <option value="Kerela">Kerela</option>
                   </select>  </td>

               <td> CITY:<select name="Type">
               <option value="Delhi">Delhi</option>
                <option value="Banglore">Banglore</option>
                <option value="Amritsar">Amritsar</option>
                <option value="Gurgaon">Gurgaon</option>
                <option value="Rajisthan">Rajisthan</option>
                <option value="Jalandhar">Jalandhar</option>
                <option value="Ludhiana">Ludhiana</option>
                
                   </select>  </td> 
  </tr>
  <br>
   <tr style="border: 1px solid black">
  <th>ADDRESS: </th>
   <td>  <textarea rows="4" cols="30">

                        </textarea> </td>
  </tr>
   <tr style="border: 1px solid black">
      <th>AREA:</th>
       <td>  <textarea rows="2" cols="30">

                        </textarea> </td>
  </tr>
   <tr style="border: 1px solid black">
      <th>TYPE </th>
      <td>
           <form>
  <input type="radio" name="type" value="government">GOVERNMENT
  <input type="radio" name="type" value="private">PRIVATE
 
</form> 
      </td>
  </tr>
   <tr style="border: 1px solid black">
      <th>TIMINGS</th>
       <td>  <textarea rows="1" cols="30">

                        </textarea> </td>
  </tr>
    <tr style="border: 1px solid black">
      <th>WEBSITE</th>
       <td>  <textarea rows="1" cols="30">

                        </textarea> </td>
  </tr>
  <br>
  </table>
                    <br>
   <button style="font-size:25px" type="submit">SAVE</button>
   <button style="font-size:25px" type="reset">CANCEL</button> 
   </form>      
          </div>
        </div>
          
       
      <div class="clr"></div>
      <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="#">MyWebSite</a>.</p>
      <p class="rf">Design by Dream <a href="http://www.dreamtemplate.com/">Web Templates</a></p>
      <div style="clear:both;"></div>
    </div>
  </div>
  
        </div>
    </body>
</html>
